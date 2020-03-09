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
    public partial class FormQLBaoCaoThongKe : Form
    {
        private static FormQLBaoCaoThongKe instance;
        public static FormQLBaoCaoThongKe Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new FormQLBaoCaoThongKe();
                }
                return instance;
            }
        }

        public FormQLBaoCaoThongKe()
        {
            InitializeComponent();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            FormQLBaoCaoThongKe.Instance.Close();
            FormMenu.Instance.Show();
        }
    }
}
