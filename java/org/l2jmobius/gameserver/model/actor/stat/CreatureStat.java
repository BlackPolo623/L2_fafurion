/*
 * Copyright (c) 2013 L2jMobius
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package org.l2jmobius.gameserver.model.actor.stat;

import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.OptionalDouble;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.function.BiFunction;

import org.l2jmobius.Config;
import org.l2jmobius.gameserver.enums.AttributeType;
import org.l2jmobius.gameserver.enums.Position;
import org.l2jmobius.gameserver.model.actor.Creature;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.effects.AbstractEffect;
import org.l2jmobius.gameserver.model.item.instance.Item;
import org.l2jmobius.gameserver.model.skill.AbnormalType;
import org.l2jmobius.gameserver.model.skill.BuffInfo;
import org.l2jmobius.gameserver.model.skill.Skill;
import org.l2jmobius.gameserver.model.skill.SkillConditionScope;
import org.l2jmobius.gameserver.model.stats.Formulas;
import org.l2jmobius.gameserver.model.stats.MoveType;
import org.l2jmobius.gameserver.model.stats.Stat;
import org.l2jmobius.gameserver.model.stats.TraitType;
import org.l2jmobius.gameserver.model.zone.ZoneId;
import org.l2jmobius.gameserver.util.MathUtil;

public class CreatureStat
{
	private final Creature _creature;
	private long _exp = 0;
	private long _sp = 0;
	private byte _level = 1;
	/** Creature's maximum buff count. */
	private int _maxBuffCount = Config.BUFFS_MAX_AMOUNT;
	private double _vampiricSum = 0;
	private double _mpVampiricSum = 0;
	
	private final Map<Stat, Double> _statsAdd = new EnumMap<>(Stat.class);
	private final Map<Stat, Double> _statsMul = new EnumMap<>(Stat.class);
	private final Map<Stat, Map<MoveType, Double>> _moveTypeStats = new ConcurrentHashMap<>();
	private final Map<Integer, Double> _reuseStat = new ConcurrentHashMap<>();
	private final Map<Integer, Double> _mpConsumeStat = new ConcurrentHashMap<>();
	private final Map<Integer, LinkedList<Double>> _skillEvasionStat = new ConcurrentHashMap<>();
	private final Map<Stat, Map<Position, Double>> _positionStats = new ConcurrentHashMap<>();
	private final Map<Stat, Double> _fixedValue = new ConcurrentHashMap<>();
	
	private final float[] _attackTraitValues = new float[TraitType.values().length];
	private final float[] _defenceTraitValues = new float[TraitType.values().length];
	private final Set<TraitType> _attackTraits = EnumSet.noneOf(TraitType.class);
	private final Set<TraitType> _defenceTraits = EnumSet.noneOf(TraitType.class);
	private final Set<TraitType> _invulnerableTraits = EnumSet.noneOf(TraitType.class);
	
	/** Values to be recalculated after every stat update */
	private double _attackSpeedMultiplier = 1;
	private double _mAttackSpeedMultiplier = 1;
	
	private final ReentrantReadWriteLock _lock = new ReentrantReadWriteLock();
	
	public CreatureStat(Creature creature)
	{
		_creature = creature;
		for (int i = 0; i < TraitType.values().length; i++)
		{
			_attackTraitValues[i] = 1;
			_defenceTraitValues[i] = 0;
		}
	}
	
	/**
	 * @return the Accuracy (base+modifier) of the Creature in function of the Weapon Expertise Penalty.
	 */
	public int getAccuracy()
	{
		return (int) getValue(Stat.ACCURACY_COMBAT);
	}
	
	public int getCpRegen()
	{
		return (int) getValue(Stat.REGENERATE_CP_RATE);
	}
	
	public int getHpRegen()
	{
		return (int) getValue(Stat.REGENERATE_HP_RATE);
	}
	
	public int getMpRegen()
	{
		return (int) getValue(Stat.REGENERATE_MP_RATE);
	}
	
	/**
	 * @return the Magic Accuracy (base+modifier) of the Creature
	 */
	public int getMagicAccuracy()
	{
		return (int) getValue(Stat.ACCURACY_MAGIC);
	}
	
	public Creature getActiveChar()
	{
		return _creature;
	}
	
	/**
	 * @return the Attack Speed multiplier (base+modifier) of the Creature to get proper animations.
	 */
	public double getAttackSpeedMultiplier()
	{
		return _attackSpeedMultiplier;
	}
	
	public double getMAttackSpeedMultiplier()
	{
		return _mAttackSpeedMultiplier;
	}
	
	/**
	 * @return the CON of the Creature (base+modifier).
	 */
	public int getCON()
	{
		double con = getValue(Stat.STAT_CON);
		double k = 0;
		String s = "con";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) con + k);
	}
	
	/**
	 * @param init
	 * @return the Critical Damage rate (base+modifier) of the Creature.
	 */
	public double getCriticalDmg(double init)
	{
		double catk = getValue(Stat.CRITICAL_DAMAGE, init);
		double k = 0;
		String s = "catk";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) catk * (1 + (k / 100)));
	}
	
	/**
	 * @return the Critical Hit rate (base+modifier) of the Creature.
	 */
	public int getCriticalHit()
	{
		double crates = getValue(Stat.CRITICAL_RATE);
		double k = 0;
		String s = "crates";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) crates + k);
	}
	
	/**
	 * @return the DEX of the Creature (base+modifier).
	 */
	public int getDEX()
	{
		double dex = getValue(Stat.STAT_DEX);
		double k = 0;
		String s = "dex";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) dex + k);
	}
	
	/**
	 * @return the Attack Evasion rate (base+modifier) of the Creature.
	 */
	public int getEvasionRate()
	{
		double revs = getValue(Stat.EVASION_RATE);
		double k = 0;
		String s = "revs";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) revs + k);
	}
	
	/**
	 * @return the Attack Evasion rate (base+modifier) of the Creature.
	 */
	public int getMagicEvasionRate()
	{
		double mrevs = getValue(Stat.MAGIC_EVASION_RATE);
		double k = 0;
		String s = "mrevs";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) mrevs + k);
	}
	
	public long getExp()
	{
		return _exp;
	}
	
	public void setExp(long value)
	{
		_exp = value;
	}
	
	/**
	 * @return the INT of the Creature (base+modifier).
	 */
	public int getINT()
	{
		double ints = getValue(Stat.STAT_INT);
		double k = 0;
		String s = "int";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) ints + k);
	}
	
	public byte getLevel()
	{
		return _level;
	}
	
	public void setLevel(byte value)
	{
		_level = value;
	}
	
	/**
	 * @param skill
	 * @return the Magical Attack range (base+modifier) of the Creature.
	 */
	public int getMagicalAttackRange(Skill skill)
	{
		if (skill != null)
		{
			return (int) getValue(Stat.MAGIC_ATTACK_RANGE, skill.getCastRange());
		}
		return _creature.getTemplate().getBaseAttackRange();
	}
	
	public int getMaxCp()
	{
		return (int) getValue(Stat.MAX_CP);
	}
	
	public int getMaxRecoverableCp()
	{
		return (int) getValue(Stat.MAX_RECOVERABLE_CP, getMaxCp());
	}
	
	public int getMaxHp()
	{
		double maxhp = getValue(Stat.MAX_HP);
		double k = 0;
		String s = "maxhp";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) maxhp + k);
	}
	
	public int getMaxRecoverableHp()
	{
		return (int) getValue(Stat.MAX_RECOVERABLE_HP, getMaxHp());
	}
	
	public int getMaxMp()
	{
		double maxmp = getValue(Stat.MAX_MP);
		double k = 0;
		String s = "maxmp";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) maxmp + k);
	}
	
	public int getMaxRecoverableMp()
	{
		return (int) getValue(Stat.MAX_RECOVERABLE_MP, getMaxMp());
	}
	
	/**
	 * Return the MAtk (base+modifier) of the Creature.<br>
	 * <br>
	 * <b><u>Example of use</u>: Calculate Magic damage
	 * @return
	 */
	public int getMAtk()
	{
		double matk = getValue(Stat.MAGIC_ATTACK);
		double k = 0;
		String s = "matk";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) matk + k);
	}
	
	/**
	 * @return the MAtk Speed (base+modifier) of the Creature in function of the Armour Expertise Penalty.
	 */
	public int getMAtkSpd()
	{
		double mspeed = getValue(Stat.MAGIC_ATTACK_SPEED);
		double k = 0;
		String s = "mspeed";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) mspeed + k);
	}
	
	/**
	 * @return the Magic Critical Hit rate (base+modifier) of the Creature.
	 */
	public int getMCriticalHit()
	{
		double mrates = getValue(Stat.MAGIC_CRITICAL_RATE);
		double k = 0;
		String s = "mrates";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) mrates + k);
	}
	
	/**
	 * <b><u>Example of use </u>: Calculate Magic damage.
	 * @return the MDef (base+modifier) of the Creature against a skill in function of abnormal effects in progress.
	 */
	public int getMDef()
	{
		double mdef = getValue(Stat.MAGICAL_DEFENCE);
		double k = 0;
		String s = "mdef";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) mdef + k);
	}
	
	/**
	 * @return the MEN of the Creature (base+modifier).
	 */
	public int getMEN()
	{
		double men = getValue(Stat.STAT_MEN);
		double k = 0;
		String s = "men";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) men + k);
	}
	
	public int getLUC()
	{
		return (int) getValue(Stat.STAT_LUC);
	}
	
	public int getCHA()
	{
		return (int) getValue(Stat.STAT_CHA);
	}
	
	public double getMovementSpeedMultiplier()
	{
		double baseSpeed;
		if (_creature.isInsideZone(ZoneId.WATER))
		{
			baseSpeed = _creature.getTemplate().getBaseValue(_creature.isRunning() ? Stat.SWIM_RUN_SPEED : Stat.SWIM_WALK_SPEED, 0);
		}
		else
		{
			baseSpeed = _creature.getTemplate().getBaseValue(_creature.isRunning() ? Stat.RUN_SPEED : Stat.WALK_SPEED, 0);
		}
		return getMoveSpeed() * (1. / baseSpeed);
	}
	
	/**
	 * @return the RunSpeed (base+modifier) of the Creature in function of the Armour Expertise Penalty.
	 */
	public double getRunSpeed()
	{
		return getValue(_creature.isInsideZone(ZoneId.WATER) ? Stat.SWIM_RUN_SPEED : Stat.RUN_SPEED);
	}
	
	/**
	 * @return the WalkSpeed (base+modifier) of the Creature.
	 */
	public double getWalkSpeed()
	{
		return getValue(_creature.isInsideZone(ZoneId.WATER) ? Stat.SWIM_WALK_SPEED : Stat.WALK_SPEED);
	}
	
	/**
	 * @return the SwimRunSpeed (base+modifier) of the Creature.
	 */
	public double getSwimRunSpeed()
	{
		return getValue(Stat.SWIM_RUN_SPEED);
	}
	
	/**
	 * @return the SwimWalkSpeed (base+modifier) of the Creature.
	 */
	public double getSwimWalkSpeed()
	{
		return getValue(Stat.SWIM_WALK_SPEED);
	}
	
	/**
	 * @return the RunSpeed (base+modifier) or WalkSpeed (base+modifier) of the Creature in function of the movement type.
	 */
	public double getMoveSpeed()
	{
		if (_creature.isInsideZone(ZoneId.WATER))
		{
			return _creature.isRunning() ? getSwimRunSpeed() : getSwimWalkSpeed();
		}
		return _creature.isRunning() ? getRunSpeed() : getWalkSpeed();
	}
	
	/**
	 * @return the PAtk (base+modifier) of the Creature.
	 */
	public int getPAtk()
	{
		double patk = getValue(Stat.PHYSICAL_ATTACK);
		double k = 0;
		String s = "patk";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) patk + k);
	}
	
	/**
	 * @return the PAtk Speed (base+modifier) of the Creature in function of the Armour Expertise Penalty.
	 */
	public int getPAtkSpd()
	{
		double pspeed = getValue(Stat.PHYSICAL_ATTACK_SPEED);
		double k = 0;
		String s = "pspeed";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) pspeed + k);
	}
	
	/**
	 * @return the PDef (base+modifier) of the Creature.
	 */
	public int getPDef()
	{
		double pdef = getValue(Stat.PHYSICAL_DEFENCE);
		double k = 0;
		String s = "pdef";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) pdef + k);
	}
	
	/**
	 * @return the Physical Attack range (base+modifier) of the Creature.
	 */
	public int getPhysicalAttackRange()
	{
		return (int) getValue(Stat.PHYSICAL_ATTACK_RANGE);
	}
	
	public int getPhysicalAttackRadius()
	{
		return 40;
	}
	
	public int getPhysicalAttackAngle()
	{
		return 0;
	}
	
	/**
	 * @return the weapon reuse modifier.
	 */
	public double getWeaponReuseModifier()
	{
		return getValue(Stat.ATK_REUSE, 1);
	}
	
	/**
	 * @return the ShieldDef rate (base+modifier) of the Creature.
	 */
	public int getShldDef()
	{
		return (int) getValue(Stat.SHIELD_DEFENCE);
	}
	
	public long getSp()
	{
		return _sp;
	}
	
	public void setSp(long value)
	{
		_sp = value;
	}
	
	/**
	 * @return the STR of the Creature (base+modifier).
	 */
	public int getSTR()
	{
		double str = getValue(Stat.STAT_STR);
		double k = 0;
		String s = "str";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) str + k);
	}
	
	/**
	 * @return the WIT of the Creature (base+modifier).
	 */
	public int getWIT()
	{
		double wit = getValue(Stat.STAT_WIT);
		double k = 0;
		String s = "wit";
		if (_creature instanceof Player)
		{
			if (!((Player) _creature).isFakePlayer())
			{
				for (Item item : _creature.getInventory().getItems())
				{
					if (item.isEquipped())
					{
						k += item.getitemjc(s);
					}
				}
			}
		}
		return (int) ((int) wit + k);
	}
	
	/**
	 * @param skill
	 * @return the mpConsume.
	 */
	public int getMpConsume(Skill skill)
	{
		if (skill == null)
		{
			return 1;
		}
		double mpConsume = skill.getMpConsume();
		final double nextDanceMpCost = Math.ceil(skill.getMpConsume() / 2.);
		if (skill.isDance() && Config.DANCE_CONSUME_ADDITIONAL_MP && (_creature != null) && (_creature.getDanceCount() > 0))
		{
			mpConsume += _creature.getDanceCount() * nextDanceMpCost;
		}
		return (int) (mpConsume * getMpConsumeTypeValue(skill.getMagicType()));
	}
	
	/**
	 * @param skill
	 * @return the mpInitialConsume.
	 */
	public int getMpInitialConsume(Skill skill)
	{
		if (skill == null)
		{
			return 1;
		}
		return skill.getMpInitialConsume();
	}
	
	public AttributeType getAttackElement()
	{
		final Item weaponInstance = _creature.getActiveWeaponInstance();
		// 1st order - weapon element
		if ((weaponInstance != null) && (weaponInstance.getAttackAttributeType() != AttributeType.NONE))
		{
			return weaponInstance.getAttackAttributeType();
		}
		
		// temp fix starts
		int tempVal = 0;
		final int[] stats =
		{
			getAttackElementValue(AttributeType.FIRE),
			getAttackElementValue(AttributeType.WATER),
			getAttackElementValue(AttributeType.WIND),
			getAttackElementValue(AttributeType.EARTH),
			getAttackElementValue(AttributeType.HOLY),
			getAttackElementValue(AttributeType.DARK)
		};
		
		AttributeType returnVal = AttributeType.NONE;
		for (byte x = 0; x < stats.length; x++)
		{
			if (stats[x] > tempVal)
			{
				returnVal = AttributeType.findByClientId(x);
				tempVal = stats[x];
			}
		}
		
		return returnVal;
	}
	
	public int getAttackElementValue(AttributeType attackAttribute)
	{
		switch (attackAttribute)
		{
			case FIRE:
			{
				return (int) getValue(Stat.FIRE_POWER);
			}
			case WATER:
			{
				return (int) getValue(Stat.WATER_POWER);
			}
			case WIND:
			{
				return (int) getValue(Stat.WIND_POWER);
			}
			case EARTH:
			{
				return (int) getValue(Stat.EARTH_POWER);
			}
			case HOLY:
			{
				return (int) getValue(Stat.HOLY_POWER);
			}
			case DARK:
			{
				return (int) getValue(Stat.DARK_POWER);
			}
			default:
			{
				return 0;
			}
		}
	}
	
	public int getDefenseElementValue(AttributeType defenseAttribute)
	{
		switch (defenseAttribute)
		{
			case FIRE:
			{
				return (int) getValue(Stat.FIRE_RES);
			}
			case WATER:
			{
				return (int) getValue(Stat.WATER_RES);
			}
			case WIND:
			{
				return (int) getValue(Stat.WIND_RES);
			}
			case EARTH:
			{
				return (int) getValue(Stat.EARTH_RES);
			}
			case HOLY:
			{
				return (int) getValue(Stat.HOLY_RES);
			}
			case DARK:
			{
				return (int) getValue(Stat.DARK_RES);
			}
			default:
			{
				return (int) getValue(Stat.BASE_ATTRIBUTE_RES);
			}
		}
	}
	
	public void mergeAttackTrait(TraitType traitType, float value)
	{
		_lock.readLock().lock();
		try
		{
			_attackTraitValues[traitType.ordinal()] += value;
			_attackTraits.add(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void removeAttackTrait(TraitType traitType, float value)
	{
		_lock.readLock().lock();
		try
		{
			_attackTraitValues[traitType.ordinal()] -= value;
			if (_attackTraitValues[traitType.ordinal()] == 1)
			{
				_attackTraits.remove(traitType);
			}
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public float getAttackTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			return _attackTraitValues[traitType.ordinal()];
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public boolean hasAttackTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			return _attackTraits.contains(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void mergeDefenceTrait(TraitType traitType, float value)
	{
		_lock.readLock().lock();
		try
		{
			_defenceTraitValues[traitType.ordinal()] += value;
			_defenceTraits.add(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void removeDefenceTrait(TraitType traitType, float value)
	{
		_lock.readLock().lock();
		try
		{
			_defenceTraitValues[traitType.ordinal()] -= value;
			if (_defenceTraitValues[traitType.ordinal()] == 0)
			{
				_defenceTraits.remove(traitType);
			}
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public float getDefenceTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			return _defenceTraitValues[traitType.ordinal()];
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public boolean hasDefenceTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			return _defenceTraits.contains(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void mergeInvulnerableTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			_invulnerableTraits.add(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void removeInvulnerableTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			_invulnerableTraits.remove(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public boolean isInvulnerableTrait(TraitType traitType)
	{
		_lock.readLock().lock();
		try
		{
			return _invulnerableTraits.contains(traitType);
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	/**
	 * Gets the maximum buff count.
	 * @return the maximum buff count
	 */
	public int getMaxBuffCount()
	{
		return _maxBuffCount;
	}
	
	/**
	 * Sets the maximum buff count.
	 * @param value the buff count
	 */
	public void setMaxBuffCount(int value)
	{
		_maxBuffCount = value;
	}
	
	/**
	 * Merges the stat's value with the values within the map of adds
	 * @param stat
	 * @param value
	 */
	public void mergeAdd(Stat stat, Double value)
	{
		_statsAdd.merge(stat, value, stat::functionAdd);
	}
	
	/**
	 * Merges the stat's value with the values within the map of muls
	 * @param stat
	 * @param value
	 */
	public void mergeMul(Stat stat, Double value)
	{
		_statsMul.merge(stat, value, stat::functionMul);
	}
	
	/**
	 * @param stat
	 * @return the add value
	 */
	public double getAdd(Stat stat)
	{
		return getAdd(stat, 0d);
	}
	
	/**
	 * @param stat
	 * @param defaultValue
	 * @return the add value
	 */
	public double getAdd(Stat stat, double defaultValue)
	{
		_lock.readLock().lock();
		try
		{
			final Double val = _statsAdd.get(stat);
			return val != null ? val.doubleValue() : defaultValue;
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	/**
	 * Non blocking stat ADD getter.<br>
	 * WARNING: Only use with effect handlers!
	 * @param stat
	 * @return the add value
	 */
	public double getAddValue(Stat stat)
	{
		return getAddValue(stat, 0d);
	}
	
	/**
	 * Non blocking stat ADD getter.<br>
	 * WARNING: Only use with effect handlers!
	 * @param stat
	 * @param defaultValue
	 * @return the add value
	 */
	public double getAddValue(Stat stat, double defaultValue)
	{
		final Double val = _statsAdd.get(stat);
		return val != null ? val.doubleValue() : defaultValue;
	}
	
	/**
	 * @param stat
	 * @return the mul value
	 */
	public double getMul(Stat stat)
	{
		return getMul(stat, 1d);
	}
	
	/**
	 * @param stat
	 * @param defaultValue
	 * @return the mul value
	 */
	public double getMul(Stat stat, double defaultValue)
	{
		_lock.readLock().lock();
		try
		{
			final Double val = _statsMul.get(stat);
			return val != null ? val.doubleValue() : defaultValue;
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	/**
	 * Non blocking stat MUL getter.<br>
	 * WARNING: Only use with effect handlers!
	 * @param stat
	 * @return the mul value
	 */
	public double getMulValue(Stat stat)
	{
		return getMulValue(stat, 1d);
	}
	
	/**
	 * Non blocking stat MUL getter.<br>
	 * WARNING: Only use with effect handlers!
	 * @param stat
	 * @param defaultValue
	 * @return the mul value
	 */
	public double getMulValue(Stat stat, double defaultValue)
	{
		final Double val = _statsMul.get(stat);
		return val != null ? val.doubleValue() : defaultValue;
	}
	
	/**
	 * @param stat
	 * @param baseValue
	 * @return the final value of the stat
	 */
	public double getValue(Stat stat, double baseValue)
	{
		final Double val = _fixedValue.get(stat);
		return val != null ? val.doubleValue() : stat.finalize(_creature, OptionalDouble.of(baseValue));
	}
	
	/**
	 * @param stat
	 * @return the final value of the stat
	 */
	public double getValue(Stat stat)
	{
		final Double val = _fixedValue.get(stat);
		return val != null ? val.doubleValue() : stat.finalize(_creature, OptionalDouble.empty());
	}
	
	protected void resetStats()
	{
		_statsAdd.clear();
		_statsMul.clear();
		_vampiricSum = 0;
		_mpVampiricSum = 0;
		
		// Initialize default values
		for (Stat stat : Stat.values())
		{
			if (stat.getResetAddValue() != 0)
			{
				_statsAdd.put(stat, stat.getResetAddValue());
			}
			if (stat.getResetMulValue() != 0)
			{
				_statsMul.put(stat, stat.getResetMulValue());
			}
		}
	}
	
	/**
	 * Locks and resets all stats and recalculates all
	 * @param broadcast
	 */
	public void recalculateStats(boolean broadcast)
	{
		// Copy old data before wiping it out.
		final Map<Stat, Double> adds = !broadcast ? Collections.emptyMap() : new EnumMap<>(_statsAdd);
		final Map<Stat, Double> muls = !broadcast ? Collections.emptyMap() : new EnumMap<>(_statsMul);
		
		_lock.writeLock().lock();
		
		try
		{
			// Wipe all the data.
			resetStats();
			
			// Call pump to each effect.
			for (BuffInfo info : _creature.getEffectList().getPassives())
			{
				if (info.isInUse() && info.getSkill().checkConditions(SkillConditionScope.PASSIVE, _creature, _creature.getTarget()))
				{
					for (AbstractEffect effect : info.getEffects())
					{
						if (effect.canStart(info.getEffector(), info.getEffected(), info.getSkill()) && effect.canPump(info.getEffector(), info.getEffected(), info.getSkill()))
						{
							effect.pump(info.getEffected(), info.getSkill());
						}
					}
				}
			}
			for (BuffInfo info : _creature.getEffectList().getOptions())
			{
				if (info.isInUse())
				{
					for (AbstractEffect effect : info.getEffects())
					{
						if (effect.canStart(info.getEffector(), info.getEffected(), info.getSkill()) && effect.canPump(info.getEffector(), info.getEffected(), info.getSkill()))
						{
							effect.pump(info.getEffected(), info.getSkill());
						}
					}
				}
			}
			for (BuffInfo info : _creature.getEffectList().getEffects())
			{
				if (info.isInUse())
				{
					for (AbstractEffect effect : info.getEffects())
					{
						if (effect.canStart(info.getEffector(), info.getEffected(), info.getSkill()) && effect.canPump(info.getEffector(), info.getEffected(), info.getSkill()))
						{
							effect.pump(info.getEffected(), info.getSkill());
						}
					}
				}
			}
			
			// Pump for summon ABILITY_CHANGE abnormal type.
			if (_creature.isSummon())
			{
				final Player player = _creature.asPlayer();
				if ((player != null) && player.hasAbnormalType(AbnormalType.ABILITY_CHANGE))
				{
					for (BuffInfo info : player.getEffectList().getEffects())
					{
						if (info.isInUse() && info.isAbnormalType(AbnormalType.ABILITY_CHANGE))
						{
							for (AbstractEffect effect : info.getEffects())
							{
								if (effect.canStart(info.getEffector(), info.getEffected(), info.getSkill()) && effect.canPump(_creature, _creature, info.getSkill()))
								{
									effect.pump(_creature, info.getSkill());
								}
							}
						}
					}
				}
			}
			
			_attackSpeedMultiplier = Formulas.calcAtkSpdMultiplier(_creature);
			_mAttackSpeedMultiplier = Formulas.calcMAtkSpdMultiplier(_creature);
		}
		finally
		{
			_lock.writeLock().unlock();
		}
		
		// Notify recalculation to child classes.
		onRecalculateStats(broadcast);
		
		if (broadcast)
		{
			// Calculate the difference between old and new stats.
			final Set<Stat> changed = EnumSet.noneOf(Stat.class);
			Double statAddResetValue;
			Double statMulResetValue;
			Double statAddValue;
			Double statMulValue;
			Double addsValue;
			Double mulsValue;
			for (Stat stat : Stat.values())
			{
				statAddResetValue = stat.getResetAddValue();
				statMulResetValue = stat.getResetMulValue();
				addsValue = adds.getOrDefault(stat, statAddResetValue);
				mulsValue = muls.getOrDefault(stat, statMulResetValue);
				statAddValue = _statsAdd.getOrDefault(stat, statAddResetValue);
				statMulValue = _statsMul.getOrDefault(stat, statMulResetValue);
				if (addsValue.equals(statAddResetValue) || mulsValue.equals(statMulResetValue) || !addsValue.equals(statAddValue) || !mulsValue.equals(statMulValue))
				{
					changed.add(stat);
				}
			}
			_creature.broadcastModifiedStats(changed);
		}
	}
	
	protected void onRecalculateStats(boolean broadcast)
	{
		// Check if Max HP/MP/CP is lower than current due to new stats.
		if (_creature.getCurrentCp() > getMaxCp())
		{
			_creature.setCurrentCp(getMaxCp());
		}
		if (_creature.getCurrentHp() > getMaxHp())
		{
			_creature.setCurrentHp(getMaxHp());
		}
		if (_creature.getCurrentMp() > getMaxMp())
		{
			_creature.setCurrentMp(getMaxMp());
		}
	}
	
	public double getPositionTypeValue(Stat stat, Position position)
	{
		final Map<Position, Double> map = _positionStats.get(stat);
		if (map != null)
		{
			final Double val = map.get(position);
			if (val != null)
			{
				return val.doubleValue();
			}
		}
		return 1d;
	}
	
	public void mergePositionTypeValue(Stat stat, Position position, double value, BiFunction<? super Double, ? super Double, ? extends Double> func)
	{
		_positionStats.computeIfAbsent(stat, key -> new ConcurrentHashMap<>()).merge(position, value, func);
	}
	
	public double getMoveTypeValue(Stat stat, MoveType type)
	{
		final Map<MoveType, Double> map = _moveTypeStats.get(stat);
		if (map != null)
		{
			final Double val = map.get(type);
			if (val != null)
			{
				return val.doubleValue();
			}
		}
		return 0d;
	}
	
	public void mergeMoveTypeValue(Stat stat, MoveType type, double value)
	{
		_moveTypeStats.computeIfAbsent(stat, key -> new ConcurrentHashMap<>()).merge(type, value, MathUtil::add);
	}
	
	public double getReuseTypeValue(int magicType)
	{
		final Double val = _reuseStat.get(magicType);
		return val != null ? val.doubleValue() : 1d;
	}
	
	public void mergeReuseTypeValue(int magicType, double value, BiFunction<? super Double, ? super Double, ? extends Double> func)
	{
		_reuseStat.merge(magicType, value, func);
	}
	
	public double getMpConsumeTypeValue(int magicType)
	{
		final Double val = _mpConsumeStat.get(magicType);
		return val != null ? val.doubleValue() : 1d;
	}
	
	public void mergeMpConsumeTypeValue(int magicType, double value, BiFunction<? super Double, ? super Double, ? extends Double> func)
	{
		_mpConsumeStat.merge(magicType, value, func);
	}
	
	public double getSkillEvasionTypeValue(int magicType)
	{
		final LinkedList<Double> skillEvasions = _skillEvasionStat.get(magicType);
		if ((skillEvasions != null) && !skillEvasions.isEmpty())
		{
			return skillEvasions.peekLast().doubleValue();
		}
		return 0d;
	}
	
	public void addSkillEvasionTypeValue(int magicType, double value)
	{
		_skillEvasionStat.computeIfAbsent(magicType, k -> new LinkedList<>()).add(value);
	}
	
	public void removeSkillEvasionTypeValue(int magicType, double value)
	{
		_skillEvasionStat.computeIfPresent(magicType, (k, v) ->
		{
			v.remove(value);
			return !v.isEmpty() ? v : null;
		});
	}
	
	public void addToVampiricSum(double sum)
	{
		_vampiricSum += sum;
	}
	
	public double getVampiricSum()
	{
		_lock.readLock().lock();
		try
		{
			return _vampiricSum;
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	public void addToMpVampiricSum(double sum)
	{
		_mpVampiricSum += sum;
	}
	
	public double getMpVampiricSum()
	{
		_lock.readLock().lock();
		try
		{
			return _mpVampiricSum;
		}
		finally
		{
			_lock.readLock().unlock();
		}
	}
	
	/**
	 * Calculates the time required for this skill to be used again.
	 * @param skill the skill from which reuse time will be calculated.
	 * @return the time in milliseconds this skill is being under reuse.
	 */
	public int getReuseTime(Skill skill)
	{
		return (skill.isStaticReuse() || skill.isStatic()) ? skill.getReuseDelay() : (int) (skill.getReuseDelay() * getReuseTypeValue(skill.getMagicType()));
	}
	
	/**
	 * @param stat
	 * @param value
	 * @return true if the there wasn't previously set fixed value, {@code false} otherwise
	 */
	public boolean addFixedValue(Stat stat, Double value)
	{
		return _fixedValue.put(stat, value) == null;
	}
	
	/**
	 * @param stat
	 * @return {@code true} if fixed value is removed, {@code false} otherwise
	 */
	public boolean removeFixedValue(Stat stat)
	{
		return _fixedValue.remove(stat) != null;
	}
}
