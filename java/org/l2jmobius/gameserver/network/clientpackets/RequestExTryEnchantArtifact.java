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
package org.l2jmobius.gameserver.network.clientpackets;

import java.util.HashSet;
import java.util.Set;

import org.l2jmobius.commons.util.Rnd;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.item.ItemTemplate;
import org.l2jmobius.gameserver.model.item.instance.Item;
import org.l2jmobius.gameserver.network.SystemMessageId;
import org.l2jmobius.gameserver.network.serverpackets.ExTryEnchantArtifactResult;
import org.l2jmobius.gameserver.network.serverpackets.InventoryUpdate;
import org.l2jmobius.gameserver.network.serverpackets.SystemMessage;

/**
 * @author Bonux
 */
public class RequestExTryEnchantArtifact extends ClientPacket
{
	private static final int[] ENCHANT_CHANCES =
	{
		100,
		70,
		70,
		50,
		40,
		40,
		40,
		30,
		30,
		20
	};
	
	private int _targetObjectId = 0;
	private int _count = 0;
	private final Set<Integer> _ingredients = new HashSet<>();
	
	@Override
	protected void readImpl()
	{
		_targetObjectId = readInt();
		_count = readInt();
		for (int i = 0; i < _count; i++)
		{
			_ingredients.add(readInt());
		}
	}
	
	@Override
	protected void runImpl()
	{
		if (_ingredients.contains(_targetObjectId))
		{
			return;
		}
		
		final Player player = getPlayer();
		if (player == null)
		{
			return;
		}
		
		if (player.hasBlockActions() || player.isInStoreMode() || player.isProcessingRequest() || player.isFishing() || player.isInTraingCamp() || (_count != _ingredients.size()))
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		final Item targetItem = player.getInventory().getItemByObjectId(_targetObjectId);
		if (targetItem == null)
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		final ItemTemplate item = targetItem.getTemplate();
		final int artifactSlot = item.getArtifactSlot();
		if (artifactSlot <= 0)
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		final int enchantLevel = targetItem.getEnchantLevel();
		int needCount = 0;
		if (enchantLevel <= 6)
		{
			needCount = 3;
		}
		else if (enchantLevel <= 9)
		{
			needCount = 2;
		}
		
		if ((needCount == 0) || (needCount != _ingredients.size()))
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		final int chance = ENCHANT_CHANCES[enchantLevel];
		if (chance == 0)
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		int ingredientEnchant = -1;
		if (enchantLevel <= 3)
		{
			ingredientEnchant = 0;
		}
		else if (enchantLevel <= 6)
		{
			ingredientEnchant = 1;
		}
		else if (enchantLevel <= 9)
		{
			ingredientEnchant = 3;
		}
		
		if (ingredientEnchant == -1)
		{
			player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
			return;
		}
		
		for (int objectId : _ingredients)
		{
			final Item ingredient = player.getInventory().getItemByObjectId(objectId);
			if ((ingredient == null) || (ingredient.getEnchantLevel() < ingredientEnchant) || (ingredient.getTemplate().getArtifactSlot() != artifactSlot))
			{
				player.sendPacket(ExTryEnchantArtifactResult.ERROR_PACKET);
				return;
			}
			player.destroyItem("Artifact", ingredient, 1, player, true);
		}
		
		if (Rnd.get(100) < chance)
		{
			targetItem.setEnchantLevel(enchantLevel + 1);
			final InventoryUpdate iu = new InventoryUpdate();
			iu.addModifiedItem(targetItem);
			player.sendInventoryUpdate(iu);
			player.sendPacket(new SystemMessage(SystemMessageId.ARTIFACT_UPGRADE_SUCCEEDED_AND_YOU_OBTAINED_S1).addItemName(targetItem.getId()));
			player.sendPacket(new ExTryEnchantArtifactResult(ExTryEnchantArtifactResult.SUCCESS, targetItem.getEnchantLevel()));
		}
		else
		{
			player.sendPacket(SystemMessageId.FAILED_TO_UPGRADE_ARTIFACT_THE_ITEM_S_UPGRADE_LEVEL_WILL_REMAIN_THE_SAME);
			player.sendPacket(new ExTryEnchantArtifactResult(ExTryEnchantArtifactResult.FAIL, targetItem.getEnchantLevel()));
		}
	}
}
