using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nhung_web
{
    public partial class trang1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu người dùng đã đăng nhập
            if (Session["Username"] != null)
            {
                // Hiển thị thông tin người dùng đã đăng nhập
                Label1.Text = "Xin chào, " + Session["Username"].ToString();
                btnLogin.Visible = false; // Ẩn nút Đăng Nhập
                btnLogout.Visible = true; // Hiển thị nút Đăng Xuất
            }
            else
            {
                // Nếu chưa đăng nhập
                btnLogin.Visible = true;
                btnLogout.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Lấy thông tin người dùng nhập vào
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Kết nối đến cơ sở dữ liệu
            string connectionString3 = "Provider=SQLOLEDB;Data Source=HANAM-PC\\SQLEXPRESS;Persist Security Info=True;Password=2003;User ID=Login;Initial Catalog=demo_timkiemviec";

            using (OleDbConnection conn = new OleDbConnection(connectionString3))
            {
                // Câu lệnh SQL để kiểm tra tài khoản và mật khẩu
                string query = "SELECT COUNT(*) FROM DangKy WHERE Username = ? AND Password = ?";

                OleDbCommand cmd = new OleDbCommand(query, conn);

                // Thêm tham số vào câu lệnh SQL
                cmd.Parameters.AddWithValue("?", username);
                cmd.Parameters.AddWithValue("?", password);

                try
                {
                    // Mở kết nối
                    conn.Open();

                    // Thực thi câu lệnh và lấy kết quả
                    int result = (int)cmd.ExecuteScalar();

                    // Kiểm tra nếu có kết quả trả về (tài khoản và mật khẩu đúng)
                    if (result > 0)
                    {
                        // Đăng nhập thành công
                        Session["Username"] = username; // Lưu thông tin người dùng vào session
                        Label1.Text = "Đăng nhập thành công!";

                        // Cập nhật giao diện: ẩn nút đăng nhập và hiển thị nút đăng xuất
                        btnLogin.Visible = false;
                        btnLogout.Visible = true;
                    }
                    else
                    {
                        // Đăng nhập thất bại
                        Label1.Text = "Tên đăng nhập hoặc mật khẩu không chính xác!";
                    }
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi nếu có
                    Label1.Text = "Có lỗi xảy ra: " + ex.Message;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Hủy session khi người dùng đăng xuất
            Session.Abandon(); // Xóa tất cả các session của người dùng

            // Đặt lại các nút hiển thị
            btnLogin.Visible = true; // Hiển thị nút Đăng Nhập
            btnLogout.Visible = false; // Ẩn nút Đăng Xuất

            // Hiển thị thông báo đăng xuất thành công
            Label1.Text = "Bạn đã đăng xuất thành công.";
        }

        protected void RedirectToDetail(object sender, EventArgs e)
        {
            var button = (Button)sender;
            string company = button.CommandArgument;

            // Xử lý logic hiển thị chi tiết công ty ở đây
            Label1.Text = $"Xem chi tiết cho công ty: {company}";
        }

        protected void RedirectToApply(object sender, EventArgs e)
        {
            var button = (Button)sender;
            string company = button.CommandArgument;

            // Xử lý logic nộp hồ sơ ở đây
            Label1.Text = $"Nộp hồ sơ cho công ty: {company}";
        }


        public void submitApplication(object sender, EventArgs e)
        {
            string selectedCompanyText = ddlCompany.SelectedItem.Text;

            string name = txtName.Text;
            string candidateID = txtCandidateID.Text;
            string address = txtAddress.Text;
            string dateOfBirth = txtDOB.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string jobTitle = txtJobTitle.Text;
            string position = txtPosition.Text;
            string desiredSalary = txtDesiredSalary.Text;
            string company = ddlCompany.SelectedItem.Text;

            // Kết nối cơ sở dữ liệu
            string connectionString = "Provider=SQLOLEDB;Data Source=HANAM-PC\\SQLEXPRESS;Persist Security Info=True;Password=2003;User ID=Login;Initial Catalog=demo_timkiemviec";

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                // Câu lệnh SQL để chèn dữ liệu vào bảng UngVien
                string query = @"INSERT INTO UngVien (Name, CandidateID, Address, DateOfBirth, Email, Phone, JobTitle, Position, DesiredSalary, Company) 
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                OleDbCommand cmd = new OleDbCommand(query, conn);
                {
                    // Thêm tham số
                    cmd.Parameters.AddWithValue("Name", name);
                    cmd.Parameters.AddWithValue("CandidateID", candidateID);
                    cmd.Parameters.AddWithValue("Address", address);
                    cmd.Parameters.AddWithValue("DateOfBirth", dateOfBirth);
                    cmd.Parameters.AddWithValue("Email", email);
                    cmd.Parameters.AddWithValue("Phone", phone);
                    cmd.Parameters.AddWithValue("JobTitle", jobTitle);
                    cmd.Parameters.AddWithValue("Position", position);
                    cmd.Parameters.AddWithValue("DesiredSalary", desiredSalary);
                    cmd.Parameters.AddWithValue("Company", company);

                    // Thực thi câu lệnh
                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        // Hiển thị modal sau khi lưu thành công
                        string script = "setTimeout(function(){ $('#Modal_Success').modal('show'); }, 100);";
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessModal", script, true);
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "Có lỗi xảy ra: " + ex.Message;
                    }
                }
            }
        }
    }
}