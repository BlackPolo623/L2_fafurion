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
package org.l2jmobius.gameserver.network.clientpackets.ability;

import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.network.SystemMessageId;
import org.l2jmobius.gameserver.network.clientpackets.ClientPacket;
import org.l2jmobius.gameserver.network.serverpackets.ability.ExAcquireAPSkillList;
import org.l2jmobius.gameserver.network.serverpackets.ability.ExCloseAPListWnd;

/**
 * @author UnAfraid
 */
public class RequestAbilityWndClose extends ClientPacket
{
	@Override
	protected void readImpl()
	{
	}
	
	@Override
	protected void runImpl()
	{
		final Player player = getPlayer();
		if (player == null)
		{
			return;
		}
		
		if (player.getLevel() < 85)
		{
			player.sendPacket(SystemMessageId.REACH_LEVEL_85_TO_USE_THE_ABILITY);
			return;
		}
		
		if (!player.isAwakenedClass())
		{
			player.sendPacket(SystemMessageId.THERE_ARE_NO_OTHER_SKILLS_TO_LEARN);
			return;
		}
		
		player.sendPacket(ExCloseAPListWnd.STATIC_PACKET);
		player.sendPacket(new ExAcquireAPSkillList(player));
	}
}
