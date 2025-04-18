/**
 * 商業化專用腳本
 */

package custom.dzck;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

import org.l2jmobius.commons.util.Rnd;
import org.l2jmobius.gameserver.data.xml.Itemjc;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.holders.ItemjcHolder;
import org.l2jmobius.gameserver.model.item.instance.Item;
import org.l2jmobius.gameserver.network.serverpackets.ActionFailed;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;
import org.l2jmobius.gameserver.network.serverpackets.PlaySound;
import org.l2jmobius.gameserver.util.BuilderUtil;

import ai.AbstractNpcAI;

public class dzck extends AbstractNpcAI
{
	
	private final static String qn = "dzck";
	private final static int npcIds = 900200;// npcid
	private final static int fumos_Item = 57;
	private final static int fumos_Item_need = 100000;
	private final static int czfumos_Item = 57;
	private final static int czfumos_Item_need = 10000000;
	private final static int czallfumos_Item = 57;
	private final static int czallfumos_Item_need = 5000000;
	
	private dzck()
	{
		addStartNpc(npcIds);
		addTalkId(npcIds);
		addFirstTalkId(npcIds);
	}
	
	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = "";
		if (event.startsWith("xuan"))
		{
			chakanliebiao(player, 0);
		}
		if (event.startsWith("chak"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(5), " ");
			int itemidojbid = Integer.parseInt(st.nextToken());
			chakanshuxing(player, itemidojbid);
		}
		if (event.startsWith("twochakan"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(10), " ");
			int page = Integer.parseInt(st.nextToken());
			chakanliebiao(player, page);
		}
		if (event.startsWith("fumos"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(6), " ");
			int ojbid = Integer.parseInt(st.nextToken());
			if (player.getInventory().getInventoryItemCount(fumos_Item, -1) < fumos_Item_need)
			{
				BuilderUtil.sendSysMessage(player, "所需道具不足，無法進行操作。");
				player.sendPacket(new PlaySound("ItemSound3.sys_enchant_failed"));
			}
			fumo(player, ojbid);
		}
		if (event.startsWith("czfomo"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(7), " ");
			int ojbid = Integer.parseInt(st.nextToken());
			int shuzhi = Integer.parseInt(st.nextToken());
			String part = String.valueOf(st.nextToken());
			int level = Integer.parseInt(st.nextToken());
			
			if (player.getInventory().getInventoryItemCount(czfumos_Item, -1) < czfumos_Item_need)
			{
				BuilderUtil.sendSysMessage(player, "所需道具不足，無法進行操作。");
				player.sendPacket(new PlaySound("ItemSound3.sys_enchant_failed"));
			}
			else
			{
				BuilderUtil.sendSysMessage(player, "已扣除附魔道具，重新進行附魔");
				takeItems(player, czfumos_Item, czfumos_Item_need);
				player.sendPacket(new PlaySound("ItemSound3.sys_sow_success"));
				czfumo(player, ojbid, shuzhi, part, level);
			}
		}
		if (event.startsWith("qingxi"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(7), " ");
			int ojbid = Integer.parseInt(st.nextToken());
			qingxi(player, ojbid);
		}
		return htmltext;
	}
	
	public void qingxi(Player player, int ojbid)
	{
		Item it = player.getInventory().getItemByObjectId(ojbid);
		if (player.getInventory().getInventoryItemCount(fumos_Item, -1) < fumos_Item_need)
		{
			BuilderUtil.sendSysMessage(player, "道具不足，無法進行清除附魔");
			player.sendPacket(new PlaySound("ItemSound3.sys_enchant_failed"));
		}
		else
		{
			BuilderUtil.sendSysMessage(player, "已扣除附魔清除道具，清除附魔");
			takeItems(player, fumos_Item, fumos_Item_need);
			player.broadcastUserInfo();
			player.sendPacket(new PlaySound("ItemSound2.broken_key"));
			List<ItemjcHolder> jic = Itemjc.getInstance().getjclists(ojbid);
			for (ItemjcHolder js : jic)
			{
				Itemjc.getInstance().delitemlist(js.getId(), js.getshuzhi(), js.getpart(), js.getlevel());
			}
		}
		chakanshuxing(player, ojbid);
	}
	
	public void fumo(Player player, int ojbid)
	{
		Item it = player.getInventory().getItemByObjectId(ojbid);
		if (it.getitemjccs() == it.getdzts())
		{
			BuilderUtil.sendSysMessage(player, "附魔數量已達上限，無法進行附魔，不扣除道具");
			player.sendPacket(new PlaySound("ItemSound3.sys_enchant_failed"));
		}
		else
		{
			BuilderUtil.sendSysMessage(player, "已扣除附魔道具，進行附魔");
			takeItems(player, fumos_Item, fumos_Item_need);
			player.sendPacket(new PlaySound("ItemSound3.sys_enchant_success"));
		}
		String[] ctmz =
		{
			"patk",
			"pdef",
			"mdef",
			"matk",
			"pspeed",
			"mspeed",
			"crates",
			"catk",
			"mrates",
			"revs",
			"mrevs",
			"maxhp",
			"maxmp",
			"str",
			"dex",
			"con",
			"int",
			"wit",
			"men",
		
		};
		if (it.isWeapon() || it.isArmor())
		{
			if ((it.getdzts() > 0) && (it.getitemjccs() < it.getdzts()))
			{
				int shengyuts = it.getdzts() - it.getitemjccs();
				for (int cishu = 0; cishu < shengyuts; cishu++)
				{
					int duanzs = (it.getdzsz());
					int shuxing = Rnd.get(0, 18);
					String jiac = ctmz[shuxing];
					switch (jiac)
					{
						case "patk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "pdef":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mdef":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "matk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "pspeed":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mspeed":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "crates":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "catk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mrates":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "revs":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mrevs":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "maxhp":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "maxmp":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "str":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "dex":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "con":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "int":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "wit":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "men":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
					}
					Itemjc.getInstance().additemlist(ojbid, Rnd.get(1, duanzs), jiac, cishu + 1);
				}
			}
		}
		player.broadcastUserInfo();
		chakanshuxing(player, ojbid);
	}
	
	public void czfumo(Player player, int ojbid, int shuzhi, String part, int level)
	{
		Item it = player.getInventory().getItemByObjectId(ojbid);
		
		String[] ctmz =
		{
			"patk",
			"pdef",
			"mdef",
			"matk",
			"pspeed",
			"mspeed",
			"crates",
			"catk",
			"mrates",
			"revs",
			"mrevs",
			"maxhp",
			"maxmp",
			"str",
			"dex",
			"con",
			"int",
			"wit",
			"men",
		
		};
		Itemjc.getInstance().delitemlist(ojbid, shuzhi, part, level);
		if (it.isWeapon() || it.isArmor())
		{
			if ((it.getdzts() > 0) && (it.getitemjccs() < it.getdzts()))
			{
				int shengyuts = it.getdzts() - it.getitemjccs();
				for (int cishu = 0; cishu < shengyuts; cishu++)
				{
					int duanzs = (it.getdzsz());
					int shuxing = Rnd.get(0, 18);
					String jiac = ctmz[shuxing];
					switch (jiac)
					{
						case "patk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "pdef":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mdef":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "matk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "pspeed":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mspeed":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "crates":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "catk":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mrates":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "revs":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "mrevs":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "maxhp":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "maxmp":
							if (duanzs == 1)
							{
								duanzs = 1000;
							}
							else
							{
								duanzs *= 1000;
							}
							break;
						case "str":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "dex":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "con":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "int":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "wit":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
						case "men":
							if (duanzs == 1)
							{
								duanzs = 1;
							}
							else
							{
								duanzs *= 5;
							}
							break;
					}
					Itemjc.getInstance().additemlist(ojbid, Rnd.get(1, duanzs), jiac, cishu + 1);
				}
			}
		}
		player.broadcastUserInfo();
		chakanshuxing(player, ojbid);
	}

	public void chakanliebiao(Player player, int page)
	{
		// 獲取已裝備的物品列表
		List<Item> List = new ArrayList<>();
		for (Item usds : player.getInventory().getItems())
		{
			if ((usds.isEquipped()) && ((usds.isArmor()) || (usds.isWeapon())))
			{
				List.add(usds);
			}
		}
		Item[] tmpList = List.toArray(new Item[List.size()]);

		// 分頁邏輯 - 修改為一頁4個物品
		int maxListPerPage = 4; // 修改為4個物品一頁
		int maxPages = tmpList.length / maxListPerPage;
		if (tmpList.length > (maxListPerPage * maxPages))
		{
			maxPages++;
		}
		if (page > maxPages)
		{
			page = maxPages;
		}
		int ListStart = maxListPerPage * page;
		int ListEnd = tmpList.length;
		if ((ListEnd - ListStart) > maxListPerPage)
		{
			ListEnd = ListStart + maxListPerPage;
		}

		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();

		// 使用StringBuilder提高性能
		StringBuilder htmltext = new StringBuilder();

		// 頁面頭部
		htmltext.append("<html><body><center>");
		htmltext.append("<img src=L2UI.SquareGray width=270 height=1>");
		htmltext.append("<table width=270 border=0 bgcolor=333333>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center><font color=b09979>裝備附魔系統</font></td>");
		htmltext.append("</tr>");
		htmltext.append("</table>");
		htmltext.append("<img src=L2UI.SquareGray width=270 height=1>");
		htmltext.append("<br><br>"); // 增加上方間距

		// 系統說明
		htmltext.append("<table width=270 border=0 bgcolor=111111>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center><font color=b09979>請選擇需要進行附魔的裝備</font></td>");
		htmltext.append("</tr>");
		htmltext.append("</table>");
		htmltext.append("<br><br>"); // 增加間距

		// 分頁顯示
		if (tmpList.length > 0 && maxPages > 0)
		{
			htmltext.append("<table width=270>");
			htmltext.append("<tr>");
			for (int x = 0; x < maxPages; x++)
			{
				int pagenr = x + 1;
				if (x == page) {
					htmltext.append("<td align=center><font color=FFFF00>第").append(pagenr).append("頁</font></td>");
				} else {
					htmltext.append("<td align=center><a action=\"bypass -h Quest dzck twochakan ").append(x).append("\">第").append(pagenr).append("頁</a></td>");
				}
			}
			htmltext.append("</tr>");
			htmltext.append("</table>");
			htmltext.append("<br>"); // 增加間距

			// 裝備列表
			for (int i = ListStart; i < ListEnd; i++)
			{
				int itemEnchantLevel = tmpList[i].getEnchantLevel();
				String itemname = tmpList[i].getItemName();
				int ojbid = tmpList[i].getObjectId();

				// 分隔線
				htmltext.append("<img src=L2UI.SquareGray width=270 height=1>");
				htmltext.append("<br>"); // 增加間距

				// 每個裝備項目 - 修正版面結構
				htmltext.append("<table width=270 border=0 cellpadding=0 cellspacing=0>");

				// 第一行: 圖標和名稱
				htmltext.append("<tr>");
				htmltext.append("<td width=40 align=center>");
				htmltext.append("<img src=").append(tmpList[i].getTemplate().getIcon()).append(" width=32 height=32>");
				htmltext.append("</td>");
				htmltext.append("<td width=230>");

				// 裝備名稱和強化等級
				if (itemEnchantLevel > 0) {
					htmltext.append("<font color=LEVEL>+").append(itemEnchantLevel).append(" ").append(itemname).append("</font>");
				} else {
					htmltext.append("<font color=LEVEL>").append(itemname).append("</font>");
				}

				htmltext.append("</td>");
				htmltext.append("</tr>");

				// 第二行: 放三個按鈕
				htmltext.append("<tr>");
				htmltext.append("<td></td>"); // 圖標列留空
				htmltext.append("<td>");

				// 按鈕區域
				htmltext.append("<table width=230 border=0 cellpadding=0 cellspacing=0>");
				htmltext.append("<tr>");

				// 使用帶圖形的按鈕
				htmltext.append("<td width=76 align=center>");
				htmltext.append("<button value=\"附魔屬性\" action=\"bypass -h Quest dzck fumos ").append(ojbid).append("\" width=72 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>");
				htmltext.append("</td>");

				htmltext.append("<td width=76 align=center>");
				htmltext.append("<button value=\"查看屬性\" action=\"bypass -h Quest dzck chak ").append(ojbid).append("\" width=72 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>");
				htmltext.append("</td>");

				htmltext.append("<td width=76 align=center>");
				htmltext.append("<button value=\"刪除附魔\" action=\"bypass -h Quest dzck qingxi ").append(ojbid).append("\" width=72 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>");
				htmltext.append("</td>");

				htmltext.append("</tr>");
				htmltext.append("</table>");

				htmltext.append("</td>");
				htmltext.append("</tr>");

				htmltext.append("</table>");
				htmltext.append("<br>"); // 增加間距
			}

			// 底部分隔線
			htmltext.append("<img src=L2UI.SquareGray width=270 height=1>");
		}
		else
		{
			// 無裝備時的提示
			htmltext.append("<table width=270 bgcolor=333333>");
			htmltext.append("<tr><td align=center><font color=FF6600>您當前沒有已裝備的物品</font></td></tr>");
			htmltext.append("<tr><td align=center><font color=AAAAAA>請先穿戴要附魔的裝備</font></td></tr>");
			htmltext.append("</table>");
		}

		// 底部說明
		htmltext.append("<br><br>"); // 增加間距
		htmltext.append("<font color=FF0000>※注意: 只能為已裝備的武器/防具進行附魔</font>");

		htmltext.append("</center></body></html>");

		adminReply.setHtml(htmltext.toString());
		player.sendPacket(adminReply);
	}

	public void chakanshuxing(Player player, int ObjectId)
	{
		Item it = player.getInventory().getItemByObjectId(ObjectId);
		if (it == null)
		{
			BuilderUtil.sendSysMessage(player,"物品不存在");
			return;
		}
		String name = null;
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();

		// 使用StringBuilder提高性能
		StringBuilder htmltext = new StringBuilder();

		// 頁面頭部
		htmltext.append("<html><body><center>");
		htmltext.append("<table width=290 border=0 cellpadding=0 cellspacing=0>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center>");
		htmltext.append("<img src=L2UI.SquareWhite width=290 height=1>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("<tr><td height=\"15\"></td></tr>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center>");
		htmltext.append("<font color=b09979>裝備附魔屬性詳情</font>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("<tr><td height=\"5\"></td></tr>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center>");
		htmltext.append("<img src=L2UI.SquareWhite width=290 height=1>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("<tr><td height=\"10\"></td></tr>");
		htmltext.append("</table>");

		// 分隔線
		htmltext.append("<img src=L2UI.SquareGray width=290 height=1><br>");

		// 物品基本信息區
		htmltext.append("<table width=290 height=60 border=0 cellspacing=0 cellpadding=0 background=L2UI_CT1.Windows_DF_TooltipBG>");
		htmltext.append("<tr>");
		htmltext.append("<td width=40 height=40 align=center><img src=").append(it.getTemplate().getIcon()).append(" width=32 height=32></td>");
		htmltext.append("<td width=250>");
		htmltext.append("<table width=250>");

		// 物品名稱和強化值
		int enchantLevel = it.getEnchantLevel();
		if (enchantLevel > 0) {
			htmltext.append("<tr><td><font color=LEVEL>+").append(enchantLevel).append(" ").append(it.getTemplate().getName()).append("</font></td></tr>");
		} else {
			htmltext.append("<tr><td><font color=LEVEL>").append(it.getTemplate().getName()).append("</font></td></tr>");
		}

		// 物品等級和詞條數
		htmltext.append("<tr><td>裝備等級: <font color=FFFF00>").append(it.getTemplate().getItemGrade()).append("</font></td></tr>");
		htmltext.append("<tr><td>最大詞條數: <font color=FF6600>").append(it.getdzts()).append("</font></td></tr>");
		htmltext.append("</table>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("</table><br>");

		// 詞條信息標題
		htmltext.append("<table width=290 height=25 border=0 cellspacing=0 cellpadding=0 background=L2UI_CT1.Button_DF_Calculator>");
		htmltext.append("<tr><td align=center><font color=FFFFFF>詞條信息列表</font></td></tr>");
		htmltext.append("</table><br>");

		// 獲取詞條列表
		List<ItemjcHolder> jic = Itemjc.getInstance().getjclists(ObjectId);

		// 詞條信息顯示區域
		if (jic != null && !jic.isEmpty())
		{
			// 根據level從高到低排序
			Collections.sort(jic, (o1, o2) -> Integer.compare(o2.getlevel(), o1.getlevel()));

			// 顯示當前詞條數量
			htmltext.append("<table width=290 bgcolor=333333>");
			htmltext.append("<tr><td align=center><font color=b09979>當前詞條數: <font color=FFFF00>").append(jic.size()).append("</font> / ").append(it.getdzts()).append("</font></td></tr>");
			htmltext.append("</table><br>");

			// 遍歷所有詞條
			for (int i = 0; i < jic.size(); i++)
			{
				ItemjcHolder J = jic.get(i);

				// 根據屬性類型設置名稱
				switch (J.getpart())
				{
					case "patk": name = "物理攻擊力"; break;
					case "pdef": name = "物理防禦"; break;
					case "matk": name = "魔法攻擊"; break;
					case "mdef": name = "魔法防禦"; break;
					case "pspeed": name = "物理攻擊速度"; break;
					case "mspeed": name = "魔法攻擊速度"; break;
					case "crates": name = "物理致命概率"; break;
					case "catk": name = "物理致命傷害"; break;
					case "mrates": name = "魔法致命概率"; break;
					case "revs": name = "物理迴避"; break;
					case "mrevs": name = "魔法迴避"; break;
					case "maxhp": name = "最大血量"; break;
					case "maxmp": name = "最大藍量"; break;
					case "str": name = "力量"; break;
					case "dex": name = "敏捷"; break;
					case "con": name = "體質"; break;
					case "int": name = "智力"; break;
					case "wit": name = "智慧"; break;
					case "men": name = "精神"; break;
					default: name = "未知屬性"; break;
				}

				// 詞條框架
				htmltext.append("<table width=290 border=0 cellspacing=1 cellpadding=2 bgcolor=111111>");

				// 詞條等級標記
				htmltext.append("<tr>");
				htmltext.append("<td width=290 align=center>");
				htmltext.append("<font color=FFFF00>第 ").append(J.getlevel()).append(" 級詞條</font>");
				htmltext.append("</td>");
				htmltext.append("</tr>");

				// 詞條詳細信息
				htmltext.append("<tr>");
				htmltext.append("<td width=290>");
				htmltext.append("<table width=290 border=0>");
				htmltext.append("<tr>");
				htmltext.append("<td width=145>屬性類型: <font color=b09979>").append(name).append("</font></td>");
				htmltext.append("<td width=145>加成值: <font color=LEVEL>+").append(J.getshuzhi()).append("</font></td>");
				htmltext.append("</tr>");
				htmltext.append("</table>");
				htmltext.append("</td>");
				htmltext.append("</tr>");

				// 重置附魔按鈕
				htmltext.append("<tr>");
				htmltext.append("<td align=center>");
				htmltext.append("<button value=\"重置此詞條\" action=\"bypass -h Quest dzck czfomo ").append(ObjectId).append(" ").append(J.getshuzhi()).append(" ").append(J.getpart()).append(" ").append(J.getlevel()).append("\" width=120 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>");
				htmltext.append("</td>");
				htmltext.append("</tr>");

				htmltext.append("</table><br1>");
			}
		}
		else
		{
			// 無詞條時顯示提示
			htmltext.append("<table width=290 bgcolor=333333>");
			htmltext.append("<tr><td align=center><font color=b09979>當前無任何詞條，請先進行附魔</font></td></tr>");
			htmltext.append("</table><br>");
		}

		// 操作按鈕區
		htmltext.append("<table width=290>");
		htmltext.append("<tr>");
		htmltext.append("<td width=95 align=center>");
		htmltext.append("<button value=\"附魔屬性\" action=\"bypass -h Quest dzck fumos ").append(ObjectId).append("\" width=90 height=25 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>");
		htmltext.append("</td>");
		htmltext.append("<td width=95 align=center>");
		htmltext.append("<button value=\"清除全部\" action=\"bypass -h Quest dzck qingxi ").append(ObjectId).append("\" width=90 height=25 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>");
		htmltext.append("</td>");
		htmltext.append("<td width=95 align=center>");
		htmltext.append("<button value=\"返回列表\" action=\"bypass -h Quest dzck twochakan 0\" width=90 height=25 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("</table>");

		// 警告提示
		htmltext.append("<br>");
		htmltext.append("<font color=FF0000>※注意: 重置或清除附魔操作無法還原，請謹慎操作！</font>");

		htmltext.append("</center></body></html>");

		adminReply.setHtml(htmltext.toString());
		player.sendPacket(adminReply);
	}
	
	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReply = new NpcHtmlMessage(0, 1);
		rateReply.setFile(player, "data/scripts/custom/dzck/dzck.htm");
		player.sendPacket(rateReply);
		return htmltext;
	}
	
	public static void main(String[] args)
	{
		new dzck();
		System.out.println("----------------------隨機鍛造【附魔系統】載入完畢！----------------------");
	}
}