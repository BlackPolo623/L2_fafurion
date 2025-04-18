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
package instances.danrenfuben;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import org.l2jmobius.commons.database.DatabaseFactory;
import org.l2jmobius.gameserver.instancemanager.InstanceManager;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.network.serverpackets.ExShowScreenMessage;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;

import instances.AbstractInstance;

/**
 * @author RobikBobik, Mobius
 * @NOTE: Party instance retail like work.
 * @TODO: Find what all drops from GOLBERG_TREASURE_CHEST
 * @TODO: Golberg skills
 */
public class danrenfuben extends AbstractInstance
{
	// NPCs
	private static final int SORA = 900204;// 進入npc
	private static final int RESET_HOUR = 06;// 刷新時間
	private static final int RESET_MIN = 30;// 刷新時間

	private static int iitemid = 57;
	private static long count = 30;

	// Misc
	private static int TEMPLATE_ID = 309;

	public danrenfuben()
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
			if (newBC.startsWith("單人經驗副本"))
			{
				TEMPLATE_ID = 402;
				iitemid = 57;
				count = 100000000;
			}
			if (newBC.startsWith("單人金幣副本"))
			{
				TEMPLATE_ID = 403;
				iitemid = 57;
				count = 100000000;
			}
			long time = InstanceManager.getInstance().getInstanceTime(player, TEMPLATE_ID);
			if (time < 0)
			{
				if (player.getInventory().getInventoryItemCount(iitemid, 0) >= (count * 10))
				{
					final Calendar reenter = Calendar.getInstance();
					reenter.set(Calendar.MINUTE, RESET_MIN);
					// if time is >= RESET_HOUR - roll to the next day
					if (reenter.get(Calendar.HOUR_OF_DAY) >= RESET_HOUR)
					{
						reenter.add(Calendar.DATE, 1);
					}
					reenter.set(Calendar.HOUR_OF_DAY, RESET_HOUR);
					takeItems(player, iitemid, (count * 10));
					enterInstanceone(player, npc, TEMPLATE_ID);
					InstanceManager.getInstance().setReenterPenalty(player.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
					intersj(player.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
				}
				else
				{
					player.sendPacket(new ExShowScreenMessage("道具不足【" + (count * 10) + "】個，無法進入副本！.", 3000));
				}
			}
			else
			{
				player.sendPacket(new ExShowScreenMessage("副本時間還沒有到！.", 3000));
			}
		}
		return htmltext;
	}

	public void intersj(int ojb, int temid, long time)
	{
		Connection con = null;
		try
		{
			con = DatabaseFactory.getConnection();

			PreparedStatement statement = con.prepareStatement("INSERT INTO character_instance_time (charId,instanceId,time) VALUES(?,?,?)");

			statement.setInt(1, ojb);
			statement.setInt(2, temid);
			statement.setLong(3, time);
			statement.executeUpdate();
			statement.close();
		}
		catch (Exception e)
		{
		}
		finally
		{
			try
			{
				con.close();
			}
			catch (Exception localException3)
			{
			}
		}
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReplya = new NpcHtmlMessage(0, 1);
		rateReplya.setFile(player, "data/scripts/instances/danrenfuben/danrenfuben.htm");
		player.sendPacket(rateReplya);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new danrenfuben();
		System.out.println("----------------------單人副本【副本系統】載入完畢！----------------------");
	}
}
