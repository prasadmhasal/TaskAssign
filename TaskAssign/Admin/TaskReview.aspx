<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TaskReview.aspx.cs" Inherits="TaskAssign.Admin.TaskReview" %>
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
    width: 100vw;
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
    <div class="row">
        <div class="col-lg-12 ">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Task List
                </div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Task_id" OnRowCommand="GridView_RowCommand" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                        <Columns>
                            <asp:BoundField DataField="Task_id" HeaderText="Task_id" SortExpression="Task_id" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Task_name" HeaderText="Task_name" SortExpression="Task_name" />
                            <asp:BoundField DataField="Task_User" HeaderText="Task_User" SortExpression="Task_User" />
                            <asp:TemplateField HeaderText="Task solution">
                                <ItemTemplate>
                                    <asp:Button ID="DownloadButton" runat="server" Text="Download" CommandName="DownloadFile" CommandArgument='<%# Eval("Task_solution") %>' CssClass="btn btn-sm btn-success" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Task_status" HeaderText="Task_status" SortExpression="Task_status" />
                            <asp:BoundField DataField="Tasksubmit_date" HeaderText="Tasksubmit_date" SortExpression="Tasksubmit_date" />
                            <asp:BoundField DataField="Task_date" HeaderText="Task_date" SortExpression="Task_date" />
                            <asp:TemplateField HeaderText="Task Feedback">
                                <ItemTemplate>
                                    <asp:TextBox ID="Task_Feedback" runat="server" Text='' TextMode="MultiLine" Rows="3" CssClass="form-control" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Task Score">
                                <ItemTemplate>
                                    <asp:TextBox ID="Task_score" runat="server" Text='' CssClass="form-control" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div style="display: flex;">
                                        <asp:Button ID="Reject_Task" runat="server" Text="Reject" CssClass="btn btn-danger mt-3" CommandName="Reject_Task" CommandArgument='<%# Container.DataItemIndex %>' />
                                        <asp:Button ID="Approve_Task" runat="server" Text="Approve" CssClass="btn btn-success mt-3" CommandName="Approve_Task" CommandArgument='<%# Container.DataItemIndex %>' />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>




 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Task %>"  SelectCommand="SELECT [Task_id], [Task_name], [Task_User], [Task_solution], [Task_status], [Tasksubmit_date], [Task_date] FROM [Task] where [Task_solution] is not null">
    
</asp:SqlDataSource>
   

</asp:Content>
