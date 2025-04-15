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

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.DropMode;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.WindowConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.plaf.ColorUIResource;

import org.l2jmobius.Config;
import org.l2jmobius.commons.ui.LimitLinesDocumentListener;
import org.l2jmobius.commons.ui.SplashScreen;
import org.l2jmobius.gameserver.Shutdown;
import org.l2jmobius.gameserver.cache.HtmCache;
import org.l2jmobius.gameserver.data.xml.AdminData;
import org.l2jmobius.gameserver.data.xml.BuyListData;
import org.l2jmobius.gameserver.data.xml.MultisellData;
import org.l2jmobius.gameserver.data.xml.PrimeShopData;
import org.l2jmobius.gameserver.util.Broadcast;
import org.l2jmobius.gameserver.util.Util;

/**
 * @author Mobius
 */
public class Gui
{
	JTextArea txtrConsole;

	// 定義顏色方案
	private static final Color BACKGROUND_COLOR = new Color(18, 18, 18);
	private static final Color TEXT_COLOR = new Color(220, 220, 220);
	private static final Color MENU_BACKGROUND = new Color(30, 30, 30);
	private static final Color MENU_FOREGROUND = new Color(220, 220, 220);
	private static final Color HIGHLIGHT_COLOR = new Color(0, 150, 200); // 青藍色
	private static final Color BUTTON_BACKGROUND = new Color(40, 40, 40);
	private static final Color BUTTON_HOVER = new Color(60, 60, 60);
	private static final Color BUTTON_PRESS = new Color(20, 20, 20);
	private static final Color CONSOLE_BACKGROUND = new Color(25, 25, 25);
	private static final Color PANEL_BACKGROUND = new Color(30, 30, 30, 220);

	static final String[] shutdownOptions =
			{
					"關閉",
					"取消"
			};
	static final String[] restartOptions =
			{
					"重啟",
					"取消"
			};
	static final String[] abortOptions =
			{
					"中止",
					"取消"
			};
	static final String[] confirmOptions =
			{
					"確認",
					"取消"
			};

