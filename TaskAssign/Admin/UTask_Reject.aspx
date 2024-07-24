<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UTask_Reject.aspx.cs" Inherits="TaskAssign.Admin.UTask_Reject" %>
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


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-5 overflow-scroll">
     <div class="row">
         <div class="col-lg-12">
             <div class="card">
                 <div class="card-header bg-primary text-white">
                     Task LIst
                 </div>
                 <div class="card-body">
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="Task_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                         <Columns>
                             <asp:BoundField DataField="Task_review_id" HeaderText="Task_review_id" ItemStyle-CssClass="font-weight-bold" InsertVisible="true" />
                             <asp:BoundField DataField="Task_id" HeaderText="Task ID" ItemStyle-CssClass="font-weight-bold" />
                             <asp:BoundField DataField="Task_name" HeaderText="Task Name" />
                              
                             <asp:BoundField DataField="Task_feedback" HeaderText="Task_feedback" />

                            
                             <asp:TemplateField HeaderText="Task Resolution">
                                 <ItemTemplate>
                                     <asp:Button ID="DownloadButton" runat="server" Text="Download" CommandName="DownloadFile" CommandArgument='<%# Eval("Task_solution") %>' CssClass="btn btn-sm btn-success" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:BoundField DataField="Taskapprove_status" HeaderText="Taskapprove_status" />
                             <asp:TemplateField HeaderText="Task Score">
                                 <ItemTemplate>
                                     <asp:TextBox ID="Task_score" runat="server" Text=''  CssClass="form-control" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Actions">
                                 <ItemTemplate>
                                     <asp:Button ID="Submit" runat="server" Text="Submit" CommandName="Submit" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-sm btn-success gridview-button"  />
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>

                     </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Task %>"  SelectCommand="SELECT * FROM [Task_review] WHERE ([Task_User] = @Task_User) AND [Taskapprove_status] = 'Resubmit'">
                         <SelectParameters>
                             <asp:SessionParameter Name="Task_User" SessionField="User_name" Type="String" />

                         </SelectParameters>
                     </asp:SqlDataSource>




                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
