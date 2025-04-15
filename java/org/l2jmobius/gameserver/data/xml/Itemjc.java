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
package org.l2jmobius.gameserver.data.xml;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.l2jmobius.commons.database.DatabaseFactory;
import org.l2jmobius.gameserver.model.holders.ItemjcHolder;

/**
 * @author Mobius
 */
public class Itemjc
{
	private static final Logger LOGGER = Logger.getLogger(Itemjc.class.getName());
	
	private static final Map<Integer, ItemjcHolder> Item_JC = new HashMap<>();
	
	private static final List<ItemjcHolder> itemjclist = new ArrayList<>();
	
	protected Itemjc()
	{
		load();
	}
	
	public void load()
	{
		itemjclist.clear();
		loaddz();
		LOGGER.info("隨機鍛造加成: 讀取 " + itemjclist.size() + " 個物品加成數據.");
	}

	public void loaddz()
	{
		try (Connection con = DatabaseFactory.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM dzchar"))
		{
			try (ResultSet rs = ps.executeQuery())
			{
				while (rs.next())
				{
					int id = rs.getInt("id");
					int shuzhi = rs.getInt("shuzhi");
					String part = rs.getString("part");
					int level = rs.getInt("level");
					itemjclist.add(new ItemjcHolder(id, shuzhi, part, level));
				}
			}
		}
		catch (Exception e)
		{
			LOGGER.info("隨機鍛造:讀取人物鍛造出錯");
		}
	}

	public List<ItemjcHolder> getjclists(int id)
	{
		final List<ItemjcHolder> results = new ArrayList<>();
		for (int i = 0; i < itemjclist.size(); i++)
		{
			ItemjcHolder itemjc = itemjclist.get(i);
			if (itemjc != null)
			{
				if (itemjc.getId() == id)
				{
					results.add(itemjc);
				}
			}
		}
		return results;
	}

	public void additemlist(int id, int shuzhi, String part, int level)
	{
		itemjclist.add(new ItemjcHolder(id, shuzhi, part, level));
		interitemjc(id, shuzhi, part, level);
	}

	public void delitemlist(int id, int shuzhi, String part, int level)
	{
		for (int i = 0; i < itemjclist.size(); i++)
		{
			ItemjcHolder itemjca = itemjclist.get(i);
			if (itemjca != null)
			{
				if ((itemjca.getId() == id) && (itemjca.getshuzhi() == shuzhi) && itemjca.getpart().equalsIgnoreCase(part) && (itemjca.getlevel() == level))
				{
					itemjclist.remove(itemjca);
					delitemitemjc(itemjca.getId(), itemjca.getshuzhi(), itemjca.getpart(), itemjca.getlevel());
				}
			}
		}
	}

	public void interitemjc(int id, int shuzhi, String part, int level)
	{
		try (Connection con = DatabaseFactory.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO dzchar VALUES(?,?,?,?)"))
		{
			ps.setInt(1, id);
			ps.setInt(2, shuzhi);
			ps.setString(3, part);
			ps.setInt(4, level);
			ps.executeUpdate();
		}
		catch (Exception e)
		{
			LOGGER.info("隨機鍛造:寫入出錯");
		}
	}

	public void delitemitemjc(int id, int shuzhi, String part, int level)
	{
		try (Connection con = DatabaseFactory.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM dzchar WHERE id = ? AND shuzhi=? AND part=? AND level=?"))
		{
			ps.setInt(1, id);
			ps.setInt(2, shuzhi);
			ps.setString(3, part);
			ps.setInt(4, level);
			ps.executeUpdate();
			ps.execute();
		}
		catch (SQLException e)
		{
			LOGGER.info("隨機鍛造:刪除錯誤");
		}
	}
	
	public List<ItemjcHolder> getjclists()
	{
		return itemjclist;
	}
	
	public static Itemjc getInstance()
	{
		return SingletonHolder.INSTANCE;
	}
	
	private static class SingletonHolder
	{
		protected static final Itemjc INSTANCE = new Itemjc();
	}
}
