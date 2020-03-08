using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHT.Model
{
    public class CongChucModel
    {
        DataProvider da = new DataProvider();
        public bool DangNhap(string TaiKhoan, string MatKhau)
        {
            DataTable dt = da.ExecuteQuery("Proc_CongChuc_DangNhap", new object[] { TaiKhoan, MatKhau }, new List<string>() { "@TaiKhoan", "@Pass" });
            if (dt!=null && dt.Rows.Count > 0)
            {
                return true;
            }
            else
                return false;
        }
    }
}
