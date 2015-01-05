
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        
        BindBlock()


    End Sub

    Private Sub BindBlock()
        Try
            Dim myConn As System.Data.SqlClient.SqlConnection
            myConn = New System.Data.SqlClient.SqlConnection
            Dim strConn As String = ConfigurationManager.ConnectionStrings("JustPhotoDBConStr").ConnectionString.ToString()
            myConn.ConnectionString = strConn

            Dim myCommand As System.Data.SqlClient.SqlCommand
            myCommand = New System.Data.SqlClient.SqlCommand
            myCommand.Connection = myConn
            myCommand.CommandType = Data.CommandType.Text
            myCommand.CommandText = "select top 10 from dbjpt_Photos"

            Dim myDreader As System.Data.SqlClient.SqlDataReader = Nothing

            Try
                myConn.Open()
                myDreader = myCommand.ExecuteReader
                If myDreader.Read Then
                    Dim _photoname As String = myDreader("name")
                    Dim _photoId As String = myDreader("ID")
                    Dim _user As Integer = myDreader("user")

                    photo.ImageUrl = _photoId
                    user.ImageUrl = Nothing 'undo==================
                    userName.Text = _user
                    photoName.Text = _photoname
                End If
            Catch ex As Exception
                '--Error Handling

            Finally
                If Not (myDreader Is Nothing) Then
                    myCommand.Cancel()
                    myDreader.Close()
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
