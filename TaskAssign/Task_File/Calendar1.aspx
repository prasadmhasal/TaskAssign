<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar1.aspx.cs" Inherits="Calendar1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        .event {
            background-color: #f0f0f0;
            padding: 5px;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <div>
            <h1>Add Event</h1>
            <div>
                <asp:DropDownList ID="ddlEventTypes" runat="server">
                    <asp:ListItem Text="Holiday" Value="Holiday"></asp:ListItem>
                    <asp:ListItem Text="Birthday" Value="Birthday"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtEventDate" runat="server" placeholder="MM/dd/yyyy"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtEventDate" ErrorMessage="*" ValidationGroup="AddEventValidation"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEventDate" ErrorMessage="Invalid date format. Please enter date in MM/dd/yyyy format." 
                    ValidationExpression="^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/(19|20)\d\d$" ValidationGroup="AddEventValidation"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox ID="txtEventDescription" runat="server" TextMode="MultiLine" Rows="3" placeholder="Event Description"></asp:TextBox>
                <br />
                <asp:Button ID="btnAddEvent" runat="server" Text="Add Event" OnClick="btnAddEvent_Click" ValidationGroup="AddEventValidation" />
                 <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>


               <asp:GridView ID="GridViewEvents" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID"
                OnRowDeleting="GridViewEvents_RowDeleting" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="EventID" HeaderText="Event ID" ReadOnly="True" />
                    <asp:BoundField DataField="EventType" HeaderText="Event Type" />
                    <asp:BoundField DataField="EventDate" HeaderText="Event Date" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="EventDescription" HeaderText="Event Description" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" HeaderText="Actions" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
