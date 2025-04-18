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
package ai.areas.GardenOfSpirits.Eubina;

import org.l2jmobius.gameserver.enums.Faction;
import org.l2jmobius.gameserver.model.Location;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;

import ai.AbstractNpcAI;

/**
 * @author Mobius
 */
public class Eubina extends AbstractNpcAI
{
	// NPC
	private static final int EUBINA = 34238;
	// Teleport
	private static final Location BLACKBIRD_CAMPSITE = new Location(-48354, 69435, -3081);
	
	private Eubina()
	{
		addFirstTalkId(EUBINA);
		addTalkId(EUBINA);
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = null;
		switch (event)
		{
			case "teleport":
			{
				if (player.getFactionLevel(Faction.UNWORLDLY_VISITORS) < 4)
				{
					htmltext = "34238-01.html";
				}
				else
				{
					player.teleToLocation(BLACKBIRD_CAMPSITE);
				}
				break;
			}
		}
		return htmltext;
	}
	
	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		return "34238.html";
	}
	
	public static void main(String[] args)
	{
		new Eubina();
	}
}
