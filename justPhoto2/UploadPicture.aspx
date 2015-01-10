<%@ Page Title="" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="UploadPicture.aspx.vb" Inherits="UploadPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PanelUploadPicturePage" runat="server">
        <div id="uploadBlock">
            <table align="center">
                <tr>
                    <th colspan="2">Upload</th>
                </tr>
                <tr>
                    <%--<td><span>選擇檔案</span></td>--%>
                    <td style ="text-align : center ;">
                        <asp:FileUpload ID="UploadPageFileUpload" runat="server" onchange="fileUploadCheck();" ClientIDMode="Static"/>
                        <br />
                        <input id="BtnUploadPicPageReset" type="button" value="重新選擇" hidden="hidden" onclick="UploadPicturePageReset();"/>
                        <br />
                        <img id="UploadPageTempPreview" alt="未有圖片可預覽" src="" hidden="hidden" width="640px"/>
                        <%--<asp:Image ID="UploadPageTempPreview" runat="server" ImageUrl="~/img/dpgbg/jpt_bg_5.jpg" Width="500px" Height="388px" />--%>
                        <%--<asp:TextBox ID="fileBtn" type="file" runat="server"></asp:TextBox>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>圖片說明</span>
                    </td>
                </tr>
                <tr>
                    <td><%--<asp:TextBox ID="photoName" typt="text" MaxLength="10" placeholder="圖片名稱" runat="server"></asp:TextBox>--%>
                        <asp:TextBox ID="UploadPictureDescription" runat="server" AutoCompleteType="Disabled" Columns="50" Height="70px" MaxLength="150" Rows="3" style="overflow: hidden; resize: none;" TextMode="MultiLine" Width="650px"></asp:TextBox>
                        <br />
                        <asp:CustomValidator ID="UploadPictureDescriptionValidator" runat="server" ControlToValidate="UploadPictureDescription" Display="Dynamic" EnableClientScript="False" ErrorMessage="描述不能超過150字" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="height: 13px; width: 188px"></asp:CustomValidator>
                    </td>
                    <tr>
                        <td>
                            <asp:Button ID="BtnUploadPageUpload" runat="server" Text="上傳" />
                            <asp:Button ID="BtnUploadPageCancel" runat="server" Text="取消" />
                            <%--<asp:TextBox ID="cancel" type="reset" runat="server" Text="重設"></asp:TextBox>--%></td>
                    </tr>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>

