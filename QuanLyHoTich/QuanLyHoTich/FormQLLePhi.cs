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
    public partial class FormQLLePhi : Form
    {

        private static FormQLLePhi instance;
        public static FormQLLePhi Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new FormQLLePhi();
                }
                return instance;
            }
        }

        public FormQLLePhi()
        {
            InitializeComponent();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            FormQLLePhi.Instance.Close();
            FormMenu.Instance.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {

        }
    }
}
