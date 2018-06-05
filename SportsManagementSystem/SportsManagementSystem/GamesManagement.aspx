<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GamesManagement.aspx.vb" Inherits="SportsManagementSystem.GamesManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; font-size: xx-large">
    
        Games Management<br />
        </div>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0066FF" NavigateUrl="~/AdminPage.aspx">Back</asp:HyperLink>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Game_ID" DataSourceID="GamesList" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Game_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Game_ID" />
                <asp:TemplateField HeaderText="Code" SortExpression="Game_Code">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" Text='<%# Bind("Game_Code") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="Code is either blank or already taken" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Format must be AAAA123" ForeColor="Red" ValidationExpression="([A-Z])([A-Z])([A-Z])([A-Z])(\d)(\d)(\d)"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Game_Code") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Game_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Game_Name") %>' ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Game_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Game_DurationInHours" HeaderText="Duration" SortExpression="Game_DurationInHours" />
                <asp:BoundField DataField="Game_Description" HeaderText="Description" SortExpression="Game_Description" />
                <asp:TemplateField HeaderText="Rule Booklet" SortExpression="Game_RuleBooklet">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Game_RuleBooklet") %>'></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" FileName='<%# Bind("Game_RuleBooklet") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Game_RuleBooklet") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="GamesList" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT [Game_ID], [Game_Code], [Game_Name], [Game_DurationInHours], [Game_Description], [Game_RuleBooklet] FROM [Games]" DeleteCommand="DELETE FROM [Games] WHERE [Game_ID] = ?" InsertCommand="INSERT INTO [Games] ([Game_ID], [Game_Code], [Game_Name], [Game_DurationInHours], [Game_Description], [Game_RuleBooklet]) VALUES (?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Games] SET [Game_Code] = ?, [Game_Name] = ?, [Game_DurationInHours] = ?, [Game_Description] = ?, [Game_RuleBooklet] = ? WHERE [Game_ID] = ?">
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
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <p>
            Code:
            <asp:TextBox ID="Code" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="CodeBlank" runat="server" ForeColor="Red" Text="Code must not be left blank" Visible="False"></asp:Label>
        </p>
        <p>
            Name:
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="NameBlank" runat="server" ForeColor="Red" Text="Name must not be left blank" Visible="False"></asp:Label>
        </p>
        <p>
            Hours:
           <asp:TextBox ID="Hours" runat="server"></asp:TextBox>
        </p>
        <p>
            Description:
Description:
            <asp:TextBox ID="Description" runat="server" Width="537px"></asp:TextBox>
        </p>
        <p>
            Rule Booklet&nbsp;&nbsp;
            <asp:FileUpload ID="RuleBookUpload" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="fileBlank" runat="server" ForeColor="Red" Text="Must upload rulebook" Visible="False"></asp:Label>
        </p>
        <asp:Button ID="AddGameButton" runat="server" Text="Add Game" />
        <asp:SqlDataSource ID="AddGame" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="Insert Into Games (Game_Code, Game_Name, Game_DurationInHours, Game_Description, Game_RuleBooklet) Values (@Code, @Name, @Hours, @Description, @RuleBooklet)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Games]">
            <InsertParameters>
                <asp:ControlParameter ControlID="Code" Name="Code" PropertyName="Text" />
                <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="Hours" Name="Hours" PropertyName="Text" />
                <asp:ControlParameter ControlID="Description" Name="Description" PropertyName="Text" />
                <asp:ControlParameter ControlID="RuleBookletName" Name="RuleBooklet" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Label ID="gameExists" runat="server" ForeColor="Red" Text="Game already exists" Visible="False"></asp:Label>
        <p>
            <asp:Label ID="RuleBookletName" runat="server" Text="File Name" Visible="False"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
