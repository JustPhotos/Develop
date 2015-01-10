<%@ Page Title="Just Photos - 個人頁面" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Personal.aspx.vb" Inherits="Personal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="personalBar">
        <div class="grayBar">
            <div class="wrapper">
                <asp:Label ID="description" runat="server" Text="description"></asp:Label>
            </div>
        </div>
        <div class="whiteBar">
            <div class="wrapper">
                <div class="personBlock">
                    <asp:Label ID="name" runat="server" Text="name"></asp:Label>
                    <asp:Image ID="headPic" runat="server" Height="120px" Width="120px" ImageUrl="~/img/guset_448_448.png" />
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JustPhotoDBConnStr %>" SelectCommand="GETPHOTOBYUSERID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="jpt_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="photoList" width="100%" runat="server" ShowFooter="False" ShowHeader="False">
         <ItemTemplate>
            <div class="block" id="photoID">
                <asp:Image ID="photo" runat="server" ImageUrl='<%# Eval("photoID") %>' CssClass="photo"/>
                <br />
                <asp:Image ID="user" runat="server" ImageUrl='<%# Bind("userHeadPicture") %>' CssClass="user"/>
                <asp:Label ID="userName" runat="server" Text='<%# Bind("userName") %>' CssClass="userName"></asp:Label>
                <asp:Label ID="photoName" runat="server" Text='<%# Bind("photoName") %>' CssClass="photoName"></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <br /><br /><br /><br />
    <!--<div class="block" id="photoID">
        <asp:Image ID="photo" runat="server"/>
        <br />
        <asp:Image ID="user" runat="server" />
        <asp:Label ID="userName" runat="server" Text="userName"></asp:Label>
        <asp:Label ID="photoName" runat="server" Text="photoName"></asp:Label>
    </div>-->
    </asp:Content>


