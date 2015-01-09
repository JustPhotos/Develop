
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub jpt_defaultPageSignup_Click(sender As Object, e As EventArgs) Handles jpt_defaultPageSignup.Click
        Response.Redirect("~\Signup.aspx")
    End Sub

    Protected Sub jpt_defaultPageLogin_Click(sender As Object, e As EventArgs) Handles jpt_defaultPageLogin.Click
        Response.Redirect("~\Login.aspx")
    End Sub
End Class
