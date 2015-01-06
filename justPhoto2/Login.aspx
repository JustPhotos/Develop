<%@ Page Title="" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 85px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="loginBlock">
        <table align="center">
            <tr>
                <th colspan="2">Login</th>
            </tr>
            <tr>
                <td class="auto-style1">
                    <br />
                    帳號/信箱</td>
                <td>
                    <br />
                    <br />
                    <asp:TextBox ID="email_l" type="email" placeholder="信箱" runat="server"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="LoginAccountNull" runat="server" ErrorMessage="請輸入帳號" ControlToValidate="email_l" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="LoginAccountCheck" runat="server" ErrorMessage="找不到帳號，請重新入" ControlToValidate="email_l" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" EnableClientScript="False"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">密碼</td>
                <td>
                    <asp:TextBox ID="pw" type="password" maxlength="30" placeholder="密碼" runat="server" ValidateRequestMode="Inherit"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="LoginPasswordNull" runat="server" ErrorMessage="請輸入密碼" ControlToValidate="pw" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="LoginPasswordCheck" runat="server" ErrorMessage="密碼不正確，請確認後再輸入" ControlToValidate="pw" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" EnableClientScript="False"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="BtnLogin" runat="server" Text="登入" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

