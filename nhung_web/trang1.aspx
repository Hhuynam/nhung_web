<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trang1.aspx.cs" Inherits="nhung_web.trang1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>Trang 1</title>
    <style></style>
    <script>
        // Show or hide modals based on company name
        function showModal(companyName) {
            // Hide all modals first
            $('#Modal_Samsung').modal('hide');
            $('#Modal_SRTech').modal('hide');
            $('#Modal_Hadanbi').modal('hide');
            $('#Modal_KHVatec').modal('hide');
            $('#Modal_Wits').modal('hide');

            // Show corresponding modal
            if (companyName === "Samsung") {
                $('#Modal_Samsung').modal('show');
            } else if (companyName === "SRTech") {
                $('#Modal_SRTech').modal('show');
            }
            else if (companyName === "Hadanbi") {
                $('#Modal_Hadanbi').modal('show');
            }
            else if (companyName === "KHVatec") {
                $('#Modal_KHVatec').modal('show');
            }
            else if (companyName === "Wits") {
                $('#Modal_Wits').modal('show');
            }
        }

        // Show the application modal
        function showApplyModal() {
            $('#Modal_Apply').modal('show');
        }

        // Open the success modal after submission
        function showSuccessModal() {
            $('#Modal_Success').modal('show');
        }

        // Close the success modal
        function closeSuccessModal() {
            $('#Modal_Success').modal('hide');
        }

        // Close any modal
        function closeModal() {
            $('#Modal_Apply').modal('hide');
            $('#Modal_Samsung').modal('hide');
            $('#Modal_SRTech').modal('hide');
            $('#Modal_Hadanbi').modal('hide');
            $('#Modal_KHVatec').modal('hide');
            $('#Modal_Wits').modal('hide');
        }

        // Handle application submission (example: alert and close modal)
        function submitApplication() {
            // Simulate submission (e.g., sending data to the server)
            alert("Hồ sơ đã được nộp thành công!");
            closeModal(); // Close the modal after submission
            showSuccessModal(); // Show success notification modal
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UngVien]" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <asp:Panel ID="Panel1" runat="server" BackColor="#FFFFCC" Height="100%">
                    <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" OnClick="btnLogin_Click" CssClass="btn btn-primary" data-toggle="modal" data-target="#loginModal" Visible="true" />
                    <asp:Button ID="btnLogout" runat="server" Text="Đăng Xuất" OnClick="btnLogout_Click" CssClass="btn btn-danger" Visible="false" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Xin chao"></asp:Label>
                    <hr />
                    <asp:Label ID="Label2" runat="server" Text="Danh sach cong ty tai Thai Nguyen"></asp:Label>
                    <br />
                    <hr />
                    <asp:Label ID="Label3" runat="server" Text="Cong ty Samsung Thai Nguyen"></asp:Label>
                    <br />
                    <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="182px" ImageUrl="https://io.meeymedia.com/meeyland-cms/uploads/images/2022/03/02/samsung-viet-nam-1-1646236561.jpg" Width="280px" />
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="Xem chi tiết" OnClientClick="showModal('Samsung'); return false;" class="btn btn-primary" />
                    <asp:Button ID="Button4" runat="server" Text="Nop ho so" OnClientClick="showApplyModal(); return false;" CommandArgument="Samsung" class="btn btn-success" />
                    <br />
                    <hr />
                    Cong ty SR Tech<br />
                    <asp:Image ID="Image2" runat="server" CssClass="auto-style1" Height="182px" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDObNOPCcJmA4C81y2HuQiFHuoMDKHXx0M9A&amp;s" Width="280px" />
                    <br />
                    <asp:Button ID="Button5" runat="server" Text="Xem chi tiết" OnClientClick="showModal('SRTech'); return false;" class="btn btn-primary" />
                    <asp:Button ID="Button6" runat="server" Text="Nop ho so" OnClientClick="showApplyModal(); return false;" CommandArgument="SRTech" class="btn btn-success" />
                    <hr />
                    Cong ty Hadanbi<br />
                    <asp:Image ID="Image3" runat="server" CssClass="auto-style1" Height="182px" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYSQyBRw5KsJdg3YEgs-3vckwbAUptC8qJ7w&amp;s" Width="280px" />
                    <br />
                    <asp:Button ID="Button8" runat="server" class="btn btn-primary" OnClientClick="showModal('Hadanbi'); return false;" Text="Xem chi tiết" />
                    <asp:Button ID="Button9" runat="server" class="btn btn-success" CommandArgument="Handabi" OnClientClick="showApplyModal(); return false;" Text="Nop ho so" />
                    <hr />
                    Cong ty KH Vatec<br />
                    <asp:Image ID="Image4" runat="server" CssClass="auto-style1" Height="182px" ImageUrl="https://hust.com.vn/uploads/plugin/introduce/52/1597640466-1573419557-sua-chua-thay-the-cam-bien-nhiet-do-cho-cong-ty-khvatec.jpg" Width="280px" />
                    <br />
                    <asp:Button ID="Button10" runat="server" class="btn btn-primary" OnClientClick="showModal('KHVatec'); return false;" Text="Xem chi tiết" />
                    <asp:Button ID="Button11" runat="server" class="btn btn-success" CommandArgument="KHVatec" OnClientClick="showApplyModal(); return false;" Text="Nop ho so" />
                    <hr />
                    Cong ty Wits Vina<br />
                    <asp:Image ID="Image5" runat="server" CssClass="auto-style1" Height="182px" ImageUrl="https://jobsgo.vn/media/img/employer/43869-200x200.jpg?v=1584607281" Width="280px" />
                    <br />
                    <asp:Button ID="Button12" runat="server" class="btn btn-primary" OnClientClick="showModal('Wits'); return false;" Text="Xem chi tiết" />
                    <asp:Button ID="Button13" runat="server" class="btn btn-success" CommandArgument="Wits" OnClientClick="showApplyModal(); return false;" Text="Nop ho so" />
                    <br />
                    <hr />
                </asp:Panel>
        </div>

        <!-- Modal Samsung -->
        <div class="modal fade" id="Modal_Samsung">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cong ty Samsung</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea id="TextArea_Samsung" cols="30" rows="5" class="form-control">Samsung tuyen dung 2024. muc luong hap dan: 4500000 / thang</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Hadanbi -->
        <div class="modal fade" id="Modal_Hadanbi">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cong ty Hadanbi</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea id="TextArea_Hadanbi" cols="30" rows="5" class="form-control">Hadanbi tuyen dung 2024. muc luong hap dan: 4000000 / thang</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal SRTech -->
        <div class="modal fade" id="Modal_SRTech">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cong ty SRTech</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea id="TextArea_SRTech" cols="30" rows="5" class="form-control">SRTech tuyen dung 2024. muc luong hap dan: 4000000 / thang</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Wits -->
        <div class="modal fade" id="Modal_Wits">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cong ty Wits</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea id="TextArea_Wits" cols="30" rows="5" class="form-control">Wits tuyen dung 2024. muc luong hap dan: 4000000 / thang</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal KHVatec -->
        <div class="modal fade" id="Modal_KHVatec">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cong ty KHVatec</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <textarea id="TextArea_KHVatec" cols="30" rows="5" class="form-control">KHVatec tuyen dung 2024. muc luong hap dan: 4000000 / thang</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal cho Nộp Hồ Sơ -->
        <div id="Modal_Apply" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <h5>Nộp Hồ Sơ</h5>
                    </div>
                    <div class="modal-body">
                        <label for="txtName">Họ tên</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Nhập họ tên"></asp:TextBox>

                        <label for="txtAddress">Địa chỉ</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Nhập địa chỉ"></asp:TextBox>

                        <label for="txtDOB">Ngày sinh</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" Placeholder="Nhập ngày sinh"></asp:TextBox>

                        <label for="txtCandidateID">Mã ứng viên</label>
                        <asp:TextBox ID="txtCandidateID" runat="server" CssClass="form-control" Placeholder="Nhập mã ứng viên"></asp:TextBox>

                        <label for="txtDesiredSalary">Mức lương mong muốn</label>
                        <asp:TextBox ID="txtDesiredSalary" runat="server" CssClass="form-control" Placeholder="Nhập mức lương mong muốn"></asp:TextBox>

                        <label for="txtJobTitle">Tên công việc</label>
                        <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" Placeholder="Nhập tên công việc"></asp:TextBox>

                        <label for="txtPosition">Vị trí công việc</label>
                        <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control" Placeholder="Nhập vị trí công việc"></asp:TextBox>

                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Nhập email" TextMode="Email"></asp:TextBox>

                        <label for="txtPhone">Số điện thoại</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Nhập số điện thoại"></asp:TextBox>

                        <label for="fileUpload">Tải hồ sơ</label>
                        <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn-close" onclick="closeModal()">Đóng</button>
                        <label for="ddlCompany">Chọn công ty</label>
                        <asp:DropDownList ID="ddlCompany" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Chọn công ty" Value="" />
                            <asp:ListItem Text="SamSung" Value="1" />
                            <asp:ListItem Text="SRTech" Value="2" />
                            <asp:ListItem Text="Hadanbi" Value="3" />
                            <asp:ListItem Text="KHVatec" Value="4" />
                            <asp:ListItem Text="Wits" Value="5" />
                        </asp:DropDownList>
                        <asp:Button ID="Button7" runat="server" Text="Nộp Hồ Sơ" OnClick="submitApplication" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal thông báo thành công -->
        <div id="Modal_Success" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <p>Hồ sơ của bạn đã được gửi thành công.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeSuccessModal()">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Đăng Nhập -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Đăng Nhập</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="Label4" runat="server" Text="Vui lòng nhập thông tin đăng nhập." CssClass="text-danger"></asp:Label>
                        <div class="form-group">
                            <label for="txtUsername">Tên Đăng Nhập</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tên đăng nhập"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Mật khẩu</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary" onclick="submitLogin()">Đăng Nhập</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
