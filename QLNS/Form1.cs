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
    public partial class FormAdmin : Form
    {
        // khởi tạo kết nối
        SqlConnection conn;
        SqlCommand cmd;
        String str = "Data Source=MAOTOU\\SQLEXPRESS;Initial Catalog=QLNS_v2;Integrated Security=True";

        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        // khai báo biến
        String accid;
        String name;
        String gender;
        String birthday;
        String cccd;
        String address;
        String phone;
        String email;
        String status;
        String certificate;

        public void loadData()
        {
            cmd = conn.CreateCommand();
            cmd.CommandText = "select d.DeveloperID, \r\nd.Name,\r\ncase when d.Gender= 0 then N'Nam' else N'Nữ' END as 'Gender',\r\nd.Birthday,\r\nd.CitizenID,\r\nd.Address,\r\nd.Phone,\r\nd.email,\r\ncase when d.status= 0 then N'Đã thôi việc' else N'Đang làm việc' END as 'Trạng thái',\r\nc.certificateDetailsName as 'Certificate'\r\n\r\nfrom\r\nDeveloper d join certificate c on d.DeveloperID = c.DeveloperID";
            adapter.SelectCommand = cmd;
            table.Clear();
            adapter.Fill(table);
            dataGridView1.DataSource= table;
        }

        public FormAdmin()
        {
            InitializeComponent();
        }

        private void button8_Click(object sender, EventArgs e)
        {

        }

        private void FormAdmin_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(str);
            conn.Open();
            loadData();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Form3 f3 = new Form3();
            f3.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void quảnLýNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void hệThốngToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // hiển thị thông tin dựa theo hàng đã bấm vào
            int i;
            i = dataGridView1.CurrentRow.Index;

            accid = dataGridView1.Rows[i].Cells[0].Value.ToString();
            name = dataGridView1.Rows[i].Cells[1].Value.ToString();
            gender = dataGridView1.Rows[i].Cells[2].Value.ToString();
            birthday = dataGridView1.Rows[i].Cells[3].Value.ToString();
            cccd = dataGridView1.Rows[i].Cells[4].Value.ToString();
            address = dataGridView1.Rows[i].Cells[5].Value.ToString();
            phone = dataGridView1.Rows[i].Cells[6].Value.ToString();
            email = dataGridView1.Rows[i].Cells[7].Value.ToString();
            status = dataGridView1.Rows[i].Cells[8].Value.ToString();
            certificate = dataGridView1.Rows[i].Cells[9].Value.ToString();

            Form3 f3 = new Form3(accid, name, gender, birthday,
                cccd,address, phone, email, status, certificate);
            f3.Show();
        }

        private void toolStripContainer1_ContentPanel_Load(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {

        }

        private void toolStripContainer1_TopToolStripPanel_Click(object sender, EventArgs e)
        {

        }

        private void menuStrip2_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            // hiển thị thông tin dựa theo hàng đã bấm vào
            int i;
            i = dataGridView1.CurrentRow.Index;

            accid = dataGridView1.Rows[i].Cells[0].Value.ToString();
            name = dataGridView1.Rows[i].Cells[1].Value.ToString();
            gender = dataGridView1.Rows[i].Cells[2].Value.ToString();
            birthday = dataGridView1.Rows[i].Cells[3].Value.ToString();
            cccd = dataGridView1.Rows[i].Cells[4].Value.ToString();
            address = dataGridView1.Rows[i].Cells[5].Value.ToString();
            phone = dataGridView1.Rows[i].Cells[6].Value.ToString();
            email = dataGridView1.Rows[i].Cells[7].Value.ToString();
            status = dataGridView1.Rows[i].Cells[8].Value.ToString();
            certificate = dataGridView1.Rows[i].Cells[9].Value.ToString();

        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.Show();     
        }

        private void toolStripButton1_Click_1(object sender, EventArgs e)
        {
            conn = new SqlConnection(str);
            conn.Open();
            loadData();
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn xóa nhân viên này ?", "Xác nhận",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question);
            if(result == DialogResult.Yes)
            {
                try
                {
                    cmd = conn.CreateCommand();
                    cmd.CommandText = "-- Xóa thông tin trong bảng certificate\r\n" +
                        "DELETE FROM certificate\r\n" +
                        "WHERE DeveloperID IN (SELECT DeveloperID FROM Developer " +
                        "WHERE DeveloperID = " + accid + ") " +
                        "-- Thay đổi ID cần xóa\r\n\r\n" +
                        "-- Xóa thông tin trong bảng developer\r\n" +
                        "DELETE FROM Developer\r\n" +
                        "WHERE DeveloperID = " + accid + " -- Thay đổi ID cần xóa";
                    cmd.ExecuteNonQuery();
                    loadData();
                    MessageBox.Show("Đã xóa thành công");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Không thể xóa nhân viên: " + ex);
                }
            }        
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {

        }

        private void toolStripButton5_Click_1(object sender, EventArgs e)
        {

        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4();
            f4.Show();
        }

        private void toolStripButton5_Click_2(object sender, EventArgs e)
        {

        }
    }
}
