using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHT.Entity
{
    public class CongDan
    {
        private int _MaCongDan;
        private string _HoTen;
        private DateTime _NgaySinh;
        private Boolean _GioiTinh;
        private string _QueQuan;
        private string _ThuongTru;
        private string _DanToc;
        private string _QuocTich;
        private string _CMND;
        private Boolean _TrangThai;

        public int MaCongDan { get => _MaCongDan; set => _MaCongDan = value; }
        public string HoTen { get => _HoTen; set => _HoTen = value; }
        public DateTime NgaySinh { get => _NgaySinh; set => _NgaySinh = value; }
        public bool GioiTinh { get => _GioiTinh; set => _GioiTinh = value; }
        public string QueQuan { get => _QueQuan; set => _QueQuan = value; }
        public string ThuongTru { get => _ThuongTru; set => _ThuongTru = value; }
        public string DanToc { get => _DanToc; set => _DanToc = value; }
        public string QuocTich { get => _QuocTich; set => _QuocTich = value; }
        public string CMND { get => _CMND; set => _CMND = value; }
        public bool TrangThai { get => _TrangThai; set => _TrangThai = value; }

        public CongDan(int maCongDan, string hoTen, DateTime ngaySinh, bool gioiTinh, string queQuan, string thuongTru, string danToc, string quocTich, string cMND, bool trangThai)
        {
            MaCongDan = maCongDan;
            HoTen = hoTen;
            NgaySinh = ngaySinh;
            GioiTinh = gioiTinh;
            QueQuan = queQuan;
            ThuongTru = thuongTru;
            DanToc = danToc;
            QuocTich = quocTich;
            CMND = cMND;
            TrangThai = trangThai;
        }

        public CongDan(string hoTen, DateTime ngaySinh, bool gioiTinh, string queQuan, string thuongTru, string danToc, string quocTich, string cMND, bool trangThai)
        {
            HoTen = hoTen;
            NgaySinh = ngaySinh;
            GioiTinh = gioiTinh;
            QueQuan = queQuan;
            ThuongTru = thuongTru;
            DanToc = danToc;
            QuocTich = quocTich;
            CMND = cMND;
            TrangThai = trangThai;
        }
    }
}
