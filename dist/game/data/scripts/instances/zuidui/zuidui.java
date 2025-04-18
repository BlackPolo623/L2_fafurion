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
package instances.zuidui;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.logging.Level;

import org.l2jmobius.commons.database.DatabaseFactory;
import org.l2jmobius.gameserver.instancemanager.InstanceManager;
import org.l2jmobius.gameserver.model.Party;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.instancezone.Instance;
import org.l2jmobius.gameserver.network.serverpackets.ExShowScreenMessage;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;

import instances.AbstractInstance;

/**
 * @author RobikBobik, Mobius
 * @NOTE: Party instance retail like work.
 * @TODO: Find what all drops from GOLBERG_TREASURE_CHEST
 * @TODO: Golberg skills
 */
public class zuidui extends AbstractInstance
{
	// NPCs
	private static final int SORA = 900202;// 進入npc
	private static final int RESET_HOUR = 06;
	private static final int RESET_MIN = 30;
	// Misc
	private static int TEMPLATE_ID = 601;

	public zuidui()
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
			if (newBC.startsWith("基礎組隊副本"))
			{
				TEMPLATE_ID = 601;
			}
			if (newBC.startsWith("進階組隊副本"))
			{
				TEMPLATE_ID = 602;
			}
			final Calendar reenter = Calendar.getInstance();
			reenter.set(Calendar.MINUTE, RESET_MIN);
			// if time is >= RESET_HOUR - roll to the next day
			if (reenter.get(Calendar.HOUR_OF_DAY) >= RESET_HOUR)
			{
				reenter.add(Calendar.DATE, 1);
			}
			reenter.set(Calendar.HOUR_OF_DAY, RESET_HOUR);
			final Party party = player.getParty();
			if (party != null)
			{
				for (Player member2 : party.getMembers())
				{
					long time = InstanceManager.getInstance().getInstanceTime(member2, TEMPLATE_ID);
					if (time > 0)
					{
						player.sendPacket(new ExShowScreenMessage("該玩家[" + member2.getName() + "]已進入過副本，每天6.30分刷新.", 3000));
						member2.sendPacket(new ExShowScreenMessage("該玩家[" + member2.getName() + "]已進入過副本，每天6.30分刷新.", 3000));
						return htmltext;
					}
				}
				if (party.getMemberCount() >= 3)
				{
					enterInstanceone(player, npc, TEMPLATE_ID);
					InstanceManager.getInstance().setReenterPenalty(player.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
					intersj(player.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
					final Instance world = player.getInstanceWorld();
					if (world != null)
					{
						for (Player member : party.getMembers())
						{
							if (member == player)
							{
								continue;
							}
							InstanceManager.getInstance().setReenterPenalty(member.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
							intersj(member.getObjectId(), TEMPLATE_ID, reenter.getTimeInMillis());
							member.teleToLocation(player, 10, world);
						}
					}
				}
				else
				{
					player.sendPacket(new ExShowScreenMessage("隊伍少於3人無法進入副本.", 3000));

				}
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

	public long cheack(Player player)
	{
		long time = 0;
		try (Connection con = DatabaseFactory.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM character_instance_time WHERE charId = ?"))
		{
			ps.setInt(1, player.getObjectId());
			try (ResultSet rs = ps.executeQuery())
			{
				while (rs.next())
				{
					final long tiem = rs.getLong("time");
					time = tiem;
					return time;
				}
			}
		}
		catch (Exception e)
		{
			LOGGER.log(Level.WARNING, "Item could not restore special abilities for " + this, e);
		}
		return time;
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReplya = new NpcHtmlMessage(0, 1);
		rateReplya.setFile(player, "data/scripts/instances/zuidui/zuidui.htm");
		player.sendPacket(rateReplya);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new zuidui();
		System.out.println("----------------------多人組隊【副本系統】載入完畢！----------------------");

	}
}
