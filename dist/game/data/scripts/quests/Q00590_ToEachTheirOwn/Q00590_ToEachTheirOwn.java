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
package quests.Q00590_ToEachTheirOwn;

import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

/**
 * To Each Their Own (590)
 * @URL https://l2wiki.com/To_Each_Their_Own
 * @author Dmitri
 */
public class Q00590_ToEachTheirOwn extends Quest
{
	// NPCs
	private static final int CORZET = 34424;
	// Monsters
	private static final int[] MONSTERS =
	{
		24204, // Silence Hannibal
		24205, // Silence Phantom
		24206, // Silence Preacle
	};
	// Misc
	private static final int MIN_LEVEL = 95;
	private static final int MAX_LEVEL = 105;
	// Items
	private static final int DUST_OF_DESTROYED_DEMON = 48534; // Quest item: Dust of Destroyed Demon
	
	public Q00590_ToEachTheirOwn()
	{
		super(590);
		addStartNpc(CORZET);
		addTalkId(CORZET);
		addKillId(MONSTERS);
		registerQuestItems(DUST_OF_DESTROYED_DEMON);
		addCondLevel(MIN_LEVEL, MAX_LEVEL, "nolevel.html");
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
			case "34424-03.htm":
			case "34424-02.htm":
			{
				htmltext = event;
				break;
			}
			case "34424-04.htm":
			{
				qs.startQuest();
				htmltext = event;
				break;
			}
			case "34424-07.html":
			{
				if (qs.isCond(2))
				{
					giveAdena(player, 680100, true);
					addExpAndSp(player, 1793099880L, 1793070);
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
		if (npc.getId() == CORZET)
		{
			switch (qs.getState())
			{
				case State.CREATED:
				{
					htmltext = "34424-01.htm";
					qs.isStarted();
					break;
				}
				case State.STARTED:
				{
					if (qs.isCond(1))
					{
						htmltext = "34424-05.html";
					}
					else if (qs.isCond(2))
					{
						htmltext = "34424-06.html";
					}
					break;
				}
				case State.COMPLETED:
				{
					if (!qs.isNowAvailable())
					{
						htmltext = "34424-00.htm";
						break;
					}
					qs.setState(State.CREATED);
					// fallthrough
				}
			}
		}
		return htmltext;
	}
	
	@Override
	public String onKill(Npc npc, Player killer, boolean isSummon)
	{
		final QuestState qs = getRandomPartyMemberState(killer, -1, 3, npc);
		if ((qs != null) && qs.isCond(1) && giveItemRandomly(killer, DUST_OF_DESTROYED_DEMON, 1, 50, 1, true))
		{
			qs.setCond(2, true);
		}
		return super.onKill(npc, killer, isSummon);
	}
}
