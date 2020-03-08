using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyHoTich
{
    public partial class FormDangNhap : Form
    {
        public FormDangNhap()
        {
            InitializeComponent();
        }

        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Bạn chắc chắn muốn thoát", "Xác nhận", MessageBoxButtons.OKCancel) == DialogResult.OK)
            {
                //Application.Exit();
                Environment.Exit(0);
            }
        }

        private void btn_DangNhap_Click(object sender, EventArgs e)
        {

        }
    }
}
