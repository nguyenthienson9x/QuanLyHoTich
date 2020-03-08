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
    public partial class FormMenu : Form
    {
        private static FormMenu instance;
        public static FormMenu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new FormMenu();
                }
                return instance;
            }
        }
        public FormMenu()
        {
            InitializeComponent();
        }

        private void DangXuatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormDangNhap.Instance.Show();
            FormMenu.Instance.Close();
        }
    }
}
