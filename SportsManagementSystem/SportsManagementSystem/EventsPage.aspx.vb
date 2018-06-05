Public Class EventsPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EventsButton_Click(sender As Object, e As EventArgs) Handles EventsButton.Click
        Response.Redirect("EventsManagement.aspx")
    End Sub

    

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles EventRecord.TextChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim context As HttpContext = HttpContext.Current

        context.Items.Add("EventSearch", EventRecord.Text)


        Server.Transfer("ReportsManagement.aspx", True)
    End Sub
End Class