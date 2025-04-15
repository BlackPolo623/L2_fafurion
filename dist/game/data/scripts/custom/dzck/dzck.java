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
			if (player.getInventory().getInventoryItemCount(czallfumos_Item, -1) < czallfumos_Item_need)
			{
				BuilderUtil.sendSysMessage(player, "所需道具不足，無法進行操作。");
				player.sendPacket(new PlaySound("ItemSound3.sys_enchant_failed"));
			}
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
		if (it.isWeapon())
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
		List<Item> List = new ArrayList();
		for (Item usds : player.getInventory().getItems())
		{
			if ((usds.isEquipped()) && ((usds.isArmor()) || (usds.isWeapon())))
			{
				List.add(usds);
			}
		}
		Item[] tmpList = List.toArray(new Item[List.size()]);

		int maxListPerPage = 10;
		int maxPages = tmpList.length / 10;
		if (tmpList.length > (10 * maxPages))
		{
			maxPages++;
		}
		if (page > maxPages)
		{
			page = maxPages;
		}
		int ListStart = 10 * page;
		int ListEnd = tmpList.length;
		if ((ListEnd - ListStart) > 10)
		{
			ListEnd = ListStart + 10;
		}
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();
		String htmltext = "<html><head><title>詞條系統</title></head><center><img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5><table width=276 border=0 bgcolor=333333><tr><td width=276><center><font color=b09979>請選擇基礎裝備</font></center></td></tr></table><img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
		if (tmpList.length != 0)
		{
			htmltext = htmltext + "<center><table width=276><tr>";
			for (int x = 0; x < maxPages; x++)
			{
				int pagenr = x + 1;
				htmltext = htmltext + "<td><a action=\"bypass -h Quest dzck twochakan " + x + "\">第" + pagenr + "頁</a></td>";
			}
			htmltext = htmltext + "</tr></table><br>";
		}
		for (int i = ListStart; i < ListEnd; i++)
		{
			int itemEnchantLevel = tmpList[i].getEnchantLevel();
			String itemname = tmpList[i].getItemName();
			int ojbid = tmpList[i].getObjectId();
			htmltext = htmltext + "<img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
			htmltext = htmltext + "<table width=276>";
			htmltext = htmltext + "<tr><td width=40 align=center><img src=" + tmpList[i].getTemplate().getIcon() + " width=32 height=32></td><td width=150><table>";
			htmltext = htmltext + "<tr><td width=230 height=20><font color=LEVEL>「 +" + itemEnchantLevel + " 」--「 " + itemname + " 」</font></td></tr>";
			htmltext = htmltext + "<tr><td width=230 height=20>【<a action=\"bypass -h Quest dzck fumos " + ojbid + "\">附魔屬性</a>】【<a action=\"bypass -h Quest dzck chak " + ojbid + "\">查看屬性</a>】【<a action=\"bypass -h Quest dzck qingxi " + ojbid + "\">删除附魔</a>】</td></tr></table></td></tr></table>";
		}
		if (tmpList.length == 0)
		{
			htmltext = htmltext + "<table width=276><tr><td width=40 align=center>沒有物品</td></tr></table>";
		}
		else
		{
			htmltext = htmltext + "<img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
		}
		htmltext = htmltext + "</body></html>";

		adminReply.setHtml(htmltext);
		player.sendPacket(adminReply);
	}

	public void chakanshuxing(Player player, int ObjectId)
	{
		Item it = player.getInventory().getItemByObjectId(ObjectId);
		if (it == null)
		{
			player.sendMessage("物品不存在");
			return;
		}
		String name = null;
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();
		String htmltext = "<html><head><title>詞條系統</title></head><center>";
		htmltext = htmltext + "<table width=276 height=50 border=0 cellspacing=0 cellpadding=2 background=L2UI_CT1.Windows_DF_TooltipBG><tr>";
		htmltext = htmltext + "<td width=40 height=40 align=center><img src=" + it.getTemplate().getIcon() + " width=32 height=32></td>";
		htmltext = htmltext + "<td width=200>基礎物品:<font color=LEVEL>" + it.getTemplate().getName() + "</font><br1>最大詞條數:<font color=FF6600>0" + it.getdzts() + "</font></td></tr></table><br><br>";
		htmltext = htmltext + "<table height=25 border=0 cellspacing=0 cellpadding=2 background=L2UI_CT1.Button_DF_Calculator><tr><td width=276 align=center>詞條信息</td></tr></table>";
		htmltext = htmltext + "<img src=L2UI.SquareBlank width=276 height=5>";

		List<ItemjcHolder> jic = Itemjc.getInstance().getjclists(ObjectId);
		if (jic != null)
		{
			// 根据level从高到低排序
			Collections.sort(jic, (o1, o2) -> Integer.compare(o2.getlevel(), o1.getlevel()));

			for (ItemjcHolder J : jic)
			{
				switch (J.getpart())
				{
					case "patk":
						name = "物理攻擊力";
						break;
					case "pdef":
						name = "物理防禦";
						break;
					case "matk":
						name = "魔法攻擊";
						break;
					case "mdef":
						name = "魔法防禦";
						break;
					case "pspeed":
						name = "物理攻擊速度";
						break;
					case "mspeed":
						name = "魔法攻擊速度";
						break;
					case "crates":
						name = "物理致命概率";
						break;
					case "catk":
						name = "物理致命傷害【 % 】";
						break;
					case "mrates":
						name = "魔法致命概率";
						break;
					case "revs":
						name = "物理迴避";
						break;
					case "mrevs":
						name = "魔法迴避";
						break;
					case "maxhp":
						name = "最大血量";
						break;
					case "maxmp":
						name = "最大藍量";
						break;
					case "str":
						name = "力量";
						break;
					case "dex":
						name = "敏捷";
						break;
					case "con":
						name = "體質";
						break;
					case "int":
						name = "智力";
						break;
					case "wit":
						name = "智慧";
						break;
					case "men":
						name = "精神";
						break;
				}
				htmltext = htmltext + "<table width=276 border=0 cellspacing=0 cellpadding=2><tr><td width=200>詞條屬性:" + name + "</td></tr></table><br1>";
				htmltext = htmltext + "<table width=276 border=0 cellspacing=0 cellpadding=2><tr><td><font color=LEVEL>屬性加成:增加" + J.getshuzhi() + "</font></td></tr></table><br1>";
				htmltext = htmltext + "<table width=276 border=0 cellspacing=0 cellpadding=2><tr><td>【<a action=\"bypass -h Quest dzck czfomo " + ObjectId + " " + J.getshuzhi() + " " + J.getpart() + " " + J.getlevel() + "\">重置附魔</a>】<font color=LEVEL> 此操作無法還原，請謹慎！</font></td></tr></table><br1>";
			}
		}

		htmltext = htmltext + "<button action=\"bypass -h Quest dzck twochakan 0 \" value=\"返回\" width=150 height=25 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>";
		htmltext = htmltext + "</center></body></html>";

		adminReply.setHtml(htmltext);
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