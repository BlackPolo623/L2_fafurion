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
package instances.gongg;

import org.l2jmobius.gameserver.instancemanager.InstanceManager;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.instancezone.Instance;
import org.l2jmobius.gameserver.model.instancezone.InstanceTemplate;
import org.l2jmobius.gameserver.network.serverpackets.ExShowScreenMessage;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;

import instances.AbstractInstance;

/**
 * @author RobikBobik, Mobius
 * @NOTE: Party instance retail like work.
 * @TODO: Find what all drops from GOLBERG_TREASURE_CHEST
 * @TODO: Golberg skills
 */
public class gongg extends AbstractInstance
{
	// NPCs
	private static final int SORA = 900203;// 進入npc
	// Misc
	private static int TEMPLATE_ID = 322;

	public gongg()
	{
		super(TEMPLATE_ID);
		addStartNpc(SORA);
		addInstanceLeaveId(TEMPLATE_ID);
		addFirstTalkId(SORA);
		addTalkId(SORA);
	}

	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = "";
		if (event.startsWith("enterInstance"))
		{
			String newBC = event.substring(14);
			int Instanceid = 600;
			if (newBC.startsWith("20級"))
			{
				TEMPLATE_ID = 888;
				Instanceid = 600;
			}
			if (newBC.startsWith("40級"))
			{
				TEMPLATE_ID = 889;
				Instanceid = 601;
			}
			if (newBC.startsWith("60級"))
			{
				TEMPLATE_ID = 890;
				Instanceid = 602;
			}
			if (newBC.startsWith("75級"))
			{
				TEMPLATE_ID = 891;
				Instanceid = 603;
			}
			InstanceTemplate template = InstanceManager.getInstance().getInstanceTemplate(TEMPLATE_ID);
			if (player.getInventory().getInventoryItemCount(57, 0) >= 5000)
			{
				takeItems(player, 57, 5000);
				boolean instance = InstanceManager.getInstance().createInstanceFromTemplate(Instanceid, TEMPLATE_ID);
				if (instance == true)
				{
					Instance instancec = InstanceManager.getInstance().createInstanceone(TEMPLATE_ID, Instanceid, player);
					player.setInstance(instancec);
					player.teleToLocation(82698, 148638, -3473);// 修改按地點
				}
				else
				{
					Instance instancea = InstanceManager.getInstance().getInstance(Instanceid);
					player.teleToLocation(82698, 148638, -3473, 0, instancea);// 修改按地點
				}
			}
			else
			{
				player.sendPacket(new ExShowScreenMessage("所需道具不足，無法進入副本！.", 3000));
			}
		}
		return htmltext;
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReplya = new NpcHtmlMessage(0, 1);
		rateReplya.setFile(player, "data/scripts/instances/gongg/gongg.htm");
		player.sendPacket(rateReplya);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new gongg();
		System.out.println("----------------------新手公共【副本系統】載入完畢！----------------------");

	}
}
