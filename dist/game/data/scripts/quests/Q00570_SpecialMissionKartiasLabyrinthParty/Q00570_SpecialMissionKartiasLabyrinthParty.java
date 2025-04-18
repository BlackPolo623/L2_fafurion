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
package quests.Q00570_SpecialMissionKartiasLabyrinthParty;

import org.l2jmobius.gameserver.enums.Faction;
import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;
import org.l2jmobius.gameserver.network.serverpackets.ExTutorialShowId;

/**
 * Special Mission: Kartia's Labyrinth (Party) (570)
 * @URL https://l2wiki.com/Special_Mission:_Kartia%27s_Labyrinth_(Party)
 * @author Dmitri
 */
public class Q00570_SpecialMissionKartiasLabyrinthParty extends Quest
{
	// NPCs
	private static final int PENNY = 34413;
	private static final int KARTIA = 33647;
	// Misc
	private static final int MIN_LEVEL = 87;
	private static final int MAX_LEVEL = 99;
	
	public Q00570_SpecialMissionKartiasLabyrinthParty()
	{
		super(570);
		addStartNpc(PENNY);
		addTalkId(PENNY, KARTIA);
		addCondLevel(MIN_LEVEL, MAX_LEVEL, "nolevel.html");
		addFactionLevel(Faction.ADVENTURE_GUILD, 2, "34413-00.htm");
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
			case "34413-02.htm":
			case "34413-03.htm":
			case "34413-05.html":
			{
				htmltext = event;
				break;
			}
			case "34413-04.html":
			{
				qs.startQuest();
				htmltext = event;
				break;
			}
			case "34413-06.html":
			{
				// Show Service/Help/Instance Zone page
				player.sendPacket(new ExTutorialShowId(29));
				htmltext = event;
				break;
			}
			case "34413-07.html":
			{
				qs.setCond(2, true);
				htmltext = event;
				break;
			}
			case "34413-09.html":
			{
				final StringBuilder str = new StringBuilder("000");
				checkQuestCompleted(player, str); // Initialize the array with all quests completed
				if (str.indexOf("1") == -1) // verify if no quest completed
				{
					htmltext = "34413-07.html";
				}
				else
				{
					if (str.charAt(0) == '1')
					{
						addFactionPoints(player, Faction.ADVENTURE_GUILD, 100); // add 100 points to ADVENTURE_GUILD Faction
						addExpAndSp(player, 349752660, 349740);
					}
					if (str.charAt(1) == '1')
					{
						addFactionPoints(player, Faction.ADVENTURE_GUILD, 125); // add 125 points to ADVENTURE_GUILD Faction
						addExpAndSp(player, 646727130, 646710);
					}
					if (str.charAt(2) == '1')
					{
						addFactionPoints(player, Faction.ADVENTURE_GUILD, 150); // add 150 points to ADVENTURE_GUILD Faction
						addExpAndSp(player, 1793099880L, 1793070);
					}
					qs.exitQuest(QuestType.DAILY, true);
					htmltext = event;
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
				if (npc.getId() == PENNY)
				{
					htmltext = "34413-01.htm";
				}
				break;
			}
			case State.STARTED:
			{
				switch (npc.getId())
				{
					case PENNY:
					{
						htmltext = qs.isCond(2) ? "34413-07.html" : "34413-08.html";
						break;
					}
					case KARTIA:
					{
						if (qs.isCond(2))
						{
							final StringBuilder str = new StringBuilder("000");
							checkQuestCompleted(player, str); // Initialize the array with all quests completed
							if (str.indexOf("1") != -1) // verify if any quest completed
							{
								qs.setCond(4, true);
								htmltext = "33647-02.html";
							}
							else
							{
								htmltext = "33647-01.html";
							}
						}
						break;
					}
				}
				break;
			}
			case State.COMPLETED:
			{
				htmltext = getAlreadyCompletedMsg(player);
				break;
			}
		}
		return htmltext;
	}
	
	private StringBuilder checkQuestCompleted(Player player, StringBuilder string)
	{
		int index = 0;
		final char ch = '1';
		final QuestState st1 = player.getQuestState("Q00494_IncarnationOfGreedZellakaGroup");
		if ((st1 != null) && st1.isCompleted())
		{
			index = 0;
			string.setCharAt(index, ch);
		}
		final QuestState st2 = player.getQuestState("Q00495_IncarnationOfJealousyPellineGroup");
		if ((st2 != null) && st2.isCompleted())
		{
			index = 1;
			string.setCharAt(index, ch);
		}
		final QuestState st3 = player.getQuestState("Q00496_IncarnationOfGluttonyKaliosGroup");
		if ((st3 != null) && st3.isCompleted())
		{
			index = 2;
			string.setCharAt(index, ch);
		}
		return string;
	}
}
