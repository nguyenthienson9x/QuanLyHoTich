using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLHT.Entity
{
    public class CongChuc
    {
        private int _MaCongChuc;
        private string _HoTen;
        private DateTime _NgaySinh;
        private bool _GioiTinh;
        private string _QueQuan;
        private string _ChucVu;
        private int _MaBoPhan;
        private string _CMND;
        private string _TaiKhoan;
        private string _Pass;
        private string _Quyen;
        private string _TrangThai;

        public int MaCongChuc { get => _MaCongChuc; set => _MaCongChuc = value; }
        public string HoTen { get => _HoTen; set => _HoTen = value; }
        public DateTime NgaySinh { get => _NgaySinh; set => _NgaySinh = value; }
        public bool GioiTinh { get => _GioiTinh; set => _GioiTinh = value; }
        public string QueQuan { get => _QueQuan; set => _QueQuan = value; }
        public string ChucVu { get => _ChucVu; set => _ChucVu = value; }
        public int MaBoPhan { get => _MaBoPhan; set => _MaBoPhan = value; }
        public string CMND { get => _CMND; set => _CMND = value; }
        public string TaiKhoan { get => _TaiKhoan; set => _TaiKhoan = value; }
        public string Pass { get => _Pass; set => _Pass = value; }
        public string Quyen { get => _Quyen; set => _Quyen = value; }
        public string TrangThai { get => _TrangThai; set => _TrangThai = value; }

        public CongChuc(int maCongChuc, string hoTen, DateTime ngaySinh, bool gioiTinh, string queQuan, string chucVu, int maBoPhan, string cMND, string taiKhoan, string pass, string quyen, string trangThai)
        {
            MaCongChuc = maCongChuc;
            HoTen = hoTen;
            NgaySinh = ngaySinh;
            GioiTinh = gioiTinh;
            QueQuan = queQuan;
            ChucVu = chucVu;
            MaBoPhan = maBoPhan;
            CMND = cMND;
            TaiKhoan = taiKhoan;
            Pass = pass;
            Quyen = quyen;
            TrangThai = trangThai;
        }


        public CongChuc(string hoTen, DateTime ngaySinh, bool gioiTinh, string queQuan, string chucVu, int maBoPhan, string cMND, string taiKhoan, string pass, string quyen, string trangThai)
        {
            HoTen = hoTen;
            NgaySinh = ngaySinh;
            GioiTinh = gioiTinh;
            QueQuan = queQuan;
            ChucVu = chucVu;
            MaBoPhan = maBoPhan;
            CMND = cMND;
            TaiKhoan = taiKhoan;
            Pass = pass;
            Quyen = quyen;
            TrangThai = trangThai;
        }
    }
}
