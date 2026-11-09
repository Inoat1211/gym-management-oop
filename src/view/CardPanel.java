package view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

/**
 * Màn hình "Thẻ tập". Lớp rỗng do Lead dựng sẵn để MainFrame gắn vào được ngay.
 * Người phụ trách thay phần giao diện bên trong, GIỮ NGUYÊN tên lớp và hàm refreshData().
 */
public class CardPanel extends JPanel {

    public CardPanel() {
        setLayout(new BorderLayout());
        setPreferredSize(new Dimension(980, 700));
        setBackground(new Color(245, 247, 250));

        JLabel lblTitle = new JLabel("Thẻ tập", SwingConstants.CENTER);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 20));
        add(lblTitle, BorderLayout.CENTER);
    }

    /** Tải lại bảng và hộp chọn khi người dùng chuyển sang tab này (không xóa dữ liệu đang nhập dở). */
    public void refreshData() {
        // TODO: người phụ trách điền
    }
}
