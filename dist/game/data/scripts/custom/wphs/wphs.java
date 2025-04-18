/**
 * 商業化專用腳本
 */

package custom.wphs;

import java.util.StringTokenizer;

import org.l2jmobius.gameserver.data.xml.ItemData;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.item.ItemTemplate;
import org.l2jmobius.gameserver.model.item.instance.Item;
import org.l2jmobius.gameserver.network.serverpackets.ActionFailed;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;
import org.l2jmobius.gameserver.util.BuilderUtil;

import ai.AbstractNpcAI;

public class wphs extends AbstractNpcAI
{
	
	private final static String qn = "wphs";
	private final static int npcIds = 900201;// npcid
	private final static int Djf = 1;
	private final static int Cjf = 1;
	private final static int Bjf = 1;
	private final static int Ajf = 1;
	private final static int Sjf = 1;
	private final static int Rjf = 1;
	private final static int[][] wpdh =
	{
		{
			57, // 物品id
			1000, // 數量
			10// 需要積分
		},
		{
			57, // 物品id
			10000, // 數量
			100// 需要積分
		},
		{
			57, // 物品id
			1000000, // 數量
			1000// 需要積分
		},
		{
			57, // 物品id
			100000000, // 數量
			10000// 需要積分
		},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
			{
					57, // 物品id
					1000, // 數量
					10// 需要積分
			},
	};

