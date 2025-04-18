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
package quests.Q00599_DemonsAndDimensionalEnergy;

import org.l2jmobius.Config;
import org.l2jmobius.gameserver.enums.Faction;
import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

/**
 * Demons and Dimensional Energy (599)
 * @URL https://l2wiki.com/Demons_and_Dimensional_Energy
 * @author Dmitri
 */
public class Q00599_DemonsAndDimensionalEnergy extends Quest
{
	// NPCs
	private static final int LEONA_BLACKBIRD = 34425;
	// Monsters
	private static final int[] MONSTERS =
	{
		24144, // Death Rogue
		24145, // Death Shooter
		24146, // Death Warrior
		24147, // Death Sorcerer
		24149, // Devil Nightmare
		24150, // Devil Warrior
		24151, // Devil Guardian
		24152, // Devil Sinist
		24154, // Demonic Wizard
		24155, // Demonic Warrior
		24156, // Demonic Archer
		24157 // Demonic Keras
	};
	// Item
	private static final int DEMON_SLAYERS_PROOF = 48578;
	// Rewards
	private static final int BASIC_SUPPLY_BOX = 48579; // Blackbird Clan Basic Box Atelia Refinery
	private static final int INTERMEDIATE_SUPPLY_BOX = 48580; // Blackbird Clan Intermediate Box Atelia Refinery
	private static final int ADVANCED_SUPPLY_BOX = 48581; // Blackbird Clan Advanced Box Atelia Refinery
	// Misc
	private static final int MIN_LEVEL = 103;
	
	public Q00599_DemonsAndDimensionalEnergy()
	{
		super(599);
		addStartNpc(LEONA_BLACKBIRD);
		addTalkId(LEONA_BLACKBIRD);
		addKillId(MONSTERS);
		registerQuestItems(DEMON_SLAYERS_PROOF);
		addCondMinLevel(MIN_LEVEL, "34425-00.htm");
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = null;
		final QuestState qs = getQuestState(player, false);
		if (qs == null)
		{
			return htmltext;
		}
		
		switch (event)
		{
			case "34425-02.htm":
			case "34425-03.htm":
			case "34425-04.htm":
			case "34425-04a.htm":
			case "34425-04b.htm":
			case "34425-06.html":
			case "34425-06a.html":
			case "34425-06b.html":
			{
				htmltext = event;
				break;
			}
			case "select_mission":
			{
				qs.startQuest();
				if ((player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 6) && (player.getFactionLevel(Faction.BLACKBIRD_CLAN) < 7))
				{
					htmltext = "34425-04a.htm";
					break;
				}
				else if (player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 7)
				{
					htmltext = "34425-04b.htm";
					break;
				}
				htmltext = "34425-04.htm";
				break;
			}
			case "return":
			{
				if ((player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 6) && (player.getFactionLevel(Faction.BLACKBIRD_CLAN) < 7))
				{
					htmltext = "34425-04a.htm";
					break;
				}
				else if (player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 7)
				{
					htmltext = "34425-04b.htm";
					break;
				}
				htmltext = "34425-04.htm";
				break;
			}
			case "34425-07.html":
			{
				qs.setCond(2, true);
				htmltext = event;
				break;
			}
			case "34425-07a.html":
			{
				qs.setCond(3, true);
				htmltext = event;
				break;
			}
			case "34425-07b.html":
			{
				qs.setCond(4, true);
				htmltext = event;
				break;
			}
			case "34425-10.html":
			{
				final int chance = getRandom(100);
				switch (qs.getCond())
				{
					case 5:
					{
						if ((getQuestItemsCount(player, DEMON_SLAYERS_PROOF) == 200) && (player.getLevel() >= MIN_LEVEL))
						{
							if (chance < 2)
							{
								giveItems(player, ADVANCED_SUPPLY_BOX, 1);
							}
							else if (chance < 20)
							{
								giveItems(player, INTERMEDIATE_SUPPLY_BOX, 1);
							}
							else if (chance < 100)
							{
								giveItems(player, BASIC_SUPPLY_BOX, 1);
							}
							addExpAndSp(player, 27191624760L, 27191610);
							addFactionPoints(player, Faction.BLACKBIRD_CLAN, 100);
							qs.exitQuest(QuestType.DAILY, true);
							htmltext = event;
						}
						else
						{
							htmltext = getNoQuestLevelRewardMsg(player);
						}
						break;
					}
					case 6:
					{
						if ((getQuestItemsCount(player, DEMON_SLAYERS_PROOF) == 400) && (player.getLevel() >= MIN_LEVEL))
						{
							if (chance < 2)
							{
								giveItems(player, ADVANCED_SUPPLY_BOX, 1);
							}
							else if (chance < 20)
							{
								giveItems(player, BASIC_SUPPLY_BOX, 1);
							}
							else if (chance < 100)
							{
								giveItems(player, INTERMEDIATE_SUPPLY_BOX, 1);
							}
							addExpAndSp(player, 54383249520L, 54383220);
							addFactionPoints(player, Faction.BLACKBIRD_CLAN, 200);
							qs.exitQuest(QuestType.DAILY, true);
							htmltext = event;
						}
						else
						{
							htmltext = getNoQuestLevelRewardMsg(player);
						}
						break;
					}
					case 7:
					{
						if ((getQuestItemsCount(player, DEMON_SLAYERS_PROOF) == 600) && (player.getLevel() >= MIN_LEVEL))
						{
							if (chance < 2)
							{
								giveItems(player, BASIC_SUPPLY_BOX, 1);
							}
							else if (chance < 20)
							{
								giveItems(player, INTERMEDIATE_SUPPLY_BOX, 1);
							}
							else if (chance < 100)
							{
								giveItems(player, ADVANCED_SUPPLY_BOX, 1);
							}
							addExpAndSp(player, 81574874280L, 81574830);
							addFactionPoints(player, Faction.BLACKBIRD_CLAN, 300);
							qs.exitQuest(QuestType.DAILY, true);
							htmltext = event;
						}
						else
						{
							htmltext = getNoQuestLevelRewardMsg(player);
						}
						break;
					}
				}
				break;
			}
		}
		return htmltext;
	}
	
