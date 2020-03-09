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

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnXemBaoCao_Click(object sender, EventArgs e)
        {

        }
    }
}
