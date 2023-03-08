using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace QLNS
{
    public partial class Form3 : Form
    {
        // khởi tạo kết nối
        SqlConnection conn;
        SqlCommand cmd;
        String str = "Data Source=MAOTOU\\SQLEXPRESS;Initial Catalog=QLNS_v2;Integrated Security=True";

        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        // khai báo biến
        string _devid;
        string _name;
        string _gender;
        string _birthday;
        string _cccd;
        string _address;
        string _phone;
        string _email;
        string _status;
        string _certificate;

        public Form3()
        {
            InitializeComponent();
        }

        public Form3(string devid, string name, string gender, string birthday,
                    string cccd, string address, string phone, string email, 
                    string status, string certificate)

        {
            InitializeComponent();
            _devid = devid;
            _name = name;
            _gender = gender;
            _birthday = birthday;
            _cccd = cccd;
            _address = address;
            _phone = phone;
            _email = email;
            _status = status;
            _certificate = certificate;
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void label16_Click(object sender, EventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void Form3_Load(object sender, EventArgs e)
        {
            // load bên bảng xem
            label_form3_manv.Text = _devid;
            label_form2_Hovaten.Text = _name;
            label_form2_gioitinh.Text = _gender;
            label_form2_ngaysinh.Text = _birthday;
            label_fom2_cccd.Text = _cccd;
            label_form2_diachi.Text = _address;
            label_form2_sdt.Text = _phone;
            label_form2_email.Text= _email;
            label_form2_trangthai.Text = _status;
            label_form2_bangcap.Text = _certificate;

            // load bên bảng sửa
            label_tag2_manv.Text = _devid;
            textBox_Hovaten.Text = _name;
            comboBox_gioitinh.Text= _gender;
            textBox_ngaysinh .Text = _birthday;
            textBox_cccd.Text = _cccd;
            textBox_diachi .Text = _address;
            comboBox_trangthai.Text = _status;
            textBox_sdt.Text = _phone;
            textBox_email.Text = _email;
            comboBox_Bangcap.Text = _certificate;

            //  khởi động kết nối
            conn = new SqlConnection(str);
            conn.Open();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void label14_Click(object sender, EventArgs e)
        {

        }

        private void label27_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void tabPage3_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn lưu ?","Xác nhận",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question);
            if (result == DialogResult.Yes) {

                int gender = comboBox_gioitinh.Text == "Nam" ? 0 : 1;
                int status = comboBox_trangthai.Text == "Đang làm việc" ? 1 : 0;

                try
                {
                    cmd = conn.CreateCommand();
                    cmd.CommandText = "UPDATE Developer SET\r\n    " +
                        "Name = N'"+ textBox_Hovaten.Text +"',\r\n    " +
                        "Gender = "+ gender +",\r\n    " +
                        "Birthday = '"+ textBox_ngaysinh.Text +"',\r\n    " +
                        "Phone = '"+ textBox_sdt.Text +"',\r\n    " +
                        "Email = '"+ textBox_email.Text +"',\r\n    " +
                        "CitizenID = '"+ textBox_cccd.Text +"',\r\n    " +
                        "Address = N'"+ textBox_diachi.Text +"',\r\n    " +
                        "Status = "+ status +"\r\n" +
                        "WHERE DeveloperID = "+ label_tag2_manv.Text + " -- Thay đổi ID cần cập nhật\r\n\r\n" +
                        "-- Cập nhật thông tin trong bảng certificate\r\n" +
                        "UPDATE certificate SET\r\n    " +
                        "certificateDetailsName = N'"+ comboBox_Bangcap.Text +"'\r\n" +
                        "FROM certificate c\r\n" +
                        "INNER JOIN Developer d ON c.DeveloperID = d.DeveloperID\r\n" +
                        "WHERE d.DeveloperID = "+ label_tag2_manv.Text +" -- Thay đổi ID cần cập nhật";
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Update thành công");
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Update thất bại: " + ex);
                }
            }
        }

        private void label29_Click(object sender, EventArgs e)
        {

        }

        private void label39_Click(object sender, EventArgs e)
        {

        }

        private void label33_Click(object sender, EventArgs e)
        {

        }

        private void tabPage4_Click(object sender, EventArgs e)
        {

        }

        private void label34_Click(object sender, EventArgs e)
        {

        }

        private void label35_Click(object sender, EventArgs e)
        {

        }

        private void label36_Click(object sender, EventArgs e)
        {

        }

        private void label38_Click(object sender, EventArgs e)
        {

        }

        private void label43_Click(object sender, EventArgs e)
        {

        }

        private void label46_Click(object sender, EventArgs e)
        {

        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void label_form2_Hovaten_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }
    }
}
