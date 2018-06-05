Public Class AdminPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CompetitorsButton_Click(sender As Object, e As EventArgs) Handles CompetitorsButton.Click
        Response.Redirect("CompetitorsManagement.aspx")
    End Sub

    Protected Sub EventsButton_Click(sender As Object, e As EventArgs) Handles GamesButton.Click
        Response.Redirect("GamesManagement.aspx")
    End Sub
End Class