	@Override
	public String onTalk(Npc npc, Player player)
	{
		final QuestState qs = getQuestState(player, true);
		String htmltext = getNoQuestMsg(player);
		
		switch (qs.getState())
		{
			case State.CREATED:
			{
				htmltext = "34425-01.htm";
				// fallthrough?
			}
			case State.STARTED:
			{
				switch (qs.getCond())
				{
					case 1:
					{
						if ((player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 6) && (player.getFactionLevel(Faction.BLACKBIRD_CLAN) < 7))
						{
							htmltext = "34425-04a.htm";
							break;
						}
						else if (player.getFactionLevel(Faction.BLACKBIRD_CLAN) >= 7)
						{
							htmltext = "34425-04b.htm";
							break;
						}
						htmltext = "34425-04.htm";
						break;
					}
					case 2:
					{
						htmltext = "34425-08.html";
						break;
					}
					case 3:
					{
						htmltext = "34425-08a.html";
						break;
					}
					case 4:
					{
						htmltext = "34425-08b.html";
						break;
					}
					case 5:
					case 6:
					case 7:
					{
						htmltext = "34425-09.html";
						break;
					}
				}
				break;
			}
			case State.COMPLETED:
			{
				if (!qs.isNowAvailable())
				{
					htmltext = getAlreadyCompletedMsg(player, QuestType.DAILY);
				}
				else
				{
					qs.setState(State.CREATED);
					htmltext = "34425-01.htm";
				}
				break;
			}
		}
		return htmltext;
	}
	
	@Override
	public String onKill(Npc npc, Player player, boolean isSummon)
	{
		executeForEachPlayer(player, npc, isSummon, true, false);
		return super.onKill(npc, player, isSummon);
	}
	
	@Override
	public void actionForEachPlayer(Player player, Npc npc, boolean isSummon)
	{
		final QuestState qs = getQuestState(player, false);
		if ((qs != null) && (qs.getCond() > 1) && player.isInsideRadius3D(npc, Config.ALT_PARTY_RANGE))
		{
			switch (qs.getCond())
			{
				case 2:
				{
					if (giveItemRandomly(player, npc, DEMON_SLAYERS_PROOF, 1, 200, 1, true))
					{
						qs.setCond(5, true);
					}
					break;
				}
				case 3:
				{
					if (giveItemRandomly(player, npc, DEMON_SLAYERS_PROOF, 1, 400, 1, true))
					{
						qs.setCond(6, true);
					}
					break;
				}
				case 4:
				{
					if (giveItemRandomly(player, npc, DEMON_SLAYERS_PROOF, 1, 600, 1, true))
					{
						qs.setCond(7, true);
					}
					break;
				}
			}
		}
	}
}
