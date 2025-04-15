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
package org.l2jmobius.loginserver.ui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
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
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.WindowConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.plaf.ColorUIResource;

import org.l2jmobius.Config;
import org.l2jmobius.commons.ui.LimitLinesDocumentListener;
import org.l2jmobius.commons.ui.SplashScreen;
import org.l2jmobius.loginserver.GameServerTable;
import org.l2jmobius.loginserver.GameServerTable.GameServerInfo;
import org.l2jmobius.loginserver.LoginController;
import org.l2jmobius.loginserver.LoginServer;
import org.l2jmobius.loginserver.network.gameserverpackets.ServerStatus;

/**
 * @author Mobius
 */
public class Gui
{
	JTextArea txtrConsole;

	JCheckBoxMenuItem chckbxmntmEnabled;
	JCheckBoxMenuItem chckbxmntmDisabled;
	JCheckBoxMenuItem chckbxmntmGmOnly;

	// 定義顏色方案
	private static final Color BACKGROUND_COLOR = new Color(18, 18, 18);
	private static final Color TEXT_COLOR = new Color(220, 220, 220);
	private static final Color MENU_BACKGROUND = new Color(30, 30, 30);
	private static final Color MENU_FOREGROUND = new Color(220, 220, 220);
	private static final Color HIGHLIGHT_COLOR = new Color(0, 150, 200); // 青藍色
	private static final Color CONSOLE_BACKGROUND = new Color(25, 25, 25);

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

		final JMenu mnActions = new JMenu("操作");
		mnActions.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mnActions.setForeground(MENU_FOREGROUND);
		menuBar.add(mnActions);