	public Gui()
	{
		// 設置現代黑色主題
		setupModernDarkTheme();

		// 設置JOptionPane使用的背景色和前景色
		UIManager.put("OptionPane.background", BACKGROUND_COLOR);
		UIManager.put("Panel.background", BACKGROUND_COLOR);
		UIManager.put("OptionPane.messageForeground", TEXT_COLOR);

		// 設置輸入框的顏色
		UIManager.put("TextField.background", new Color(40, 40, 40));
		UIManager.put("TextField.foreground", TEXT_COLOR);
		UIManager.put("TextArea.background", CONSOLE_BACKGROUND);
		UIManager.put("TextArea.foreground", TEXT_COLOR);

		// 初始化控制台
		txtrConsole = new JTextArea();
		txtrConsole.setEditable(false);
		txtrConsole.setLineWrap(true);
		txtrConsole.setWrapStyleWord(true);
		txtrConsole.setDropMode(DropMode.INSERT);
		txtrConsole.setFont(new Font("Monospaced", Font.PLAIN, 16));
		txtrConsole.getDocument().addDocumentListener(new LimitLinesDocumentListener(500));
		txtrConsole.setBackground(CONSOLE_BACKGROUND);
		txtrConsole.setForeground(TEXT_COLOR);
		txtrConsole.setCaretColor(TEXT_COLOR);

		// 初始化菜單項
		final JMenuBar menuBar = new JMenuBar();
		menuBar.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		menuBar.setBackground(MENU_BACKGROUND);
		menuBar.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, HIGHLIGHT_COLOR));

		final JMenu mnFont = new JMenu("字體");
		mnFont.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mnFont.setForeground(MENU_FOREGROUND);
		menuBar.add(mnFont);

		final String[] fonts =
				{
						"16",
						"21",
						"27",
						"33"
				};
		for (String font : fonts)
		{
			final JMenuItem mntmFont = new JMenuItem(font);
			mntmFont.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
			mntmFont.setForeground(MENU_FOREGROUND);
			mntmFont.setBackground(MENU_BACKGROUND);
			mntmFont.addActionListener(arg0 -> txtrConsole.setFont(new Font("Monospaced", Font.PLAIN, Integer.parseInt(font))));
			mnFont.add(mntmFont);
		}

		final JMenu mnHelp = new JMenu("幫助");
		mnHelp.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mnHelp.setForeground(MENU_FOREGROUND);
		menuBar.add(mnHelp);

		final JMenuItem mntmAbout = new JMenuItem("關於");
		mntmAbout.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mntmAbout.setForeground(MENU_FOREGROUND);
		mntmAbout.setBackground(MENU_BACKGROUND);
		mntmAbout.addActionListener(arg0 -> new frmAbout());
		mnHelp.add(mntmAbout);

		// 設置圖標
		final List<Image> icons = new ArrayList<>();
		icons.add(new ImageIcon(".." + File.separator + "images" + File.separator + "l2jmobius_16x16.png").getImage());
		icons.add(new ImageIcon(".." + File.separator + "images" + File.separator + "l2jmobius_32x32.png").getImage());
		icons.add(new ImageIcon(".." + File.separator + "images" + File.separator + "l2jmobius_64x64.png").getImage());
		icons.add(new ImageIcon(".." + File.separator + "images" + File.separator + "l2jmobius_128x128.png").getImage());

		// 設置面板
		final JPanel systemPanel = new SystemPanel();
		// 為SystemPanel設置背景和前景色
		systemPanel.setBackground(new Color(30, 30, 30, 200));
		systemPanel.setForeground(TEXT_COLOR);

		// 創建控制按鈕面板
		final JPanel controlPanel = createControlPanel();

		// 創建帶樣式的滾動面板
		final JScrollPane scrollPane = new JScrollPane(txtrConsole);
		scrollPane.setBounds(0, 0, 1050, 800);
		scrollPane.getVerticalScrollBar().setUI(new ModernScrollBarUI());
		scrollPane.getHorizontalScrollBar().setUI(new ModernScrollBarUI());
		scrollPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		scrollPane.setBackground(BACKGROUND_COLOR);

		final JLayeredPane layeredPane = new JLayeredPane();
		layeredPane.add(scrollPane, 0, 0);
		layeredPane.add(systemPanel, 1, 0);
		layeredPane.add(controlPanel, 1, 1);
		layeredPane.setBackground(BACKGROUND_COLOR);

		// 設置窗體
		final JFrame frame = new JFrame("莫比烏斯 - 遊戲服務器");
		frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new WindowAdapter()
		{
			@Override
			public void windowClosing(WindowEvent ev)
			{
				if (showThemedOptionDialog(null, "立即關閉服務器？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.ERROR_MESSAGE, null, shutdownOptions, shutdownOptions[1]) == 0)
				{
					Shutdown.getInstance().startShutdown(null, 1, false);
				}
			}
		});
		frame.addComponentListener(new ComponentAdapter()
		{
			@Override
			public void componentResized(ComponentEvent ev)
			{
				scrollPane.setSize(frame.getContentPane().getSize());
				systemPanel.setLocation(frame.getContentPane().getWidth() - systemPanel.getWidth() - 34, systemPanel.getY());

				// 控制面板定位在右下角
				controlPanel.setLocation(frame.getContentPane().getWidth() - controlPanel.getWidth() - 34,
						frame.getContentPane().getHeight() - controlPanel.getHeight() - 34);
			}
		});
		frame.setJMenuBar(menuBar);
		frame.setIconImages(icons);
		frame.add(layeredPane, BorderLayout.CENTER);
		frame.getContentPane().setBackground(BACKGROUND_COLOR);
		frame.getContentPane().setPreferredSize(new Dimension(1050, 800));
		frame.pack();
		frame.setLocationRelativeTo(null);

		// 重定向輸出到文本區域
		redirectSystemStreams();

		// 显示啟動畫面
		new SplashScreen(".." + File.separator + "images" + File.separator + "splash.png", 800, frame);
	}

	/**
	 * 創建控制面板，包含所有操作按鈕
	 * @return 包含按鈕的面板
	 */
	private JPanel createControlPanel() {
		// 創建主面板
		JPanel panel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				Graphics2D g2d = (Graphics2D) g.create();
				g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

				// 繪製漸變背景
				GradientPaint gp = new GradientPaint(0, 0, new Color(30, 30, 30, 220),
						0, getHeight(), new Color(25, 25, 25, 240));
				g2d.setPaint(gp);
				g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 15, 15);

				// 繪製邊框
				g2d.setColor(HIGHLIGHT_COLOR.darker());
				g2d.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 15, 15);
				g2d.dispose();
			}
		};
		panel.setLayout(new BorderLayout(5, 5));
		panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
		panel.setOpaque(false);

		// 標題標籤
		JLabel titleLabel = new JLabel("伺服器控制面板", SwingConstants.CENTER);
		titleLabel.setFont(new Font("微軟雅黑", Font.BOLD, 14));
		titleLabel.setForeground(HIGHLIGHT_COLOR);
		titleLabel.setBorder(BorderFactory.createEmptyBorder(0, 0, 10, 0));
		panel.add(titleLabel, BorderLayout.NORTH);

		// 創建按鈕面板 - 使用網格佈局
		JPanel buttonPanel = new JPanel(new GridLayout(0, 2, 8, 8)); // 2列，自動行數
		buttonPanel.setOpaque(false);

		// 伺服器操作區塊
		JPanel serverActionPanel = new JPanel(new GridLayout(0, 1, 5, 5));
		serverActionPanel.setOpaque(false);
		serverActionPanel.setBorder(BorderFactory.createTitledBorder(
				BorderFactory.createLineBorder(HIGHLIGHT_COLOR.darker(), 1),
				"伺服器操作",
				SwingConstants.CENTER,
				SwingConstants.TOP,
				new Font("微軟雅黑", Font.BOLD, 14),
				HIGHLIGHT_COLOR));

		// 重新加載區塊
		JPanel reloadPanel = new JPanel(new GridLayout(0, 1, 5, 5));
		reloadPanel.setOpaque(false);
		reloadPanel.setBorder(BorderFactory.createTitledBorder(
				BorderFactory.createLineBorder(HIGHLIGHT_COLOR.darker(), 1),
				"重新加載",
				SwingConstants.CENTER,
				SwingConstants.TOP,
				new Font("微軟雅黑", Font.BOLD, 14),
				HIGHLIGHT_COLOR));

		// 公告區塊
		JPanel announcePanel = new JPanel(new GridLayout(0, 1, 5, 5));
		announcePanel.setOpaque(false);
		announcePanel.setBorder(BorderFactory.createTitledBorder(
				BorderFactory.createLineBorder(HIGHLIGHT_COLOR.darker(), 1),
				"公告",
				SwingConstants.CENTER,
				SwingConstants.TOP,
				new Font("微軟雅黑", Font.BOLD, 14),
				HIGHLIGHT_COLOR));

		// 伺服器操作按鈕
		serverActionPanel.add(createStyledButton("關閉服務器", e -> {
			if (showThemedOptionDialog(null, "確定要關閉遊戲服務器嗎？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, shutdownOptions, shutdownOptions[1]) == 0)
			{
				promptForDelay(false);
			}
		}));

		serverActionPanel.add(createStyledButton("重啟服務器", e -> {
			if (showThemedOptionDialog(null, "確定要重啟遊戲服務器嗎？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, restartOptions, restartOptions[1]) == 0)
			{
				promptForDelay(true);
			}
		}));

		serverActionPanel.add(createStyledButton("中止關閉", e -> {
			if (showThemedOptionDialog(null, "中止服務器關閉過程？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, abortOptions, abortOptions[1]) == 0)
			{
				Shutdown.getInstance().abort(null);
			}
		}));

		// 重新加載按鈕
		reloadPanel.add(createStyledButton("重載Config", e -> {
			if (showThemedOptionDialog(null, "重新加載配置文件？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				Config.load(Config.SERVER_MODE);
			}
		}));

		reloadPanel.add(createStyledButton("重載權限", e -> {
			if (showThemedOptionDialog(null, "重新加載管理員訪問級別？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				AdminData.getInstance().load();
			}
		}));

		reloadPanel.add(createStyledButton("重載HTML文件", e -> {
			if (showThemedOptionDialog(null, "重新加載HTML文件？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				HtmCache.getInstance().reload();
			}
		}));

		reloadPanel.add(createStyledButton("重載Multisell", e -> {
			if (showThemedOptionDialog(null, "重新加載多重銷售？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				MultisellData.getInstance().load();
			}
		}));

		reloadPanel.add(createStyledButton("重載Buylist", e -> {
			if (showThemedOptionDialog(null, "重新加載購買列表？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				BuyListData.getInstance().load();
			}
		}));

		reloadPanel.add(createStyledButton("重載PrimeShop", e -> {
			if (showThemedOptionDialog(null, "重新加載高級商店？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				PrimeShopData.getInstance().load();
			}
		}));

		// 公告按鈕
		announcePanel.add(createStyledButton("普通公告", e -> {
			promptForAnnouncement(false);
		}));

		announcePanel.add(createStyledButton("重要公告", e -> {
			promptForAnnouncement(true);
		}));

		// 將分組添加到按鈕面板
		buttonPanel.add(serverActionPanel);
		buttonPanel.add(reloadPanel);

		// 添加公告區塊到整體面板底部
		panel.add(buttonPanel, BorderLayout.CENTER);
		panel.add(announcePanel, BorderLayout.SOUTH);

		// 設置面板大小和位置
		panel.setSize(300, 450);
		panel.setLocation(720, 320);

		return panel;
	}

	/**
	 * 創建帶有樣式的按鈕
	 */
	private JButton createStyledButton(String text, java.awt.event.ActionListener listener) {
		JButton button = new JButton(text) {
			@Override
			protected void paintComponent(Graphics g) {
				Graphics2D g2d = (Graphics2D) g.create();
				g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

				// 按鈕背景
				if (getModel().isPressed()) {
					g2d.setColor(BUTTON_PRESS);
				} else if (getModel().isRollover()) {
					g2d.setColor(BUTTON_HOVER);
				} else {
					g2d.setColor(BUTTON_BACKGROUND);
				}
				g2d.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);

				// 按鈕邊框
				if (getModel().isRollover()) {
					g2d.setColor(HIGHLIGHT_COLOR);
				} else {
					g2d.setColor(HIGHLIGHT_COLOR.darker());
				}
				g2d.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 8, 8);

				// 繪製文字
				g2d.setFont(getFont());
				g2d.setColor(TEXT_COLOR);

				// 居中文字
				java.awt.FontMetrics fm = g2d.getFontMetrics();
				int x = (getWidth() - fm.stringWidth(getText())) / 2;
				int y = (getHeight() - fm.getHeight()) / 2 + fm.getAscent();
				g2d.drawString(getText(), x, y);

				g2d.dispose();
			}
		};

		button.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		button.setForeground(TEXT_COLOR);
		button.setBackground(BUTTON_BACKGROUND);
		button.setFocusPainted(false);
		button.setBorderPainted(false);
		button.setContentAreaFilled(false);
		button.setOpaque(false);
		button.setPreferredSize(new Dimension(120, 30));

		// 鼠標事件監聽
		button.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				button.repaint();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				button.repaint();
			}
		});

		button.addActionListener(listener);
		return button;
	}

	/**
	 * 提示用戶輸入延遲時間
	 */
	private void promptForDelay(boolean isRestart) {
		// 保存原始UI設置
		Object oldBackground = UIManager.get("OptionPane.background");
		Object oldPanelBackground = UIManager.get("Panel.background");

		try {
			// 應用深色主題設置
			UIManager.put("OptionPane.background", BACKGROUND_COLOR);
			UIManager.put("Panel.background", BACKGROUND_COLOR);
			UIManager.put("TextField.background", new Color(40, 40, 40));
			UIManager.put("TextField.foreground", TEXT_COLOR);

			final Object answer = JOptionPane.showInputDialog(null,
					isRestart ? "重啟延遲（秒）" : "關閉延遲（秒）",
					"輸入", JOptionPane.INFORMATION_MESSAGE, null, null, "600");
			if (answer != null)
			{
				final String input = ((String) answer).trim();
				if (Util.isDigit(input))
				{
					final int delay = Integer.parseInt(input);
					if (delay > 0)
					{
						Shutdown.getInstance().startShutdown(null, delay, isRestart);
					}
				}
			}
		} finally {
			// 恢復原始UI設置
			UIManager.put("OptionPane.background", oldBackground);
			UIManager.put("Panel.background", oldPanelBackground);
		}
	}

	/**
	 * 提示用戶輸入公告內容
	 */
	private void promptForAnnouncement(boolean isCritical) {
		// 保存原始UI設置
		Object oldBackground = UIManager.get("OptionPane.background");
		Object oldPanelBackground = UIManager.get("Panel.background");

		try {
			// 應用深色主題設置
			UIManager.put("OptionPane.background", BACKGROUND_COLOR);
			UIManager.put("Panel.background", BACKGROUND_COLOR);
			UIManager.put("TextField.background", new Color(40, 40, 40));
			UIManager.put("TextField.foreground", TEXT_COLOR);

			final Object input = JOptionPane.showInputDialog(null,
					isCritical ? "重要公告消息" : "公告消息",
					"輸入", JOptionPane.INFORMATION_MESSAGE, null, null, "");
			if (input != null)
			{
				final String message = ((String) input).trim();
				if (!message.isEmpty())
				{
					Broadcast.toAllOnlinePlayers(message, isCritical);
				}
			}
		} finally {
			// 恢復原始UI設置
			UIManager.put("OptionPane.background", oldBackground);
			UIManager.put("Panel.background", oldPanelBackground);
		}
	}

	// 設置現代黑色主題
	private void setupModernDarkTheme() {
		try {
			// 設置基本UI組件顏色
			UIManager.put("Panel.background", new ColorUIResource(BACKGROUND_COLOR));
			UIManager.put("Panel.foreground", new ColorUIResource(TEXT_COLOR));

			// 選項對話框樣式
			UIManager.put("OptionPane.background", new ColorUIResource(BACKGROUND_COLOR));
			UIManager.put("OptionPane.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("OptionPane.messageForeground", new ColorUIResource(TEXT_COLOR));

			// 設置按鈕的顏色，包括對話框按鈕
			UIManager.put("Button.background", new ColorUIResource(new Color(50, 50, 50)));
			UIManager.put("Button.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("Button.select", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("Button.focus", new ColorUIResource(new Color(60, 60, 60)));

			// 確保OptionPane中的按鈕也使用深色
			UIManager.put("OptionPane.buttonBackground", new ColorUIResource(new Color(50, 50, 50)));
			UIManager.put("OptionPane.buttonForeground", new ColorUIResource(TEXT_COLOR));

			// 自定義JOptionPane按鈕UI
			UIManager.put("OptionPane.buttonPadding", 5);
			UIManager.put("OptionPane.sameSizeButtons", true);

			// 輸入框樣式
			UIManager.put("TextField.background", new ColorUIResource(new Color(40, 40, 40)));
			UIManager.put("TextField.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("TextField.caretForeground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("TextField.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("TextField.selectionForeground", new ColorUIResource(Color.WHITE));

			// 替換原生的按鈕邊框和焦點樣式
			UIManager.put("Button.border", BorderFactory.createCompoundBorder(
					BorderFactory.createLineBorder(new Color(60, 60, 60), 1),
					BorderFactory.createEmptyBorder(5, 15, 5, 15)));

			// ComboBox樣式
			UIManager.put("ComboBox.background", new ColorUIResource(MENU_BACKGROUND));
			UIManager.put("ComboBox.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("ComboBox.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("ComboBox.selectionForeground", new ColorUIResource(TEXT_COLOR));

			// 菜單樣式
			UIManager.put("Menu.background", new ColorUIResource(MENU_BACKGROUND));
			UIManager.put("Menu.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("Menu.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("Menu.selectionForeground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("Menu.borderPainted", false);

			// 菜單項樣式
			UIManager.put("MenuItem.background", new ColorUIResource(MENU_BACKGROUND));
			UIManager.put("MenuItem.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("MenuItem.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("MenuItem.selectionForeground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("MenuItem.borderPainted", false);

			// 菜單欄樣式
			UIManager.put("MenuBar.background", new ColorUIResource(MENU_BACKGROUND));
			UIManager.put("MenuBar.foreground", new ColorUIResource(TEXT_COLOR));

			// 列表樣式
			UIManager.put("List.background", new ColorUIResource(CONSOLE_BACKGROUND));
			UIManager.put("List.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("List.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("List.selectionForeground", new ColorUIResource(TEXT_COLOR));

			// 滾動條樣式
			UIManager.put("ScrollBar.background", new ColorUIResource(BACKGROUND_COLOR));
			UIManager.put("ScrollBar.track", new ColorUIResource(BACKGROUND_COLOR));
			UIManager.put("ScrollBar.thumb", new ColorUIResource(HIGHLIGHT_COLOR.darker()));
			UIManager.put("ScrollBar.thumbDarkShadow", new ColorUIResource(HIGHLIGHT_COLOR.darker().darker()));
			UIManager.put("ScrollBar.thumbHighlight", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("ScrollBar.thumbShadow", new ColorUIResource(HIGHLIGHT_COLOR.darker()));
			UIManager.put("ScrollPane.background", new ColorUIResource(BACKGROUND_COLOR));
			UIManager.put("ScrollPane.foreground", new ColorUIResource(TEXT_COLOR));

			// 標籤樣式
			UIManager.put("Label.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("Label.background", new ColorUIResource(BACKGROUND_COLOR));

			// 統一字體為微軟雅黑
			final Font defaultFont = new Font("微軟雅黑", Font.PLAIN, 13);
			UIManager.put("Button.font", defaultFont);
			UIManager.put("ToggleButton.font", defaultFont);
			UIManager.put("RadioButton.font", defaultFont);
			UIManager.put("CheckBox.font", defaultFont);
			UIManager.put("ComboBox.font", defaultFont);
			UIManager.put("Label.font", defaultFont);
			UIManager.put("List.font", defaultFont);
			UIManager.put("MenuBar.font", defaultFont);
			UIManager.put("MenuItem.font", defaultFont);
			UIManager.put("RadioButtonMenuItem.font", defaultFont);
			UIManager.put("CheckBoxMenuItem.font", defaultFont);
			UIManager.put("Menu.font", defaultFont);
			UIManager.put("PopupMenu.font", defaultFont);
			UIManager.put("OptionPane.font", defaultFont);
			UIManager.put("Panel.font", defaultFont);
			UIManager.put("ProgressBar.font", defaultFont);
			UIManager.put("ScrollPane.font", defaultFont);
			UIManager.put("Viewport.font", defaultFont);
			UIManager.put("TabbedPane.font", defaultFont);
			UIManager.put("Table.font", defaultFont);
			UIManager.put("TableHeader.font", defaultFont);
			UIManager.put("TextField.font", defaultFont);
			UIManager.put("PasswordField.font", defaultFont);
			UIManager.put("TextArea.font", defaultFont);
			UIManager.put("TextPane.font", defaultFont);
			UIManager.put("EditorPane.font", defaultFont);
			UIManager.put("TitledBorder.font", defaultFont);
			UIManager.put("ToolBar.font", defaultFont);
			UIManager.put("ToolTip.font", defaultFont);
			UIManager.put("Tree.font", defaultFont);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	// 設置輸出重定向的位置。在這種情況下，重定向到txtrConsole。
	void updateTextArea(String text)
	{
		SwingUtilities.invokeLater(() ->
		{
			txtrConsole.append(text);
			txtrConsole.setCaretPosition(txtrConsole.getText().length());
		});
	}

	// 管理重定向的方法
	private void redirectSystemStreams()
	{
		final OutputStream out = new OutputStream()
		{
			@Override
			public void write(int b)
			{
				updateTextArea(String.valueOf((char) b));
			}

			@Override
			public void write(byte[] b, int off, int len)
			{
				updateTextArea(new String(b, off, len));
			}

			@Override
			public void write(byte[] b)
			{
				write(b, 0, b.length);
			}
		};

		System.setOut(new PrintStream(out, true));
		System.setErr(new PrintStream(out, true));
	}

	/**
	 * 創建符合主題的對話框
	 * 這個方法可以替換原有的JOptionPane調用
	 * @param parentComponent 父組件
	 * @param message 显示消息
	 * @param title 標題
	 * @param optionType 選項類型
	 * @param messageType 消息類型
	 * @param icon 圖標
	 * @param options 按鈕選項
	 * @param initialValue 初始值
	 * @return 用戶選擇的選項索引
	 */
	private int showThemedOptionDialog(java.awt.Component parentComponent, Object message, String title, int optionType,
									   int messageType, javax.swing.Icon icon, Object[] options, Object initialValue) {

		// 保存原始UI設置
		Object oldBackground = UIManager.get("OptionPane.background");
		Object oldPanelBackground = UIManager.get("Panel.background");
		Object oldMessageForeground = UIManager.get("OptionPane.messageForeground");
		Object oldButtonBackground = UIManager.get("Button.background");
		Object oldButtonForeground = UIManager.get("Button.foreground");
		Object oldButtonBorder = UIManager.get("Button.border");

		try {
			// 應用深色主題設置
			UIManager.put("OptionPane.background", BACKGROUND_COLOR);
			UIManager.put("Panel.background", BACKGROUND_COLOR);
			UIManager.put("OptionPane.messageForeground", TEXT_COLOR);
			UIManager.put("Button.background", new Color(50, 50, 50));
			UIManager.put("Button.foreground", TEXT_COLOR);
			UIManager.put("Button.border", BorderFactory.createCompoundBorder(
					BorderFactory.createLineBorder(new Color(60, 60, 60), 1),
					BorderFactory.createEmptyBorder(5, 15, 5, 15)));

			// 显示對話框
			return JOptionPane.showOptionDialog(parentComponent, message, title, optionType,
					messageType, icon, options, initialValue);
		} finally {
			// 恢復原始UI設置
			UIManager.put("OptionPane.background", oldBackground);
			UIManager.put("Panel.background", oldPanelBackground);
			UIManager.put("OptionPane.messageForeground", oldMessageForeground);
			UIManager.put("Button.background", oldButtonBackground);
			UIManager.put("Button.foreground", oldButtonForeground);
			UIManager.put("Button.border", oldButtonBorder);
		}
	}
}

/**
 * 現代滾動條UI實現
 */
class ModernScrollBarUI extends javax.swing.plaf.basic.BasicScrollBarUI {
	private Color thumbColor = new Color(0, 150, 200, 150);

	@Override
	protected void configureScrollBarColors() {
		this.thumbColor = new Color(0, 150, 200, 150);
		this.trackColor = new Color(30, 30, 30);
		this.trackHighlightColor = new Color(30, 30, 30);
	}

	@Override
	protected javax.swing.JButton createDecreaseButton(int orientation) {
		return createZeroButton();
	}

	@Override
	protected javax.swing.JButton createIncreaseButton(int orientation) {
		return createZeroButton();
	}

	private javax.swing.JButton createZeroButton() {
		javax.swing.JButton button = new javax.swing.JButton();
		button.setPreferredSize(new Dimension(0, 0));
		button.setMinimumSize(new Dimension(0, 0));
		button.setMaximumSize(new Dimension(0, 0));
		return button;
	}

	@Override
	protected void paintThumb(java.awt.Graphics g, javax.swing.JComponent c, java.awt.Rectangle thumbBounds) {
		if(thumbBounds.isEmpty() || !scrollbar.isEnabled()) {
			return;
		}

		int w = thumbBounds.width;
		int h = thumbBounds.height;

		g.setColor(thumbColor);
		g.fillRect(thumbBounds.x, thumbBounds.y, w, h);

		g.setColor(thumbColor.brighter());
		g.drawRect(thumbBounds.x, thumbBounds.y, w-1, h-1);
	}

	@Override
	protected void paintTrack(java.awt.Graphics g, javax.swing.JComponent c, java.awt.Rectangle trackBounds) {
		g.setColor(trackColor);
		g.fillRect(trackBounds.x, trackBounds.y, trackBounds.width, trackBounds.height);
	}
}