
Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        Dim loginAccountStr As String = email_l.Text
        Dim loginPassword As String = pw.Text

        Dim checkLoginAll As Boolean = LoginAccountNull.IsValid And LoginAccountCheck.IsValid And LoginPasswordNull.IsValid And LoginPasswordCheck.IsValid
        If Not checkLoginAll Then
            Exit Sub
        End If

        Try
            Dim jptConn As System.Data.SqlClient.SqlConnection = New System.Data.SqlClient.SqlConnection
            jptConn.ConnectionString = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()

            Dim jptCommand As System.Data.SqlClient.SqlCommand = New System.Data.SqlClient.SqlCommand
            jptCommand.Connection = jptConn
            jptCommand.CommandType = Data.CommandType.StoredProcedure
            jptCommand.CommandText = "GETACCOUNT"
            jptCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@account", System.Data.SqlDbType.NVarChar, 15))
            jptCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@email", System.Data.SqlDbType.NVarChar, 50))
            jptCommand.Parameters("@account").Value = loginAccountStr
            jptCommand.Parameters("@email").Value = loginAccountStr

            Dim jptDataReader As System.Data.SqlClient.SqlDataReader = Nothing

            Try
                jptConn.Open()
                jptDataReader = jptCommand.ExecuteReader

                Dim FoundAccount As Boolean = False
                While jptDataReader.Read()
                    Dim getID As String = jptDataReader(0).ToString()
                    Dim getAccount As String = jptDataReader(1)
                    Dim getEmail As String = jptDataReader(2).ToString()
                    Dim getPassword As String = jptDataReader(3)

                    If (getAccount = loginAccountStr) Or (getEmail = loginAccountStr) Then
                        If getPassword = loginPassword Then
                            FoundAccount = True
                            'Response.Write("<Script language='JavaScript'>alert('登入成功');</Script>")

                            ' process login success 
                            Session("jpt_id") = getID
                            Session("jpt_memberAcc") = getAccount
                            Session("isLoginState") = "OK"
                            'Response.Write("~\personalPage")
                            ' login success end
                            Exit While
                        End If
                        LoginPasswordCheck.IsValid = False
                        pw.Text = ""
                        FoundAccount = True
                    End If
                End While

                If Not FoundAccount Then
                    LoginAccountCheck.ErrorMessage = "未註冊之帳號，請重新輸入"
                    LoginAccountCheck.IsValid = False
                    pw.Text = ""
                End If
            Catch ex As Exception
                Response.Write("<Script language='JavaScript'>alert('" & ex.Message & "999');</Script>")
            Finally
                If Not (jptDataReader Is Nothing) Then
                    jptCommand.Cancel()
                    jptDataReader.Close()
                End If

                If (jptConn.State = System.Data.ConnectionState.Open) Then
                    jptConn.Close()
                    jptConn.Dispose()
                End If
            End Try
        Catch ex As Exception
            Response.Write("<Script language='JavaScript'>alert('" & ex.Message & "888');</Script>")
        End Try
    End Sub
End Class
