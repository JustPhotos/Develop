<%@ Page Title="Just Photos - 上傳照片" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Upload.aspx.vb" Inherits="Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      
        <style type="text/css"> .auto-style2 {width: 188px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

         <div id="signupBlock" class="signupStyle">

        <table align="center">

            <tr>
                <th colspan="2">Upload</th>
            </tr>

            <tr>
                 <td class="auto-style2">     
                      <asp:FileUpload ID="picuploadbox"  runat="server" />
                      <br />
                      <asp:Label ID="status" runat="server" Text="檔案大小應為:10MB以內，<br/>檔案副檔名應為：jpg、jpeg、png" Font-Bold="True" Font-Overline="False" Font-Size="X-Small" ForeColor="#666666"></asp:Label>
                      <br />
                      <asp:Label ID="status1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="X-Small" ForeColor="#666666" Enabled="False"></asp:Label>
             </tr>

             <tr>
                  <td colspan="2">
                       <asp:Button ID="picuploadsubmit" runat="server" Text="上傳" Font-Names="微軟正黑體" />
                  </td>
             </tr>
        </table>

    </div>
</asp:Content>

