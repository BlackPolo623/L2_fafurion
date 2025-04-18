/**
 * 商業化專用腳本
 */

package custom.NewbieWelcome;

import java.util.StringTokenizer;

import org.l2jmobius.gameserver.data.xml.ItemData;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.item.ItemTemplate;
import org.l2jmobius.gameserver.network.serverpackets.ActionFailed;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;
import org.l2jmobius.gameserver.network.serverpackets.PlaySound;
import org.l2jmobius.gameserver.util.BuilderUtil;

import ai.AbstractNpcAI;

public class NewbieWelcome extends AbstractNpcAI
{
	// 基本設定
	private final static String qn = "NewbieWelcome";
	private final static int npcId = 900206; // NPC ID，請根據需要修改

	// 獎勵物品和數量設定
	private final static int[][] REWARD_ITEMS = {
			{57, 1000000},
			{57, 10},
			{57, 1},
			{57, 500},
			{57, 10000}
	};

	private NewbieWelcome()
	{
		addStartNpc(npcId);
		addTalkId(npcId);
		addFirstTalkId(npcId);
	}

	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = "";

		// 顯示領取獎勵頁面
		if (event.startsWith("view_rewards"))
		{
			showRewardPage(player);
		}
		// 領取獎勵
		else if (event.startsWith("get_rewards"))
		{
			giveRewards(player);
		}

		return htmltext;
	}

	/**
	 * 顯示獎勵頁面
	 * @param player 玩家
	 */
	private void showRewardPage(Player player)
	{
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage html = new NpcHtmlMessage();

		// 檢查玩家是否已領取過獎勵
		if (player.getVariables().getBoolean("NewbieRewardReceived", false))
		{
			// 已領取過獎勵
			html.setFile(player, "data/scripts/custom/NewbieWelcome/already_received.htm");
		}
		else
		{
			// 未領取過獎勵，顯示獎勵列表
			StringBuilder sb = new StringBuilder();
			sb.append("<html><body><center>");
			sb.append("<table width=270 border=0 cellpadding=0 cellspacing=0>");
			sb.append("<tr>");
			sb.append("<td align=center>");
			sb.append("<img src=L2UI.SquareWhite width=270 height=1>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr><td height=\"15\"></td></tr>");
			sb.append("<tr>");
			sb.append("<td align=center>");
			sb.append("<font color=b09979>新手歡迎禮包</font>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr><td height=\"5\"></td></tr>");
			sb.append("<tr>");
			sb.append("<td align=center>");
			sb.append("<img src=L2UI.SquareWhite width=270 height=1>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr><td height=\"10\"></td></tr>");
			sb.append("</table>");

			// 歡迎訊息
			sb.append("<table width=270 bgcolor=111111>");
			sb.append("<tr>");
			sb.append("<td align=center><font color=FFFF00>歡迎來到伺服器！</font></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td align=center><font color=b09979>以下是您的新手獎勵，每個角色只能領取一次</font></td>");
			sb.append("</tr>");
			sb.append("</table><br>");

			// 獎勵列表
			sb.append("<table width=270 border=0 cellpadding=0 cellspacing=0>");
			sb.append("<tr><td align=center><font color=LEVEL>獎勵內容列表：</font></td></tr>");
			sb.append("</table><br>");

			// 列出每個獎勵物品
			for (int[] reward : REWARD_ITEMS)
			{
				int itemId = reward[0];
				int count = reward[1];
				ItemTemplate item = ItemData.getInstance().getTemplate(itemId);

				sb.append("<table width=270 border=0 cellpadding=2 cellspacing=0 bgcolor=222222>");
				sb.append("<tr>");
				sb.append("<td width=32 align=center><img src=").append(item.getIcon()).append(" width=32 height=32></td>");
				sb.append("<td width=238><font color=LEVEL>").append(item.getName()).append("</font><br1>");
				sb.append("<font color=b09979>數量: ").append(count).append("</font></td>");
				sb.append("</tr>");
				sb.append("</table>");
				sb.append("<img src=L2UI.SquareGray width=270 height=1><br1>");
			}

			// 領取按鈕
			sb.append("<br>");
			sb.append("<button value=\"領取獎勵\" action=\"bypass -h Quest NewbieWelcome get_rewards\" width=120 height=30 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>");

			sb.append("</center></body></html>");

			html.setHtml(sb.toString());
		}

		player.sendPacket(html);
	}

	/**
	 * 給予玩家所有獎勵
	 * @param player 玩家
	 */
	private void giveRewards(Player player)
	{
		// 檢查玩家是否已領取過獎勵
		if (player.getVariables().getBoolean("NewbieRewardReceived", false))
		{
			BuilderUtil.sendSysMessage(player, "您已經領取過新手獎勵了！");
			return;
		}

		// 給予所有獎勵物品
		boolean allSuccess = true;
		for (int[] reward : REWARD_ITEMS)
		{
			int itemId = reward[0];
			int count = reward[1];

			// 嘗試給予物品
			if (player.getInventory().validateCapacityByItemId(itemId, count))
			{
				player.addItem("NewbieReward", itemId, count, player, true);
			}
			else
			{
				BuilderUtil.sendSysMessage(player, "您的物品欄已滿，無法領取所有獎勵！");
				allSuccess = false;
				break;
			}
		}

		// 如果所有獎勵都發放成功，標記為已領取
		if (allSuccess)
		{
			player.getVariables().set("NewbieRewardReceived", true);
			player.getVariables().storeMe(); // 確保變數被保存
			BuilderUtil.sendSysMessage(player, "成功領取所有新手獎勵！");

			// 顯示領取成功頁面
			NpcHtmlMessage html = new NpcHtmlMessage();
			StringBuilder sb = new StringBuilder();
			sb.append("<html><body><center>");
			sb.append("<table width=270 border=0 cellpadding=0 cellspacing=0>");
			sb.append("<tr>");
			sb.append("<td align=center>");
			sb.append("<img src=L2UI.SquareWhite width=270 height=1>");
			sb.append("<font color=b09979>新手歡迎禮包</font>");
			sb.append("<img src=L2UI.SquareWhite width=270 height=1>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("</table><br>");

			sb.append("<table width=270 bgcolor=111111>");
			sb.append("<tr>");
			sb.append("<td align=center><font color=FFFF00>恭喜您！</font></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td align=center><font color=b09979>您已成功領取所有新手獎勵</font></td>");
			sb.append("</tr>");
			sb.append("</table><br>");

			sb.append("<font color=LEVEL>祝您在遊戲中體驗愉快！</font>");
			sb.append("<br><br>");
			sb.append("<button value=\"關閉\" action=\"bypass -h Quest NewbieWelcome close\" width=80 height=30 back=L2UI_CT1.Button_DF_Down fore=L2UI_CT1.Button_DF>");

			sb.append("</center></body></html>");
			html.setHtml(sb.toString());
			player.sendPacket(html);
		}
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReply = new NpcHtmlMessage(0, 1);
		rateReply.setFile(player, "data/scripts/custom/NewbieWelcome/start.htm");
		player.sendPacket(rateReply);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new NewbieWelcome();
		System.out.println("----------------------新手歡迎【獎勵系統】載入完畢！----------------------");
	}
}