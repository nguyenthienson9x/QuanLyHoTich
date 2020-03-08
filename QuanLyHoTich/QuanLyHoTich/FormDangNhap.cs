using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLHT.Entity;
using QLHT.Model;

namespace QuanLyHoTich
{
    public partial class FormDangNhap : Form
    {
        private static FormDangNhap instance;
        public static FormDangNhap Instance
        {
            get
            {
                if(instance == null)
                {
                    instance = new FormDangNhap();
                }
                return instance;
            }
        }
        public FormDangNhap()
        {
            InitializeComponent();
        }

        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn chắc chắn muốn thoát", "Xác nhận", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                //Application.Exit();
                Environment.Exit(0);
            }
        }

        private void btn_DangNhap_Click(object sender, EventArgs e)
        {
            string TaiKhoan = txtbUsername.Text.Trim();
            string Password = txtbPassword.Text.Trim();
            var congChucModel = new CongChucModel();
            if (congChucModel.DangNhap(TaiKhoan, Password))
            {
                this.Hide();
                FormMenu.Instance.Show();               
            }
            else
            {
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu");
            }
        }
    }
}
