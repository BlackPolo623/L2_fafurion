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
import java.awt.Desktop;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Window.Type;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Calendar;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.WindowConstants;

import org.l2jmobius.Config;

/**
 * @author 黑普羅、斑斑
 */
	public class frmAbout
{
	private JFrame frmAbout;
	private static final String URL = "www.l2jmobius.org";
	private static final String CONTACT = "Line：fuhao1997";
	final URI uri;

	// 定義顏色
	private static final Color BACKGROUND_COLOR = new Color(30, 30, 30);
	private static final Color TEXT_COLOR = new Color(220, 220, 220);
	private static final Color LINK_COLOR = new Color(0, 150, 200);
	private static final Color HIGHLIGHT_COLOR = new Color(0, 150, 200);

	// 漸變顏色
	private static final Color GRADIENT_START = new Color(40, 40, 40);
	private static final Color GRADIENT_END = new Color(25, 25, 25);

	public frmAbout()
	{
		initialize();
		uri = createURI(URL);
		frmAbout.setVisible(true);
	}

	private void initialize()
	{
		frmAbout = new JFrame();
		frmAbout.setResizable(false);
		frmAbout.setTitle("關於");
		frmAbout.setBounds(100, 100, 350, 280);
		frmAbout.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
		frmAbout.setType(Type.UTILITY);

		// 創建自定義面板用於繪製漸變背景
		JPanel contentPanel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				super.paintComponent(g);
				Graphics2D g2d = (Graphics2D) g.create();
				g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

				// 創建漸變背景
				GradientPaint gp = new GradientPaint(0, 0, GRADIENT_START, 0, getHeight(), GRADIENT_END);
				g2d.setPaint(gp);
				g2d.fillRect(0, 0, getWidth(), getHeight());

				// 添加頂部高亮邊框
				g2d.setColor(HIGHLIGHT_COLOR);
				g2d.drawLine(20, 60, getWidth() - 20, 60);

				g2d.dispose();
			}
		};

		contentPanel.setLayout(null);
		contentPanel.setBackground(BACKGROUND_COLOR);
		contentPanel.setBorder(BorderFactory.createLineBorder(HIGHLIGHT_COLOR, 1));
		frmAbout.setContentPane(contentPanel);

		final JLabel lblLjmobius = new JLabel("L2jMobius");
		lblLjmobius.setForeground(TEXT_COLOR);
		lblLjmobius.setFont(new Font("微軟雅黑", Font.BOLD, 32));
		lblLjmobius.setHorizontalAlignment(SwingConstants.CENTER);
		lblLjmobius.setBounds(10, 11, 330, 39);
		contentPanel.add(lblLjmobius);

		final JLabel lblData = new JLabel("2013-" + Calendar.getInstance().get(Calendar.YEAR));
		lblData.setForeground(TEXT_COLOR);
		lblData.setHorizontalAlignment(SwingConstants.CENTER);
		lblData.setFont(new Font("微軟雅黑", Font.PLAIN, 12));
		lblData.setBounds(10, 44, 330, 14);
		contentPanel.add(lblData);

		final JLabel lblSupports = new JLabel("服務器協議");
		lblSupports.setForeground(TEXT_COLOR);
		lblSupports.setHorizontalAlignment(SwingConstants.CENTER);
		lblSupports.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		lblSupports.setBounds(10, 78, 330, 23);
		contentPanel.add(lblSupports);

		final JLabel lblProtocols = new JLabel("協議編號");
		lblProtocols.setForeground(TEXT_COLOR);
		lblProtocols.setHorizontalAlignment(SwingConstants.CENTER);
		lblProtocols.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		lblProtocols.setBounds(10, 100, 330, 23);
		contentPanel.add(lblProtocols);

		// 添加作者標籤
		final JLabel lblAuthor = new JLabel("作者：黑普羅、斑斑");
		lblAuthor.setForeground(TEXT_COLOR);
		lblAuthor.setHorizontalAlignment(SwingConstants.CENTER);
		lblAuthor.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		lblAuthor.setBounds(10, 133, 330, 23);
		contentPanel.add(lblAuthor);

		// 添加聯繫方式標籤
		final JLabel lblContact = new JLabel("購買開發請聯繫 " + CONTACT);
		lblContact.setForeground(TEXT_COLOR);
		lblContact.setHorizontalAlignment(SwingConstants.CENTER);
		lblContact.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		lblContact.setBounds(10, 156, 330, 23);
		contentPanel.add(lblContact);

		final JLabel site = new JLabel(URL);
		site.setText("<html><font color=\"#0096C8\"><u>" + URL + "</u></font></html>");
		site.setHorizontalAlignment(SwingConstants.CENTER);
		site.setFont(new Font("微軟雅黑", Font.PLAIN, 14));
		site.setBounds(10, 190, 330, 25);
		site.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				if (Desktop.isDesktopSupported())
				{
					try
					{
						Desktop.getDesktop().browse(uri);
					}
					catch (IOException e)
					{
						// 處理異常
					}
				}
			}

			@Override
			public void mouseEntered(MouseEvent e) {
				site.setText("<html><font color=\"#00C8FF\"><u>" + URL + "</u></font></html>");
				site.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
			}

			@Override
			public void mouseExited(MouseEvent e) {
				site.setText("<html><font color=\"#0096C8\"><u>" + URL + "</u></font></html>");
				site.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
			}
		});
		contentPanel.add(site);

		// 添加版權信息
		final JLabel lblCopyright = new JLabel("© " + Calendar.getInstance().get(Calendar.YEAR) + " 版權所有");
		lblCopyright.setForeground(new Color(180, 180, 180));
		lblCopyright.setHorizontalAlignment(SwingConstants.CENTER);
		lblCopyright.setFont(new Font("微軟雅黑", Font.PLAIN, 12));
		lblCopyright.setBounds(10, 220, 330, 14);
		contentPanel.add(lblCopyright);

		// 生成協議文本
		String protocols = "";
		if (Config.PROTOCOL_LIST.size() > 1)
		{
			for (Integer number : Config.PROTOCOL_LIST)
			{
				if (!protocols.isEmpty())
				{
					protocols += " - ";
				}
				protocols += number;
			}
			lblSupports.setText("服務器協議列表");
		}
		else
		{
			protocols += Config.PROTOCOL_LIST.get(0);
		}
		lblProtocols.setText(protocols);

		// 居中显示窗口
		frmAbout.setLocationRelativeTo(null);
	}

	private static URI createURI(String str)
	{
		try
		{
			return new URI("http://" + str);
		}
		catch (URISyntaxException x)
		{
			throw new IllegalArgumentException(x.getMessage(), x);
		}
	}
}