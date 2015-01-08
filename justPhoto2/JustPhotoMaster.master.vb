Partial Class JustPhotoMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub jpt_masterPageLogout_Click(sender As Object, e As EventArgs) Handles jpt_masterPageLogout.Click
        'clear session
        Session("jpt_id") = ""
        Session("jpt_memberAcc") = ""
        Session("isLoginState") = ""

        'change master page link and button visible
        jpt_masterPageSignup.Visible = True
        jpt_masterPageLogin.Visible = True
        jpt_masterPageAccount.Visible = False
        jpt_masterPagePersonal.Visible = False
        jpt_masterPageUpload.Visible = False
        jpt_masterPageLogout.Visible = False

        'redirect to default
        Response.Redirect("~\Default.aspx")
    End Sub
End Class