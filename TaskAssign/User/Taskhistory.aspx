<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Taskhistory.aspx.cs" Inherits="TaskAssign.User.Taskhistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
    .d-none {
        display: none;
    }

    .pagination {
        display: flex;
        justify-content: center;
        padding: 10px;
    }

        .pagination a, .pagination span {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            color: #007bff;
            text-decoration: none;
        }

            .pagination a:hover, .pagination span:hover {
                background-color: #007bff;
                color: #fff;
            }

        .pagination .active span {
            background-color: #007bff;
            color: #fff;
            border: 1px solid #007bff;
        }

    .card {
        margin-top: 20px;
        border: 1px solid rgba(0, 0, 0, 0.125);
        border-radius: 0.25rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }

    .card-header {
        padding: 0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #007bff;
        border-bottom: 1px solid rgba(0, 0, 0, 0.125);
        color: #fff;
    }

    .card-body {
        padding: 1.25rem;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        background-color: transparent;
        border-collapse: collapse;
    }

    .table-bordered {
        border: 1px solid #dee2e6;
    }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #dee2e6;
            padding: 0.75rem;
            vertical-align: top;
        }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        user-select: none;
        background-color: #28a745;
        border: 1px solid transparent;
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        line-height: 1.5;
        border-radius: 0.25rem;
        transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        cursor: pointer;
        text-decoration: none;
    }

    .btn-success {
        color: #fff;
        background-color: #28a745;
        border-color: #28a745;
    }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

    .btn-danger {
        color: #fff;
        background-color: #dc3545;
        border-color: #dc3545;
    }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        
.grid-view-container {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

.grid-view-container th, .grid-view-container td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.grid-view-container th {
    background-color: #f2f2f2;
    color: #333;
    font-weight: bold;
}

.grid-view-container tr:nth-child(even) {
    background-color: #f9f9f9;
}

.grid-view-container tr:hover {
    background-color: #f1f1f1;
}

.grid-view-container .grid-view-header {
    background-color: #4CAF50;
    color: white;
    text-align: center;
}
.grid-view-container tr:nth-child(even) {
    background-color: #f9f9f9;
}
.grid-view-container tr:hover {
    background-color: #f1f1f1;
}
.grid-view-container th {
    background-color: #4CAF50;
    color: white;
    text-align: center;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 overflow-scroll">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Task History LIst
                </div>
                <div class="card-body">
                    <asp:DropDownList ID="PeriodDropdown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="PeriodDropdown_SelectedIndexChanged">
                        <asp:ListItem Text="Daily" Value="Daily" />
                        <asp:ListItem Text="Weekly" Value="Weekly" />
                        <asp:ListItem Text="Monthly" Value="Monthly" />
                        <asp:ListItem Text="Yearly" Value="Yearly" />
                    </asp:DropDownList>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid-view-container">
                        <Columns>
                            <asp:BoundField DataField="Task_id" HeaderText="Task ID" />
                            <asp:BoundField DataField="Task_name" HeaderText="Task Name" />
                            <asp:BoundField DataField="Task_status" HeaderText="Task Status" />
                            <asp:BoundField DataField="Tasksubmit_date" HeaderText="Task Submit Date" />
                            <asp:BoundField DataField="Task_date" HeaderText="Task Date" />
                            <asp:BoundField DataField="Task_Score" HeaderText="Task Score" />
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
