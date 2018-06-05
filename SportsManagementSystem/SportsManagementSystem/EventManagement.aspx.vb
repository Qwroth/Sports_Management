Public Class EventManagement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim time = (TimeOfDay)
        StartTime.Text = time

    End Sub

    Protected Sub CreateEventButton_Click(sender As Object, e As EventArgs) Handles CreateEventButton.Click
        CreateEvent.Insert()
        Response.Redirect("EventManagement.aspx")
    End Sub

    Protected Sub CreateEvent_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles CreateEvent.Selecting

    End Sub

    Protected Sub AddRecordButton_Click(sender As Object, e As EventArgs) Handles AddRecordButton.Click
        AddRecord.Insert()
    End Sub

    Protected Sub AddPhotoButton_Click(sender As Object, e As EventArgs) Handles AddPhotoButton.Click

        Photo.Text = PhotoUpload.FileName
        Dim strFileName = PhotoUpload.FileName
        PhotoUpload.SaveAs(Server.MapPath("Documents/" + strFileName))
        AddPhoto.Insert()
    End Sub
End Class