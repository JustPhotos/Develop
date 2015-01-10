<%@ Page Title="Just Photos - My Head Picture" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="UserHeadPic.aspx.vb" Inherits="UserHeadPic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PanelUserHeadPicPage" runat="server" DefaultButton="BtnUserHeadPicPageCancel">
        <div id="uploadHeadBlock">
            <table align="center">
                <tr>
                    <th colspan="2">Upload Head Picture</th>
                </tr>
                <tr>
                    <td style ="text-align : center ;">
                        <asp:FileUpload ID="UserHeadPicPageFileUpload" runat="server" onchange="UserHeadPicPageCheck();" ClientIDMode="Static" style="display:none;" />
                        <asp:Button ID="BtnUserHeadPicPageReset" runat="server" Text="清除選取" ClientIDMode="Static" />
                        <%--<input id="BtnUserHeadPicPageReset" type="button" value="清除選取" onclick="UserHeadPicPageReset();"/>--%>
                        <br />
                        <asp:Image ID="UserHeadPicPageTempPreview" runat="server" ClientIDMode="Static" AlternateText="未選擇頭像圖片" ImageUrl="~/img/guset_448_448.png" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnUserHeadPicPageUpload" runat="server" Text="上傳頭像" />
                        <asp:Button ID="BtnUserHeadPicPageCancel" runat="server" Text="取消編輯" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

