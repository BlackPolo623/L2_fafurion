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
package quests.Q10879_ExaltedGuideToPower;

import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.quest.Quest;
import org.l2jmobius.gameserver.model.quest.QuestState;
import org.l2jmobius.gameserver.model.quest.State;

import quests.Q10873_ExaltedReachingAnotherLevel.Q10873_ExaltedReachingAnotherLevel;

/**
 * Exalted, Guide to Power (10879)
 * @URL https://l2wiki.com/Exalted,_Guide_to_Power
 * @author Dmitri
 */
public class Q10879_ExaltedGuideToPower extends Quest
{
	// NPC
	private static final int LIONEL = 33907;
	// Items
	private static final int MASTER_CYPHONA_CERTIFICATE = 47835;
	private static final int DINFORD_CERTIFICATE = 47836;
	private static final int SETTLEN_SERTIFICATE = 47837;
	private static final int ADMIRAL_KEUCEREUS_CERTIFICATE = 47838;
	private static final int LIONEL_MISSION_LIST_5 = 47834;
	// Rewards
	private static final int VITALITY_OF_THE_EXALTED = 47855;
	private static final int DIGNITY_OF_THE_EXALTED = 47853;
	// Misc
	private static final int MIN_LEVEL = 105;
	private static final int MIN_COMPLETE_LEVEL = 104;
	
	public Q10879_ExaltedGuideToPower()
	{
		super(10879);
		addStartNpc(LIONEL);
		addTalkId(LIONEL);
		addCondMinLevel(MIN_LEVEL, "33907-00.htm");
		addCondCompletedQuest(Q10873_ExaltedReachingAnotherLevel.class.getSimpleName(), "33907-00.htm");
		registerQuestItems(LIONEL_MISSION_LIST_5, MASTER_CYPHONA_CERTIFICATE, DINFORD_CERTIFICATE, SETTLEN_SERTIFICATE, ADMIRAL_KEUCEREUS_CERTIFICATE);
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
			case "33907-03.htm":
			case "33907-04.htm":
			{
				htmltext = event;
				break;
			}
			case "33907-05.html":
			{
				if (qs.isCreated())
				{
					giveItems(player, LIONEL_MISSION_LIST_5, 1);
					qs.startQuest();
					htmltext = event;
				}
				break;
			}
			case "33907-08.html":
			{
				if (hasQuestItems(player, MASTER_CYPHONA_CERTIFICATE, DINFORD_CERTIFICATE, SETTLEN_SERTIFICATE, ADMIRAL_KEUCEREUS_CERTIFICATE) && (player.getLevel() >= MIN_COMPLETE_LEVEL))
				{
					giveItems(player, VITALITY_OF_THE_EXALTED, 1);
					giveItems(player, DIGNITY_OF_THE_EXALTED, 1);
					qs.exitQuest(false, true);
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
		String htmltext = getNoQuestMsg(player);
		final QuestState qs = getQuestState(player, true);
		switch (qs.getState())
		{
			case State.CREATED:
			{
				htmltext = "33907-01.htm";
				break;
			}
			case State.STARTED:
			{
				if (hasQuestItems(player, MASTER_CYPHONA_CERTIFICATE, DINFORD_CERTIFICATE, SETTLEN_SERTIFICATE, ADMIRAL_KEUCEREUS_CERTIFICATE) && (player.getLevel() >= MIN_COMPLETE_LEVEL))
				{
					htmltext = "33907-07.html";
				}
				else
				{
					htmltext = "33907-06.html";
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
}