	private wphs()
	{
		addStartNpc(npcIds);
		addTalkId(npcIds);
		addFirstTalkId(npcIds);
	}

	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = "";
		if (event.startsWith("huishou"))
		{
			huishoudaoju(player);
		}
		if (event.startsWith("duihuan"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(8), " ");
			int page = Integer.parseInt(st.nextToken());
			liebiao(player, page);
		}
		if (event.startsWith("wpduihuan"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(10), " ");
			int i = Integer.parseInt(st.nextToken());
			duihuan(player, i);
		}
		return htmltext;
	}

	public void huishoudaoju(Player player)
	{
		for (Item it : player.getInventory().getItems())
		{
			if ((it.getEnchantLevel() <= 0) && !it.isEquipped() && (it.isArmor() || it.isWeapon()))
			{
				int jf = player.getVariables().getInt("回收積分", 0);
				switch (it.getTemplate().getItemGrade())
				{
					case D:
						player.getVariables().set("回收積分", jf + Djf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"D級物品回收，增加" + Djf + "點積分");
						break;
					case C:
						player.getVariables().set("回收積分", jf + Cjf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"C級物品回收，增加" + Cjf + "點積分");
						break;
					case B:
						player.getVariables().set("回收積分", jf + Bjf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"B級物品回收，增加" + Bjf + "點積分");
						break;
					case A:
						player.getVariables().set("回收積分", jf + Ajf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"A級物品回收，增加" + Ajf + "點積分");
						break;
					case S:
						player.getVariables().set("回收積分", jf + Sjf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"S級物品回收，增加" + Sjf + "點積分");
						break;
					case R:
						player.getVariables().set("回收積分", jf + Rjf);// 增加回收積分
						BuilderUtil.sendSysMessage(player,"R級以上物品回收，增加" + Rjf + "點積分");
						break;
				}
				takeItems(player, it.getId(), 1);
				BuilderUtil.sendSysMessage(player,"已完成所有回收");
			}
		}

	}

	public void liebiao(Player player, int page)
	{
		int maxListPerPage = 10;
		int maxPages = wpdh.length / 10;
		if (wpdh.length > (10 * maxPages))
		{
			maxPages++;
		}
		if (page > maxPages)
		{
			page = maxPages;
		}
		int ListStart = 10 * page;
		int ListEnd = wpdh.length;
		if ((ListEnd - ListStart) > 10)
		{
			ListEnd = ListStart + 10;
		}
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();

		// 創建更美觀的HTML結構
		StringBuilder htmltext = new StringBuilder();
		htmltext.append("<html><body>");
		htmltext.append("<center>");
		// 標題部分
		htmltext.append("<table width=290 border=0 cellpadding=0 cellspacing=0>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center>");
		htmltext.append("<img src=L2UI.SquareWhite width=290 height=1>");
		htmltext.append("</td>");
		htmltext.append("</tr>");
		htmltext.append("<tr><td height=\"15\"></td></tr>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center>");
		htmltext.append("<font color=b09979>回 收 積 分 商 城 系 統</font>");
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

		// 當前積分顯示
		int currentPoints = player.getVariables().getInt("回收積分", 0);
		htmltext.append("<table width=290 border=0 cellpadding=2 bgcolor=333333>");
		htmltext.append("<tr>");
		htmltext.append("<td width=290 align=center><font color=LEVEL>您當前積分: " + currentPoints + "</font></td>");
		htmltext.append("</tr>");
		htmltext.append("</table><br>");

		// 提示文字
		htmltext.append("<table width=290 bgcolor=333333>");
		htmltext.append("<tr>");
		htmltext.append("<td align=center><font color=b09979>請選擇您要兌換的商品</font></td>");
		htmltext.append("</tr>");
		htmltext.append("</table>");

		// 分頁顯示
		if (wpdh.length != 0)
		{
			htmltext.append("<table width=290>");
			htmltext.append("<tr>");
			for (int x = 0; x < maxPages; x++)
			{
				int pagenr = x + 1;
				// 當前頁面高亮顯示
				if (x == page) {
					htmltext.append("<td align=center><font color=FFFF00>第" + pagenr + "頁</font></td>");
				} else {
					htmltext.append("<td align=center><a action=\"bypass -h Quest wphs duihuan " + x + "\">第" + pagenr + "頁</a></td>");
				}
			}
			htmltext.append("</tr>");
			htmltext.append("</table><br>");
		}

		// 物品列表
		for (int i = ListStart; i < ListEnd; i++)
		{
			int itemid = wpdh[i][0];
			ItemTemplate it = ItemData.getInstance().getTemplate(itemid);
			int count = wpdh[i][1];
			int needjf = wpdh[i][2];

			// 物品展示框
			htmltext.append("<table width=290 bgcolor=111111>");
			htmltext.append("<tr>");
			htmltext.append("<td width=40 align=center><img src=" + it.getIcon() + " width=32 height=32></td>");
			htmltext.append("<td width=250>");

			// 物品信息
			htmltext.append("<table width=250>");
			htmltext.append("<tr><td><font color=LEVEL>" + it.getName() + "</font></td></tr>");
			htmltext.append("<tr><td><font color=b09979>兌換數量：" + count + " 個</font></td></tr>");
			htmltext.append("<tr><td><font color=b09979>需要積分：" + needjf + " 點</font></td></tr>");

			// 兌換按鈕 - 根據積分狀態顯示不同顏色
			if (currentPoints >= needjf) {
				htmltext.append("<tr><td><button value=\"立即兌換\" action=\"bypass -h Quest wphs wpduihuan " + i + "\" width=90 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df></td></tr>");
			} else {
				htmltext.append("<tr><td><font color=FF0000>積分不足</font></td></tr>");
			}

			htmltext.append("</table>");
			htmltext.append("</td>");
			htmltext.append("</tr>");
			htmltext.append("</table>");

			// 添加間隔
			htmltext.append("<img src=L2UI.SquareGray width=290 height=1><br1>");
		}

		// 無物品時顯示提示
		if (wpdh.length == 0)
		{
			htmltext.append("<table width=290>");
			htmltext.append("<tr><td align=center>暫無可兌換物品</td></tr>");
			htmltext.append("</table>");
		}

		// 底部按鈕
		htmltext.append("<br>");
		htmltext.append("<button value=\"回收裝備\" action=\"bypass -h Quest wphs huishou\" width=90 height=20 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>");

		htmltext.append("</center>");
		htmltext.append("</body></html>");

		adminReply.setHtml(htmltext.toString());
		player.sendPacket(adminReply);
	}

	public void duihuan(Player player, int i)
	{
		int itemid = wpdh[i][0];
		ItemTemplate it = ItemData.getInstance().getTemplate(itemid);
		int count = wpdh[i][1];
		int needjf = wpdh[i][2];
		int jf = player.getVariables().getInt("回收積分", 0);
		if (jf >= needjf)
		{
			int deljf = jf - needjf;
			player.getVariables().set("回收積分", deljf);
			player.addItem("道具", itemid, count, null, true);
		}
		else
		{
			BuilderUtil.sendSysMessage(player, "回收積分不足夠!");
		}
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReply = new NpcHtmlMessage(0, 1);
		rateReply.setFile(player, "data/scripts/custom/wphs/wphs.htm");
		rateReply.replace("%PointCount%", player.getVariables().getInt("回收積分",0));
		player.sendPacket(rateReply);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new wphs();
		System.out.println("----------------------回收裝備【積分兌換】載入完畢！----------------------");
	}
}