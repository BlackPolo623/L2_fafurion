/*
 * This file is part of the L2J Mobius project.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package handlers.targethandlers;

import org.l2jmobius.gameserver.geoengine.GeoEngine;
import org.l2jmobius.gameserver.handler.ITargetTypeHandler;
import org.l2jmobius.gameserver.model.WorldObject;
import org.l2jmobius.gameserver.model.actor.Creature;
import org.l2jmobius.gameserver.model.actor.Playable;
import org.l2jmobius.gameserver.model.effects.EffectType;
import org.l2jmobius.gameserver.model.skill.Skill;
import org.l2jmobius.gameserver.model.skill.targets.TargetType;
import org.l2jmobius.gameserver.model.zone.ZoneId;
import org.l2jmobius.gameserver.network.SystemMessageId;

/**
 * Target dead player or pet.
 * @author Nik
 */
public class PcBody implements ITargetTypeHandler
{
	@Override
	public Enum<TargetType> getTargetType()
	{
		return TargetType.PC_BODY;
	}
	
	@Override
	public WorldObject getTarget(Creature creature, WorldObject selectedTarget, Skill skill, boolean forceUse, boolean dontMove, boolean sendMessage)
	{
		if (selectedTarget == null)
		{
			return null;
		}
		
		if (!selectedTarget.isCreature())
		{
			return null;
		}
		
		if (!selectedTarget.isPlayer() && !selectedTarget.isPet())
		{
			if (sendMessage)
			{
				creature.sendPacket(SystemMessageId.INVALID_TARGET);
			}
			
			return null;
		}
		
		final Playable target = selectedTarget.asPlayable();
		if (target.isDead())
		{
			if (skill.hasEffectType(EffectType.RESURRECTION))
			{
				if (creature.isResurrectionBlocked() || target.isResurrectionBlocked())
				{
					if (sendMessage)
					{
						creature.sendPacket(SystemMessageId.REJECT_RESURRECTION); // Reject resurrection
						target.sendPacket(SystemMessageId.REJECT_RESURRECTION); // Reject resurrection
					}
					
					return null;
				}
				
				// check target is not in a active siege zone
				if (target.isPlayer() && target.isInsideZone(ZoneId.SIEGE))
				{
					if (sendMessage)
					{
						creature.sendPacket(SystemMessageId.IT_IS_NOT_POSSIBLE_TO_RESURRECT_IN_BATTLEGROUNDS_WHERE_A_SIEGE_WAR_IS_TAKING_PLACE);
					}
					
					return null;
				}
			}
			
			// Check for cast range if character cannot move. TODO: char will start follow until within castrange, but if his moving is blocked by geodata, this msg will be sent.
			if (dontMove && (creature.calculateDistance2D(target) > skill.getCastRange()))
			{
				if (sendMessage)
				{
					creature.sendPacket(SystemMessageId.THE_DISTANCE_IS_TOO_FAR_AND_SO_THE_CASTING_HAS_BEEN_STOPPED);
				}
				
				return null;
			}
			
			// Geodata check when character is within range.
			if (!GeoEngine.getInstance().canSeeTarget(creature, target) || (skill.isFlyType() && !GeoEngine.getInstance().canMoveToTarget(creature, target)))
			{
				if (sendMessage)
				{
					creature.sendPacket(SystemMessageId.CANNOT_SEE_TARGET);
				}
				
				return null;
			}
			
			return target;
		}
		
		// If target is not dead or not player/pet it will not even bother to walk within range, unlike Enemy target type.
		if (sendMessage)
		{
			creature.sendPacket(SystemMessageId.INVALID_TARGET);
		}
		
		return null;
	}
}
