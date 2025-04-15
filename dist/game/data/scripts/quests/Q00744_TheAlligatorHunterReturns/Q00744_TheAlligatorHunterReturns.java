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
package quests.Q00744_TheAlligatorHunterReturns;

import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

/**
 * The Alligator Hunter returns (744)
 * @author Kazumi
 */
public final class Q00744_TheAlligatorHunterReturns extends Quest
{
	// NPCs
	private static final int BATHIS = 30332;
	private static final int ENRON = 33860;
	private static final int FLUTTER = 30677;
	// Monster
	private static final int[] MONSTERS =
	{
		20135, // Alligator
		20804, // Crokian Lad
		20805, // Dailaon Lad
		20806, // Crokian Lad Warrior
		20807, // Farhite Lad
		20808, // Nos Lad
		20991, // Swamp Tribe
		20992, // Swamp Alligator
		20993, // Swamp Warrior
	};
	// Items
	private static final int ALLIGATOR_LEATHER = 47046;
	// Misc
	private static final int MIN_LEVEL = 40;
	private static final int MAX_LEVEL = 45;
	
	public Q00744_TheAlligatorHunterReturns()
	{
		super(744);
		addStartNpc(BATHIS);
		addTalkId(BATHIS, ENRON, FLUTTER);
		addKillId(MONSTERS);
		registerQuestItems(ALLIGATOR_LEATHER);
		addCondMinLevel(MIN_LEVEL, "captain_bathia_q0744_02.htm");
		addCondMaxLevel(MAX_LEVEL, "captain_bathia_q0744_02.htm");
		addCondIsNotSubClassActive("captain_bathia_q0744_03.htm");
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		final QuestState qs = getQuestState(player, false);
		if (qs == null)
		{
			return null;
		}
		
		String htmltext = null;
		
		switch (event)
		{
			case "captain_bathia_q0744_04.htm":
			case "captain_bathia_q0744_05.htm":
			case "enron_q0744_02.htm":
			{
				htmltext = event;
				break;
			}
			case "captain_bathia_q0744_06.htm":
			{
				qs.startQuest();
				break;
			}
			case "enron_q0744_03.htm":
			{
				if (qs.isCond(1))
				{
					qs.setCond(2);
				}
				break;
			}
			case "head_blacksmith_flutter_q0744_03.htm":
			{
				if (qs.isCond(3))
				{
					if (player.getLevel() >= MIN_LEVEL)
					{
						qs.exitQuest(QuestType.REPEATABLE, true);
						addExpAndSp(player, 7574218, 1_380);
						htmltext = event;
						break;
					}
					htmltext = getNoQuestLevelRewardMsg(player);
					break;
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
				if (npc.getId() == BATHIS)
				{
					if (player.getLevel() >= MIN_LEVEL)
					{
						htmltext = "captain_bathia_q0744_01.htm";
						break;
					}
					htmltext = "captain_bathia_q0744_02.htm";
					break;
				}
				break;
			}
			case State.STARTED:
			{
				switch (npc.getId())
				{
					case BATHIS:
					{
						htmltext = "captain_bathia_q0744_07.htm";
						break;
					}
					case ENRON:
					{
						switch (qs.getCond())
						{
							case 1:
							{
								htmltext = "enron_q0744_01.htm";
								break;
							}
							case 2:
							{
								htmltext = "enron_q0744_04.htm";
								break;
							}
							case 3:
							{
								htmltext = "enron_q0744_05.htm";
								break;
							}
						}
						break;
					}
					case FLUTTER:
					{
						switch (qs.getCond())
						{
							case 1:
							case 2:
							{
								htmltext = "head_blacksmith_flutter_q0744_01.htm";
								break;
							}
							case 3:
							{
								htmltext = "head_blacksmith_flutter_q0744_02.htm";
								break;
							}
						}
						break;
					}
				}
				break;
			}
			case State.COMPLETED:
			{
				qs.setState(State.CREATED);
				break;
			}
		}
		return htmltext;
	}
	
	@Override
	public String onKill(Npc npc, Player killer, boolean isSummon)
	{
		final QuestState qs = getQuestState(killer, false);
		if ((qs != null) && qs.isCond(2) && giveItemRandomly(killer, npc, ALLIGATOR_LEATHER, 1, 150, 1.0, true))
		{
			if (getQuestItemsCount(killer, ALLIGATOR_LEATHER) >= 150)
			{
				qs.setCond(3, true);
			}
		}
		return super.onKill(npc, killer, isSummon);
	}
}