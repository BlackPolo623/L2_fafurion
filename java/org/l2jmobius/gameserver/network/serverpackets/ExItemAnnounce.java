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
package org.l2jmobius.gameserver.network.serverpackets;

import org.l2jmobius.commons.network.WritableBuffer;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.item.instance.Item;
import org.l2jmobius.gameserver.network.GameClient;
import org.l2jmobius.gameserver.network.ServerPackets;

/**
 * @author NviX, Mobius
 */
public class ExItemAnnounce extends ServerPacket
{
	public static final int ENCHANT = 0;
	public static final int RANDOM_CRAFT = 2;
	
	private final Item _item;
	private final int _type;
	private final String _announceName;
	
	public ExItemAnnounce(Player player, Item item, int type)
	{
		_item = item;
		_type = type;
		_announceName = player.getName();
	}
	
	@Override
	public void writeImpl(GameClient client, WritableBuffer buffer)
	{
		ServerPackets.EX_ITEM_ANNOUNCE.writeId(this, buffer);
		// _type
		// 0 - enchant
		// 1 - item get from container
		// 2 - item get from random creation
		// 3 - item get from special creation
		// 4 - item get from workbench?
		// 5 - item get from festival
		// 6 - item get from "limited random creation"
		// 7 - fire and item get from container
		// 8 and others - null item name by item_id and icon from chest.
		buffer.writeByte(_type); // announce type
		buffer.writeSizedString(_announceName); // name of player
		buffer.writeInt(_item.getId()); // item id
		buffer.writeByte(_item.getEnchantLevel()); // enchant level
		buffer.writeInt(0); // chest item id
	}
}