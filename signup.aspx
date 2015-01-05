<%@ Page Language="VB" AutoEventWireup="false" CodeFile="signup.aspx.vb" Inherits="_signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>註冊帳號</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="LabelAccount" runat="server" Text="帳號" style="top: 29px; left: 20px; position: absolute; height: 16px; width: 32px"></asp:Label>
        <asp:TextBox ID="TextBoxAccount" runat="server" placeholder="數字與英文，至少六碼" MaxLength="15" style="top: 30px; left: 129px; position: absolute; height: 19px; width: 180px"></asp:TextBox>
        <asp:CustomValidator ID="accountValidator" runat="server" ErrorMessage="至少輸入六碼" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 60px; left: 129px; position: absolute; height: 13px; width: 188px" ControlToValidate="TextBoxAccount" EnableClientScript="False"></asp:CustomValidator>
        <asp:RequiredFieldValidator ID="accountRequired" runat="server" ErrorMessage="請輸入帳號" ControlToValidate="TextBoxAccount" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 60px; left: 129px; position: absolute; height: 13px; width: 188px" EnableClientScript="False"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelPassword" runat="server" Text="密碼" style="top: 92px; left: 20px; position: absolute; height: 16px; width: 32px; right: 1242px;"></asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" placeholder="輸入密碼" MaxLength="30" style="top: 92px; position: absolute; height: 19px; width: 180px; left: 128px;"></asp:TextBox>
        <asp:CustomValidator ID="pwValidator" runat="server" ErrorMessage="至少六碼英數字元" ControlToValidate="TextBoxPassword" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 120px; left: 128px; position: absolute; height: 16px; width: 181px"></asp:CustomValidator>
        <asp:RequiredFieldValidator ID="pwRequired" runat="server" ErrorMessage="請輸入密碼" ControlToValidate="TextBoxPassword" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 120px; left: 128px; position: absolute; height: 16px; width: 181px"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="LabelPasswordConfirm" runat="server" Text="密碼確認" style="top: 155px; left: 20px; position: absolute; height: 16px; width: 65px; right: 1242px;"></asp:Label>
        <asp:TextBox ID="TextBoxPasswordConfirm" runat="server" TextMode="Password" placeholder="再輸入一次密碼" MaxLength="30" style="top: 155px; position: absolute; height: 19px; width: 180px; left: 128px;"></asp:TextBox>
        <asp:RequiredFieldValidator ID="pwcRequired" runat="server" ErrorMessage="請輸入密碼確認" ControlToValidate="TextBoxPasswordConfirm" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 185px; left: 128px; position: absolute; height: 16px; width: 181px"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="pwcCompare" runat="server" ErrorMessage="密碼不同，請重新輸入" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 185px; left: 128px; position: absolute; height: 16px; width: 181px" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxPasswordConfirm"></asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="LabelEmail" runat="server" Text="Email" style="top: 218px; left: 20px; position: absolute; height: 16px; width: 36px"></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server" placeholder="輸入信箱" MaxLength="50" style="top: 218px; left: 128px; position: absolute; height: 19px; width: 180px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailRequired" runat="server" ErrorMessage="請輸入信箱" ControlToValidate="TextBoxEmail" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 245px; left: 129px; position: absolute; height: 16px; width: 181px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="信箱格式錯誤" ControlToValidate="TextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 245px; left: 129px; position: absolute; height: 16px; width: 181px"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="LabelName" runat="server" Text="姓名" style="top: 281px; left: 20px; position: absolute; height: 16px; width: 32px"></asp:Label>
        <asp:TextBox ID="TextBoxName" runat="server" placeholder="輸入姓名" MaxLength="30" style="top: 281px; left: 128px; position: absolute; height: 19px; width: 180px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="nameRequired" runat="server" ErrorMessage="請輸入姓名" ControlToValidate="TextBoxName" EnableClientScript="False" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 310px; left: 128px; position: absolute; height: 16px; width: 181px"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="LabelDescription" runat="server" Text="描述" style="top: 344px; left: 20px; position: absolute; height: 16px; width: 32px"></asp:Label>
        <asp:TextBox ID="TextBoxDescription" runat="server" placeholder="輸入個人描述(150字以內)" Columns="50" Height="70px" Rows="3" TextMode="MultiLine" Width="650px" style="overflow: hidden; top: 344px; left: 128px; position: absolute;" MaxLength="150"></asp:TextBox>
        <asp:CustomValidator ID="descriptionValidator" runat="server" ErrorMessage="描述不能超過150字" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" style="top: 425px; left: 128px; position: absolute; height: 13px; width: 188px" ControlToValidate="TextBoxDescription" EnableClientScript="False"></asp:CustomValidator>
        <asp:Image ID="ImageHeadPicture" runat="server" style="top: 29px; left: 480px; position: absolute; height: 200px; width: 180px" Visible="False" />
        <asp:Button ID="BtnSubmit" runat="server" Text="註冊" style="top: 447px; left: 638px; position: absolute; height: 30px; width: 141px" />
        <asp:Button ID="BtnCancel" runat="server" Text="取消" style="top: 447px; left: 497px; position: absolute; height: 30px; width: 141px" />
        <asp:FileUpload ID="FileUploadHeadPic" onchange="autoUpload" runat="server" style="top: 229px; left: 480px; position: absolute; height: 25px; width: 180px" Visible="False" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
