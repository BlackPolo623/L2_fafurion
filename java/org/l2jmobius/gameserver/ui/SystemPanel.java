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
package org.l2jmobius.gameserver.ui;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.io.File;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;
import java.util.jar.Attributes;
import java.util.jar.JarFile;
import java.util.logging.Logger;

import javax.swing.BorderFactory;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

import org.l2jmobius.Config;
import org.l2jmobius.gameserver.GameServer;
import org.l2jmobius.gameserver.model.World;
import org.l2jmobius.gameserver.util.Locator;

/**
 * @author Mobius
 */
public class SystemPanel extends JPanel
{
	protected static final Logger LOGGER = Logger.getLogger(SystemPanel.class.getName());

	protected static final long START_TIME = System.currentTimeMillis();

	// 定義顏色
	private static final Color BACKGROUND_COLOR = new Color(30, 30, 30, 220);
	private static final Color BORDER_COLOR = new Color(0, 150, 200);
	private static final Color TEXT_COLOR = new Color(220, 220, 220);
	private static final Color HIGHLIGHT_COLOR = new Color(0, 150, 200);

	// 漸變顏色
	private static final Color GRADIENT_START = new Color(40, 40, 40, 220);
	private static final Color GRADIENT_END = new Color(25, 25, 25, 220);

	public SystemPanel()
	{
		setBackground(BACKGROUND_COLOR);

		setBounds(500, 20, 284, 200);
		setBorder(BorderFactory.createCompoundBorder(
				BorderFactory.createLineBorder(BORDER_COLOR, 1, false),
				BorderFactory.createEmptyBorder(10, 10, 10, 10)));
		setOpaque(false);
		setLayout(null);

		// 添加標題標籤
		final JLabel lblTitle = new JLabel("系統信息");
		lblTitle.setForeground(HIGHLIGHT_COLOR);
		lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
		lblTitle.setFont(new Font("微軟雅黑", Font.BOLD, 16));
		lblTitle.setBounds(10, 5, 264, 20);
		add(lblTitle);

		// 初始化標籤
		final JLabel lblProtocol = createStyledLabel("協議", 10, 30);
		final JLabel lblConnected = createStyledLabel("在線人數", 10, 50);
		final JLabel lblMaxConnected = createStyledLabel("最高在線", 10, 70);
		final JLabel lblOfflineShops = createStyledLabel("離線商店", 10, 90);
		final JLabel lblElapsedTime = createStyledLabel("運行時間", 10, 110);
		final JLabel lblJavaVersion = createStyledLabel("Java版本", 10, 130);
		final JLabel lblBuildDate = createStyledLabel("構建日期", 10, 150);

		// 設置初始值
		lblProtocol.setText("協議: 0");
		lblConnected.setText("在線人數: 0");
		lblMaxConnected.setText("最高在線: 0");
		lblOfflineShops.setText("離線商店: 0");
		lblElapsedTime.setText("運行時間: 0秒");
		lblJavaVersion.setText("Java版本: " + System.getProperty("java.version"));
		lblBuildDate.setText("構建日期: 不可用");
		try
		{
			final File jarName = Locator.getClassSource(GameServer.class);
			final JarFile jarFile = new JarFile(jarName);
			final Attributes attrs = jarFile.getManifest().getMainAttributes();
			lblBuildDate.setText("構建日期: " + attrs.getValue("Build-Date").split(" ")[0]);
			jarFile.close();
		}
		catch (Exception e)
		{
			// 已在上面處理
		}

		// 初始更新任務
		new Timer().schedule(new TimerTask()
		{
			@Override
			public void run()
			{
				lblProtocol.setText((Config.PROTOCOL_LIST.size() > 1 ? "協議列表: " : "協議: ") + (Config.SERVER_LIST_TYPE >= 400 ? "經典 " : "") + Config.PROTOCOL_LIST.toString());
			}
		}, 4500);

		// 周期性更新時間任務
		new Timer().scheduleAtFixedRate(new TimerTask()
		{
			@Override
			public void run()
			{
				final int playerCount = World.getInstance().getPlayers().size();
				if (World.MAX_CONNECTED_COUNT < playerCount)
				{
					World.MAX_CONNECTED_COUNT = playerCount;
					if (playerCount > 1)
					{
						LOGGER.info("新的最高在線人數記錄: " + playerCount + "!");
					}
				}
				lblConnected.setText("在線人數: " + playerCount);
				lblMaxConnected.setText("最高在線: " + World.MAX_CONNECTED_COUNT);
				lblOfflineShops.setText("離線商店: " + World.OFFLINE_TRADE_COUNT);
				lblElapsedTime.setText("運行時間: " + getDurationBreakdown(System.currentTimeMillis() - START_TIME));
			}
		}, 1000, 1000);
	}

	/**
	 * 創建一個樣式化的標籤
	 * @param text 標籤文本
	 * @param x X坐標
	 * @param y Y坐標
	 * @return 樣式化的JLabel
	 */
	private JLabel createStyledLabel(String text, int x, int y) {
		final JLabel label = new JLabel(text);
		label.setForeground(TEXT_COLOR);
		label.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		label.setBounds(x, y, 264, 17);
		add(label);
		return label;
	}

	/**
	 * 繪製帶漸變背景的面板
	 */
	@Override
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);

		Graphics2D g2d = (Graphics2D) g.create();
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		// 創建漸變背景
		GradientPaint gp = new GradientPaint(0, 0, GRADIENT_START, 0, getHeight(), GRADIENT_END);
		g2d.setPaint(gp);
		g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 10, 10);

		// 添加頂部高亮邊框
		g2d.setColor(HIGHLIGHT_COLOR);
		g2d.drawLine(10, 27, getWidth() - 10, 27);

		g2d.dispose();
	}

	/**
	 * 格式化時間显示
	 * @param millis 毫秒數
	 * @return 格式化的時間字符串
	 */
	static String getDurationBreakdown(long millis)
	{
		long remaining = millis;
		final long days = TimeUnit.MILLISECONDS.toDays(remaining);
		remaining -= TimeUnit.DAYS.toMillis(days);
		final long hours = TimeUnit.MILLISECONDS.toHours(remaining);
		remaining -= TimeUnit.HOURS.toMillis(hours);
		final long minutes = TimeUnit.MILLISECONDS.toMinutes(remaining);
		remaining -= TimeUnit.MINUTES.toMillis(minutes);
		final long seconds = TimeUnit.MILLISECONDS.toSeconds(remaining);
		return (days + "天 " + hours + "時 " + minutes + "分 " + seconds + "秒");
	}
}