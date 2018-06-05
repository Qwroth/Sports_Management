<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EventManagement.aspx.vb" Inherits="SportsManagementSystem.EventManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {}
        #form1 {
            text-align: left;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="font-size: xx-large">
    
        Events Management</div>
        <asp:AccessDataSource ID="GameList" runat="server" DataFile="App_Data\OlympicData.accdb" DeleteCommand="DELETE FROM `Games` WHERE `Game_ID` = ?" InsertCommand="INSERT INTO `Games` (`Game_ID`, `Game_Code`, `Game_Name`, `Game_DurationInHours`, `Game_Description`, `Game_RuleBooklet`) VALUES (?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `Game_ID`, `Game_Code`, `Game_Name`, `Game_DurationInHours`, `Game_Description`, `Game_RuleBooklet` FROM `Games`" UpdateCommand="UPDATE `Games` SET `Game_Code` = ?, `Game_Name` = ?, `Game_DurationInHours` = ?, `Game_Description` = ?, `Game_RuleBooklet` = ? WHERE `Game_ID` = ?">
            <DeleteParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RuleBooklet" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RuleBooklet" Type="String" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0066FF" NavigateUrl="~/EventsPage.aspx">Back</asp:HyperLink>
        </p>
        <p style="text-align: left">
            Game:
            <asp:DropDownList ID="Game" runat="server" DataSourceID="GameList" DataTextField="Game_Name" DataValueField="Game_ID">
            </asp:DropDownList>
        </p>
        <p style="text-align: left">
            Feature Event :<asp:TextBox ID="FeatureEvent" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            Venu:
            <asp:TextBox ID="Venu" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            Event Date:
            <asp:Calendar ID="EventDate" runat="server"></asp:Calendar>
        </p>
        <p style="text-align: left">
            Start Time:
            <asp:TextBox ID="StartTime" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            End Time:
            <asp:TextBox ID="EndTime" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            Description<asp:TextBox ID="Description" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            World Record<asp:TextBox ID="WorldRecord" runat="server"></asp:TextBox>
        </p>
        <p style="text-align: left">
            <asp:Button ID="CreateEventButton" runat="server" Text="Create Event" />
        </p>
        <asp:SqlDataSource ID="CreateEvent" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\OlympicData.accdb;Persist Security Info=True" InsertCommand="Insert into Events (Game_ID, FeatureEvent, EventVenu, EventDate, EventStartTime, EventEndTime, EventDescription, WorldRecord) Values (@Game, @Feature, @Venu, @Date, @Start, @End, @Description, @Record)" ProviderName="System.Data.OleDb">
            <InsertParameters>
                <asp:ControlParameter ControlID="Game" Name="Game" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FeatureEvent" Name="Feature" PropertyName="Text" />
                <asp:ControlParameter ControlID="Venu" Name="Venu" PropertyName="Text" />
                <asp:ControlParameter ControlID="EventDate" Name="Date" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="StartTime" Name="Start" PropertyName="Text" />
                <asp:ControlParameter ControlID="EndTime" Name="End" PropertyName="Text" />
                <asp:ControlParameter ControlID="Description" Name="Description" PropertyName="Text" />
                <asp:ControlParameter ControlID="WorldRecord" Name="Record" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Event_ID" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" ReadOnly="True" SortExpression="Event_ID" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                <asp:BoundField DataField="FeatureEvent" HeaderText="FeatureEvent" SortExpression="FeatureEvent" />
                <asp:BoundField DataField="EventVenu" HeaderText="EventVenu" SortExpression="EventVenu" />
                <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
                <asp:BoundField DataField="EventEndTime" HeaderText="EventEndTime" SortExpression="EventEndTime" />
                <asp:BoundField DataField="EventDescription" HeaderText="EventDescription" SortExpression="EventDescription" />
                <asp:BoundField DataField="WorldRecord" HeaderText="WorldRecord" SortExpression="WorldRecord" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Events]"></asp:AccessDataSource>
        <p class="auto-style1" style="text-align: left">
            Create Event Record
        </p>
        <p class="auto-style1" style="text-align: left">
            Event ID&nbsp;&nbsp; <asp:TextBox ID="EventIDRecord" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1" style="text-align: left">
            Competitor ID&nbsp;&nbsp; <asp:TextBox ID="COmpetitorIDRecord" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1" style="text-align: left">
            Position&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="Position" runat="server">
                <asp:ListItem>1st</asp:ListItem>
                <asp:ListItem>2nd</asp:ListItem>
                <asp:ListItem>3rd</asp:ListItem>
                <asp:ListItem>4th</asp:ListItem>
                <asp:ListItem>5th</asp:ListItem>
                <asp:ListItem>6th</asp:ListItem>
                <asp:ListItem>7th</asp:ListItem>
                <asp:ListItem>8th</asp:ListItem>
                <asp:ListItem>91th</asp:ListItem>
                <asp:ListItem>10th</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p class="auto-style1" style="text-align: left">
            Medal&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="Medal" runat="server">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Gold</asp:ListItem>
                <asp:ListItem>Silver</asp:ListItem>
                <asp:ListItem>Bronze</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p class="auto-style1" style="text-align: left">
            <asp:Button ID="AddRecordButton" runat="server" Text="Create" />
        </p>
        <asp:SqlDataSource ID="AddRecord" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="Insert Into Records (Event_ID, Competitor_ID, Competitor_Position, COmpetitor_Medal) values (@Event, @Comp, @Position, @Medal)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Records]">
            <InsertParameters>
                <asp:ControlParameter ControlID="EventIDRecord" Name="Event" PropertyName="Text" />
                <asp:ControlParameter ControlID="COmpetitorIDRecord" Name="Comp" PropertyName="Text" />
                <asp:ControlParameter ControlID="Position" Name="Position" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="Medal" Name="Medal" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:AccessDataSource ID="PositionList" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT [Competitor_Position] FROM [Records]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="MedalList" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT [COmpetitor_Medal] FROM [Records]"></asp:AccessDataSource>
        <br />
        <br />
        ADD PHOTO<br />
        <br />
        Event Photo :
        <asp:FileUpload ID="PhotoUpload" runat="server" />
        <br />
        <br />
        Tags: <asp:TextBox ID="Tags" runat="server"></asp:TextBox>
        <br />
        <br />
        Event ID:
        <asp:TextBox ID="PhotoEventID" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="AddPhotoButton" runat="server" Text="Add Photo" />
        </p>
        <asp:SqlDataSource ID="AddPhoto" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\OlympicData.accdb;Persist Security Info=True" InsertCommand="Insert into Photos (Event_Photo, Event_PhotoTags, Event_ID) values (@Photo, @Tags, @EventID)" ProviderName="System.Data.OleDb">
            <InsertParameters>
                <asp:ControlParameter ControlID="Photo" Name="Photo" PropertyName="Text" />
                <asp:ControlParameter ControlID="Tags" Name="Tags" PropertyName="Text" />
                <asp:ControlParameter ControlID="PhotoEventID" Name="EventID" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Photo" runat="server" Text="Photo File name" Visible="False"></asp:Label>
    </form>
</body>
</html>
