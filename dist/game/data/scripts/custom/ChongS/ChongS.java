/**
 * Jacky 製作,商業化專用腳本
 */

package custom.ChongS;

import java.util.StringTokenizer;

import org.l2jmobius.gameserver.data.xml.ItemData;
import org.l2jmobius.gameserver.data.xml.SkillData;
import org.l2jmobius.gameserver.model.actor.Npc;
import org.l2jmobius.gameserver.model.actor.Player;
import org.l2jmobius.gameserver.model.item.ItemTemplate;
import org.l2jmobius.gameserver.model.skill.Skill;
import org.l2jmobius.gameserver.network.serverpackets.ActionFailed;
import org.l2jmobius.gameserver.network.serverpackets.ExShowScreenMessage;
import org.l2jmobius.gameserver.network.serverpackets.NpcHtmlMessage;
import org.l2jmobius.gameserver.util.BuilderUtil;

import ai.AbstractNpcAI;

// VIP 金幣建議ＧＭ出售比例１：１００　

public class ChongS extends AbstractNpcAI
{
	private final static int npcIds = 900205;
	private final static int itemsid = 57;
	private final static int count = 10000000;
	private final static int[] jineng =
	{
		268,
		2025,
		1065,
		3345
	};// 技能id

	private ChongS()
	{
		addStartNpc(npcIds);
		addTalkId(npcIds);
		addFirstTalkId(npcIds);
	}

	@Override
	public String onEvent(String event, Npc npc, Player player)
	{
		String htmltext = "";
		if (event.startsWith("start"))
		{
			return "indexa.htm";
		}
		if (event.startsWith("ChongS"))
		{
			LH(player);
		}
		if (event.startsWith("duihuan"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(8), " ");
			int page = Integer.parseInt(st.nextToken());
			liebiao(player, page);
		}
		if (event.startsWith("jinengxuexi"))
		{
			StringTokenizer st = new StringTokenizer(event.substring(12), " ");
			int i = Integer.parseInt(st.nextToken());
			xuexijn(player, i);
		}
		return htmltext;
	}

	private void xuexijn(Player player, int i)
	{
		int zdlv = player.getVariables().getInt("轉生次數", 0);
		int jndj = 0;
		for (int j = 0; j < jineng.length; j++)
		{
			if (player.getKnownSkill(jineng[j]) != null)
			{
				jndj += player.getKnownSkill(jineng[j]).getLevel();
			}
		}
		if (zdlv <= jndj)
		{
			int maxskill = SkillData.getInstance().getMaxLevel(jineng[i]);
			if (player.getKnownSkill(jineng[i]) == null)
			{
				player.addSkill(SkillData.getInstance().getSkill(jineng[i], 1), true);
				player.sendSkillList();
			}
			else
			{
				int nexlevel = player.getSkillLevel(jineng[i]);
				if (nexlevel >= maxskill)
				{
					BuilderUtil.sendSysMessage(player, "該技能已經提升到最大值!");
				}
				else
				{
					player.addSkill(SkillData.getInstance().getSkill(jineng[i], nexlevel + 1), true);
					player.sendSkillList();
				}
			}
		}
		else
		{
			BuilderUtil.sendSysMessage(player, "需要提高轉生次數才能繼續學習!");
		}
	}

	private void LH(Player player)
	{
		int lvl = player.getVariables().getInt("轉生次數", 0);
		if (player.getLevel() >= 85)
		{

			if (player.getInventory().getInventoryItemCount(itemsid, 0) >= count)
			{
				player.destroyItemByItemId(getClass().getSimpleName(), itemsid, count, null, true);
				player.getVariables().set("轉生次數", lvl + 1);// 增加轉生次數
				player.broadcastUserInfo();
				player.sendSkillList();
				player.sendPacket(new ExShowScreenMessage("重生成功！.", 3000));
			}
			else
			{
				player.sendPacket(new ExShowScreenMessage("道具不足.", 3000));
			}
		}
		else
		{
			player.sendPacket(new ExShowScreenMessage("等級不足85.", 3000));
		}
	}

	public void liebiao(Player player, int page)
	{
		int maxListPerPage = 10;
		int maxPages = jineng.length / 10;
		if (jineng.length > (10 * maxPages))
		{
			maxPages++;
		}
		if (page > maxPages)
		{
			page = maxPages;
		}
		int ListStart = 10 * page;
		int ListEnd = jineng.length;
		if ((ListEnd - ListStart) > 10)
		{
			ListEnd = ListStart + 10;
		}
		player.sendPacket(ActionFailed.STATIC_PACKET);
		NpcHtmlMessage adminReply = new NpcHtmlMessage();
		String htmltext = "<html><head><title>轉生系統</title></head><center><img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5><table width=276 border=0 bgcolor=333333><tr><td width=276><center><font color=b09979>選擇技能</font></center></td></tr></table><img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
		if (jineng.length != 0)
		{
			htmltext = htmltext + "<center><table width=276><tr>";
			for (int x = 0; x < maxPages; x++)
			{
				int pagenr = x + 1;
				htmltext = htmltext + "<td><a action=\"bypass -h Quest ChongS duihuan " + x + "\">第" + pagenr + "頁</a></td>";
			}
			htmltext = htmltext + "</tr></table><br>";
		}
		for (int i = ListStart; i < ListEnd; i++)
		{
			int skillid = jineng[i];
			Skill s1 = SkillData.getInstance().getSkill(skillid, 1);
			htmltext = htmltext + "<img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
			htmltext = htmltext + "<table width=276>";
			htmltext = htmltext + "<tr><td width=40 align=center><img src=" + s1.getIcon() + " width=32 height=32></td><td width=150><table>";
			htmltext = htmltext + "<tr><td width=230 height=20><font color=LEVEL>「 " + s1.getName() + " 」</font></td></tr>";
			htmltext = htmltext + "<tr><td width=230 height=20><font color=LEVEL>「需要轉生點: 1 點」</font></td></tr>";
			htmltext = htmltext + "<tr><td width=230 height=20>【<a action=\"bypass -h Quest ChongS jinengxuexi " + i + "\">學習</a>】</td></tr></table></td></tr></table>";
		}
		if (jineng.length == 0)
		{
			htmltext = htmltext + "<table width=276><tr><td width=40 align=center>沒有技能</td></tr></table>";
		}
		else
		{
			htmltext = htmltext + "<img src=L2UI.SquareBlank width=276 height=5><img src=L2UI.SquareGray width=276 height=1><img src=L2UI.SquareBlank width=276 height=5>";
		}
		htmltext = htmltext + "</body></html>";

		adminReply.setHtml(htmltext);
		player.sendPacket(adminReply);
	}

	@Override
	public String onFirstTalk(Npc npc, Player player)
	{
		String htmltext = "";
		NpcHtmlMessage rateReply = new NpcHtmlMessage(0, 1);
		int i = player.getVariables().getInt("轉生次數", 0);
		ItemTemplate itema = ItemData.getInstance().getTemplate(57);
		long countas = i + 1;
		rateReply.setFile(player, "data/scripts/custom/ChongS/start.htm");
		rateReply.replace("%zhuan%", i);
		rateReply.replace("%itemname%", itema.getName());
		rateReply.replace("%count%", countas);
		player.sendPacket(rateReply);
		return htmltext;
	}

	public static void main(String[] args)
	{
		new ChongS();
		System.out.println("----------------------重生突破【轉生系統】載入完畢！----------------------");
	}
}