<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="upload.aspx.vb" Inherits="upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="uploadBlock">
        <table>
            <tr><th colspan="2">Upload</th></tr>
            <tr>
                <td><span>選擇檔案</span></td>
                <td>
                    <asp:TextBox ID="fileBtn" type="file" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><span>圖片名稱</span></td>
                <td><asp:TextBox ID="photoName" typt="text" MaxLength="10" placeholder="圖片名稱" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="上傳"/>
                    <asp:TextBox ID="cancel" type="reset" runat="server" Text="重設"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

