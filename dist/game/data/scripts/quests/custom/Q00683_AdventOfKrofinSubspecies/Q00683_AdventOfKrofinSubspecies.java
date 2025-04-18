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
package quests.custom.Q00683_AdventOfKrofinSubspecies;

import java.util.HashSet;
import java.util.Set;

import org.l2jmobius.gameserver.enums.QuestSound;
import org.l2jmobius.gameserver.enums.QuestType;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.holders.NpcLogListHolder;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;
import org.l2jmobius.gameserver.network.NpcStringId;

/**
 * Advent of Krofin Subspecies (683)
 * @URL https://l2wiki.com/Advent_of_Krofin_Subspecies
 * @author Liamxroy
 */
public class Q00683_AdventOfKrofinSubspecies extends Quest
{
	// NPCs
	private static final int START_NPC_1 = 33907;
	private static final int START_NPC_2 = 34480;
	private static final int[] MONSTERS =
	{
		24309,
		24310,
		24311,
		24312,
		24313,
		24314,
		24315,
		24316,
	};
	// Misc
	private static final int REQUIRED_KILL_COUNT = 250;
	private static final String KILL_COUNT_VAR = "KillCount";
	private static final int KILLING_NPCSTRING_ID = NpcStringId.DEFEAT_KROFIN_SUBSPECIES.getId();
	private static final QuestType QUEST_TYPE = QuestType.DAILY; // REPEATABLE, ONE_TIME, DAILY
	private static final boolean PARTY_QUEST = false;
	private static final int KILLING_COND = 1;
	private static final int FINISH_COND = 2;
	private static final int MIN_LEVEL = 106;
	
	public Q00683_AdventOfKrofinSubspecies()
	{
		super(683);
		addStartNpc(START_NPC_1, START_NPC_2);
		addTalkId(START_NPC_1, START_NPC_2);
		addKillId(MONSTERS);
		addCondMinLevel(MIN_LEVEL, getNoQuestMsg(null));
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		final QuestState qs = getQuestState(player, false);
		if (qs == null)
		{
			return null;
		}
		
		switch (event)
		{
			case "accept.htm":
			case "accept2.htm":
			{
				if (qs.isCreated())
				{
					qs.startQuest();
					qs.setCond(KILLING_COND);
				}
				break;
			}
			case "reward.html":
			case "reward2.html":
			{
				if (qs.isCond(FINISH_COND) && (qs.getInt(KILL_COUNT_VAR) >= REQUIRED_KILL_COUNT))
				{
					// Reward.
					addExpAndSp(player, 49763842650L, 49763790);
					giveAdena(player, 3225882, false);
					qs.exitQuest(QUEST_TYPE, true);
				}
				break;
			}
			default:
			{
				return null;
			}
		}
		return event;
	}
	
	@Override
	public String onTalk(Npc npc, Player player)
	{
		final QuestState qs = getQuestState(player, true);
		String htmltext = getNoQuestMsg(player);
		if (npc.getId() == START_NPC_1)
		{
			switch (qs.getState())
			{
				case State.CREATED:
				{
					htmltext = "start.htm";
					break;
				}
				case State.STARTED:
				{
					if (qs.isCond(KILLING_COND))
					{
						htmltext = "accept.htm";
					}
					else if (qs.isCond(FINISH_COND))
					{
						htmltext = "finish.html";
					}
					break;
				}
				case State.COMPLETED:
				{
					if (qs.isNowAvailable())
					{
						qs.setState(State.CREATED);
						htmltext = "start.htm";
					}
					else
					{
						htmltext = getAlreadyCompletedMsg(player, QUEST_TYPE);
					}
					break;
				}
			}
		}
		
		if (npc.getId() == START_NPC_2)
		{
			switch (qs.getState())
			{
				case State.CREATED:
				{
					htmltext = "start2.htm";
					break;
				}
				case State.STARTED:
				{
					if (qs.isCond(KILLING_COND))
					{
						htmltext = "accept2.htm";
					}
					else if (qs.isCond(FINISH_COND))
					{
						htmltext = "finish2.html";
					}
					break;
				}
				case State.COMPLETED:
				{
					if (qs.isNowAvailable())
					{
						qs.setState(State.CREATED);
						htmltext = "start2.htm";
					}
					else
					{
						htmltext = getAlreadyCompletedMsg(player, QUEST_TYPE);
					}
					break;
				}
			}
		}
		return htmltext;
	}
	
	@Override
	public String onKill(Npc npc, Player killer, boolean isSummon)
	{
		final QuestState qs = PARTY_QUEST ? getRandomPartyMemberState(killer, -1, 3, npc) : getQuestState(killer, false);
		if ((qs != null) && qs.isCond(KILLING_COND))
		{
			final Player player = qs.getPlayer();
			final int killCount = qs.getInt(KILL_COUNT_VAR) + 1;
			if (killCount <= REQUIRED_KILL_COUNT)
			{
				qs.set(KILL_COUNT_VAR, killCount);
				if (killCount >= REQUIRED_KILL_COUNT)
				{
					qs.setCond(FINISH_COND, true);
				}
				else // if (killCount < REQUIRED_KILL_COUNT)
				{
					playSound(player, QuestSound.ITEMSOUND_QUEST_ITEMGET);
					sendNpcLogList(player);
				}
			}
		}
		return super.onKill(npc, killer, isSummon);
	}
	
	@Override
	public Set<NpcLogListHolder> getNpcLogList(Player player)
	{
		final QuestState qs = getQuestState(player, false);
		if ((qs != null) && qs.isCond(KILLING_COND))
		{
			final Set<NpcLogListHolder> holder = new HashSet<>();
			holder.add(new NpcLogListHolder(KILLING_NPCSTRING_ID, true, qs.getInt(KILL_COUNT_VAR)));
			return holder;
		}
		return super.getNpcLogList(player);
	}
}
