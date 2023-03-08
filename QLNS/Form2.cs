using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNS
{
    public partial class Form2 : Form
    {
        // khởi tạo kết nối
        SqlConnection conn;
        SqlCommand cmd;
        String str = "Data Source=MAOTOU\\SQLEXPRESS;Initial Catalog=QLNS_v2;Integrated Security=True";

        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();
        public Form2()
        {
            InitializeComponent();
        }



        private void button3_Click(object sender, EventArgs e)
        {
            int gender = comboBox_gioitinh.Text == "Nam" ? 0 : 1;
            int status = comboBox_trangthai.Text == "Đang làm việc" ? 1 : 0;
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandText = "" +
                    "INSERT INTO [dbo].[Developer] \r\n([Name], [Gender], [Birthday], [Phone], [Email], [CitizenID], [Address], [Status])" +
                    " \r\nVALUES\r\n(N'"+ textBox_Hovaten.Text +"',"+ gender + ",'"+ textBox_ngaysinh.Text +"','"+ textBox_sdt.Text +"','"+textBox_email.Text+"','"+textBox_cccd.Text+"',N'"+textBox_diachi.Text+"',1)" +
                    "DECLARE @DeveloperID int = SCOPE_IDENTITY();\r\nINSERT INTO certificate (DeveloperID, [certificateDetailsName])" +
                    "\r\nVALUES (@DeveloperID, N'"+ comboBox_Bangcap.Text +"')";
                cmd.ExecuteNonQuery();

                MessageBox.Show("Thêm thành công !");
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi không thêm được Nhân viên: " + ex.Message);
            }
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(str);
            conn.Open();
        }
    }
}
