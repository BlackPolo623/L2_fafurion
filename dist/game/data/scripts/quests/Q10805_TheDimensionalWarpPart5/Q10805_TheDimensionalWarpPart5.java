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
package quests.Q10805_TheDimensionalWarpPart5;

import java.util.HashSet;
import java.util.Set;

import org.l2jmobius.gameserver.enums.QuestSound;
import org.l2jmobius.gameserver.model.Party;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.holders.NpcLogListHolder;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

import quests.Q10804_TheDimensionalWarpPart4.Q10804_TheDimensionalWarpPart4;

/**
 * The Dimensional Warp, Part 5 (10805)
 * @URL https://l2wiki.com/The_Dimensional_Warp,_Part_5
 * @author Mobius
 */
public class Q10805_TheDimensionalWarpPart5 extends Quest
{
	// NPC
	private static final int RESED = 33974;
	// Monsters
	private static final int ABYSSAL_GOLEM = 23483;
	// Others
	private static final int MIN_LEVEL = 99;
	private static final int DARK_ETERNAL_ENHANCEMENT_STONE = 35567;
	private static final int WARP_CRYSTAL = 39597;
	
	public Q10805_TheDimensionalWarpPart5()
	{
		super(10805);
		addStartNpc(RESED);
		addTalkId(RESED);
		addKillId(ABYSSAL_GOLEM);
		addCondMinLevel(MIN_LEVEL, "33974-00.htm");
		addCondCompletedQuest(Q10804_TheDimensionalWarpPart4.class.getSimpleName(), "");
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
			case "33974-02.htm":
			case "33974-03.htm":
			{
				htmltext = event;
				break;
			}
			case "33974-04.htm":
			{
				qs.startQuest();
				htmltext = event;
				break;
			}
			case "33974-07.html":
			{
				if (qs.isCond(2))
				{
					if (player.getLevel() >= MIN_LEVEL)
					{
						addExpAndSp(player, 66530730240L, 0);
						giveItems(player, DARK_ETERNAL_ENHANCEMENT_STONE, 1);
						giveItems(player, WARP_CRYSTAL, 300);
						qs.exitQuest(false, true);
						htmltext = event;
					}
					else
					{
						htmltext = getNoQuestLevelRewardMsg(player);
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
				htmltext = "33974-01.htm";
				break;
			}
			case State.STARTED:
			{
				htmltext = (qs.isCond(1)) ? "33974-05.html" : "33974-06.html";
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
	
	@Override
	public String onKill(Npc npc, Player killer, boolean isSummon)
	{
		final Party party = killer.getParty();
		if (party != null)
		{
			party.getMembers().forEach(p -> onKill(npc, p));
		}
		else
		{
			onKill(npc, killer);
		}
		return super.onKill(npc, killer, isSummon);
	}
	
	private void onKill(Npc npc, Player killer)
	{
		final QuestState qs = getRandomPartyMemberState(killer, 1, 3, npc);
		if (qs != null)
		{
			final Player player = qs.getPlayer();
			int kills = qs.getInt("killed_" + ABYSSAL_GOLEM);
			if (kills < 100)
			{
				qs.set("killed_" + ABYSSAL_GOLEM, ++kills);
				playSound(player, QuestSound.ITEMSOUND_QUEST_ITEMGET);
			}
			if (kills >= 100)
			{
				qs.setCond(2, true);
			}
			sendNpcLogList(player);
		}
	}
	
	@Override
	public Set<NpcLogListHolder> getNpcLogList(Player player)
	{
		final QuestState qs = getQuestState(player, false);
		if ((qs != null) && qs.isCond(1))
		{
			final Set<NpcLogListHolder> holder = new HashSet<>();
			holder.add(new NpcLogListHolder(ABYSSAL_GOLEM, false, qs.getInt("killed_" + ABYSSAL_GOLEM)));
			return holder;
		}
		return super.getNpcLogList(player);
	}
}