		final JMenuItem mntmShutdown = new JMenuItem("關閉服務器");
		mntmShutdown.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mntmShutdown.setForeground(MENU_FOREGROUND);
		mntmShutdown.setBackground(MENU_BACKGROUND);
		mntmShutdown.addActionListener(arg0 ->
		{
			if (showThemedOptionDialog(null, "確定要關閉登錄服務器嗎？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, shutdownOptions, shutdownOptions[1]) == 0)
			{
				LoginServer.getInstance().shutdown(false);
			}
		});
		mnActions.add(mntmShutdown);

		final JMenuItem mntmRestart = new JMenuItem("重啟服務器");
		mntmRestart.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mntmRestart.setForeground(MENU_FOREGROUND);
		mntmRestart.setBackground(MENU_BACKGROUND);
		mntmRestart.addActionListener(arg0 ->
		{
			if (showThemedOptionDialog(null, "確定要重啟登錄服務器嗎？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, restartOptions, restartOptions[1]) == 0)
			{
				LoginServer.getInstance().shutdown(true);
			}
		});
		mnActions.add(mntmRestart);

		final JMenu mnReload = new JMenu("重新加載");
		mnReload.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mnReload.setForeground(MENU_FOREGROUND);
		menuBar.add(mnReload);

		final JMenuItem mntmBannedIps = new JMenuItem("封禁IP列表");
		mntmBannedIps.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mntmBannedIps.setForeground(MENU_FOREGROUND);
		mntmBannedIps.setBackground(MENU_BACKGROUND);
		mntmBannedIps.addActionListener(arg0 ->
		{
			if (showThemedOptionDialog(null, "重新加載封禁IP列表？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, confirmOptions, confirmOptions[1]) == 0)
			{
				LoginController.getInstance().getBannedIps().clear();
				LoginServer.getInstance().loadBanFile();
			}
		});
		mnReload.add(mntmBannedIps);

		final JMenu mnStatus = new JMenu("服務器狀態");
		mnStatus.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		mnStatus.setForeground(MENU_FOREGROUND);
		menuBar.add(mnStatus);

		chckbxmntmEnabled = new JCheckBoxMenuItem("開啟");
		chckbxmntmEnabled.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		chckbxmntmEnabled.setForeground(MENU_FOREGROUND);
		chckbxmntmEnabled.setBackground(MENU_BACKGROUND);
		chckbxmntmEnabled.addActionListener(arg0 ->
		{
			chckbxmntmEnabled.setSelected(true);
			chckbxmntmDisabled.setSelected(false);
			chckbxmntmGmOnly.setSelected(false);
			LoginServer.getInstance().setStatus(ServerStatus.STATUS_NORMAL);
			for (GameServerInfo gsi : GameServerTable.getInstance().getRegisteredGameServers().values())
			{
				gsi.setStatus(ServerStatus.STATUS_NORMAL);
			}
			LoginServer.LOGGER.info("服務器狀態已更改為開啟。");
		});
		chckbxmntmEnabled.setSelected(true);
		mnStatus.add(chckbxmntmEnabled);

		chckbxmntmDisabled = new JCheckBoxMenuItem("關閉");
		chckbxmntmDisabled.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		chckbxmntmDisabled.setForeground(MENU_FOREGROUND);
		chckbxmntmDisabled.setBackground(MENU_BACKGROUND);
		chckbxmntmDisabled.addActionListener(arg0 ->
		{
			chckbxmntmEnabled.setSelected(false);
			chckbxmntmDisabled.setSelected(true);
			chckbxmntmGmOnly.setSelected(false);
			LoginServer.getInstance().setStatus(ServerStatus.STATUS_DOWN);
			for (GameServerInfo gsi : GameServerTable.getInstance().getRegisteredGameServers().values())
			{
				gsi.setStatus(ServerStatus.STATUS_DOWN);
			}
			LoginServer.LOGGER.info("服務器狀態已更改為關閉。");
		});
		mnStatus.add(chckbxmntmDisabled);

		chckbxmntmGmOnly = new JCheckBoxMenuItem("僅管理員");
		chckbxmntmGmOnly.setFont(new Font("微軟雅黑", Font.PLAIN, 13));
		chckbxmntmGmOnly.setForeground(MENU_FOREGROUND);
		chckbxmntmGmOnly.setBackground(MENU_BACKGROUND);
		chckbxmntmGmOnly.addActionListener(arg0 ->
		{
			chckbxmntmEnabled.setSelected(false);
			chckbxmntmDisabled.setSelected(false);
			chckbxmntmGmOnly.setSelected(true);
			LoginServer.getInstance().setStatus(ServerStatus.STATUS_GM_ONLY);
			for (GameServerInfo gsi : GameServerTable.getInstance().getRegisteredGameServers().values())
			{
				gsi.setStatus(ServerStatus.STATUS_GM_ONLY);
			}
			LoginServer.LOGGER.info("服務器狀態已更改為僅管理員。");
		});
		mnStatus.add(chckbxmntmGmOnly);

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

		// 創建帶樣式的滾動面板
		final JScrollPane scrollPane = new JScrollPane(txtrConsole);
		scrollPane.setBounds(0, 0, 1050, 800);
		scrollPane.getVerticalScrollBar().setUI(new ModernScrollBarUI());
		scrollPane.getHorizontalScrollBar().setUI(new ModernScrollBarUI());
		scrollPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		scrollPane.setBackground(BACKGROUND_COLOR);

		// 設置窗體
		final JFrame frame = new JFrame("莫比烏斯 - 登錄服務器");
		frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new WindowAdapter()
		{
			@Override
			public void windowClosing(WindowEvent ev)
			{
				if (showThemedOptionDialog(null, "立即關閉登錄服務器？", "選擇一個選項", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, null, shutdownOptions, shutdownOptions[1]) == 0)
				{
					LoginServer.getInstance().shutdown(false);
				}
			}
		});
		frame.addComponentListener(new ComponentAdapter()
		{
			@Override
			public void componentResized(ComponentEvent ev)
			{
				scrollPane.setSize(frame.getContentPane().getSize());
			}
		});
		frame.setJMenuBar(menuBar);
		frame.setIconImages(icons);
		frame.add(scrollPane, BorderLayout.CENTER);
		frame.getContentPane().setBackground(BACKGROUND_COLOR);
		frame.getContentPane().setPreferredSize(new Dimension(1050, 800));
		frame.pack();
		frame.setLocationRelativeTo(null);

		// 重定向輸出到文本區域
		redirectSystemStreams();

		// 显示啟動畫面
		new SplashScreen(".." + File.separator + "images" + File.separator + "splash.png", 800, frame);
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

			// 複選框菜單項樣式
			UIManager.put("CheckBoxMenuItem.background", new ColorUIResource(MENU_BACKGROUND));
			UIManager.put("CheckBoxMenuItem.foreground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("CheckBoxMenuItem.selectionBackground", new ColorUIResource(HIGHLIGHT_COLOR));
			UIManager.put("CheckBoxMenuItem.selectionForeground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("CheckBoxMenuItem.acceleratorForeground", new ColorUIResource(TEXT_COLOR));
			UIManager.put("CheckBoxMenuItem.borderPainted", false);

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

	/**
	 * 創建符合主題的對話框
	 * 這個方法可以替換原有的JOptionPane調用
	 * @param parentComponent
	 * @param message
	 * @param title
	 * @param optionType
	 * @param messageType
	 * @param icon
	 * @param options
	 * @param initialValue
	 * @return
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