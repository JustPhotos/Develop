
Partial Class Personal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '判斷是否登入(有> id? || 無>導向Default.aspx)
        '
    End Sub

    Private Sub UserData(userID As Integer)
        Dim myConn As System.Data.SqlClient.SqlConnection
        myConn = New Data.SqlClient.SqlConnection
        Dim strConn As String = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()
        myConn.ConnectionString = strConn

        Dim myCommand As System.Data.SqlClient.SqlCommand
        myCommand = New System.Data.SqlClient.SqlCommand
        myCommand.Connection = myConn
        myCommand.CommandType = Data.CommandType.StoredProcedure
        myCommand.CommandText = "sp_userInfo"

        myCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@userID", Data.SqlDbType.Int))

        myCommand.Parameters("@userID").Value = userID

        '--------還在尋找回傳的東西怎麼拿O"O 會回傳兩個name 和 headPicture
    End Sub

    Private Sub BindPhoto()
        Try
            Dim myConn As System.Data.SqlClient.SqlConnection
            myConn = New System.Data.SqlClient.SqlConnection
            Dim strConn As String = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()
            myConn.ConnectionString = strConn

            Dim myCommand As System.Data.SqlClient.SqlCommand
            myCommand = New System.Data.SqlClient.SqlCommand
            myCommand.Connection = myConn
            myCommand.CommandType = Data.CommandType.Text
            myCommand.CommandText = "select 10 from dbjpt_Photos order date"

            Dim dr As System.Data.SqlClient.SqlDataReader = Nothing

            Try
                myConn.Open()
                dr = myCommand.ExecuteReader

                While (dr.Read())
                    photo.ImageUrl = dr("photo").ToString
                    '--利用user去找userName和headPicture
                    Dim userID As Integer = dr("user")
                    UserData(userID)
                    photoName.Text = dr("name").ToString


                End While
            Catch ex As Exception
                '--Error Handling

            Finally
                If Not (dr Is Nothing) Then
                    myCommand.Cancel()
                    dr.Close()
                End If

                If (myConn.State = System.Data.ConnectionState.Open) Then
                    myConn.Close()
                    myConn.Dispose()
                End If
            End Try
        Catch ex As Exception
            '--Error Handling
        End Try
    End Sub


End Class
