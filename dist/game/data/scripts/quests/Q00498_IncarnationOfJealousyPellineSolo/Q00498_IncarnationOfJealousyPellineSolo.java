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
package quests.Q00498_IncarnationOfJealousyPellineSolo;

import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

/**
 * Incarnation of Jealousy Pelline (Solo) (498)
 * @author Mobius
 */
public class Q00498_IncarnationOfJealousyPellineSolo extends Quest
{
	// NPC
	private static final int KARTIA_RESEARCHER = 33647;
	// Item
	private static final int DIMENSION_TRAVELERS_RED_BOX = 34931;
	// Boss
	private static final int BOSS = 19254; // Pelline (Solo 90)
	// Misc
	private static final int MIN_LEVEL = 90;
	private static final int MAX_LEVEL = 94;
	
	public Q00498_IncarnationOfJealousyPellineSolo()
	{
		super(498);
		addStartNpc(KARTIA_RESEARCHER);
		addTalkId(KARTIA_RESEARCHER);
		addKillId(BOSS);
		addCondLevel(MIN_LEVEL, MAX_LEVEL, "33647-00.htm");
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		final QuestState qs = getQuestState(player, false);
		if (qs == null)
		{
			return null;
		}
		
		final String htmltext = event;
		if (event.equals("33647-03.htm"))
		{
			qs.startQuest();
		}
		else if (event.equals("33647-06.html") && qs.isCond(2))
		{
			rewardItems(player, DIMENSION_TRAVELERS_RED_BOX, 1);
			qs.exitQuest(QuestType.DAILY, true);
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
				htmltext = "33647-01.htm";
				break;
			}
			case State.STARTED:
			{
				if (qs.isCond(1))
				{
					htmltext = "33647-04.html";
				}
				else if (qs.isCond(2))
				{
					if ((player.getLevel() < MIN_LEVEL) || (player.getLevel() > MAX_LEVEL))
					{
						htmltext = "33647-00a.html";
					}
					else
					{
						htmltext = "33647-05.html";
					}
				}
				break;
			}
			case State.COMPLETED:
			{
				if (!qs.isNowAvailable())
				{
					htmltext = "33647-07.html";
				}
				else
				{
					qs.setState(State.CREATED);
					htmltext = "33647-01.htm";
				}
				break;
			}
		}
		return htmltext;
	}
	
	@Override
	public String onKill(Npc npc, Player player, boolean isSummon)
	{
		final QuestState qs = getQuestState(player, false);
		if ((qs != null) && qs.isCond(1))
		{
			qs.setCond(2, true);
		}
		return super.onKill(npc, player, isSummon);
	}
}