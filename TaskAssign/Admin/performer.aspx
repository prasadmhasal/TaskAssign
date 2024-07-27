<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="performer.aspx.cs" Inherits="TaskAssign.Admin.performer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row mx-0 justify-content-center">
                <div class="col-lg-12">
                    <div class="section-title text-center position-relative mb-5 d-flex">
                        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control mx-3"></asp:TextBox>
                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control mx-3"></asp:TextBox>
                        <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control mx-3" ></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="Fetch Data" OnClick="btnFetchData_Click"  CssClass="btn btn-primary mx-3" />
                        <asp:Button ID="Button1" runat="server" Text="Push" OnClick="push"  CssClass="btn btn-primary mx-3" />
                    </div>
                    <asp:DataList ID="dlCards" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CellPadding="15">
                        <ItemTemplate>
                            <div class="card shadow rounded" style="width: 20rem; margin: 20px;">

                                <img class="card-img-top" src='<%# Eval("ProfileImageUrl") %>' alt="Course image" width="250" height="200">
                                <div class="card-body">
                                    <p class="card-text"><strong>Username:</strong>  <%# Eval("Name") %></p>
                                    <p class="card-text"><strong>Score:</strong> <%# Eval("Points") %></p>
                                    <p class="card-text"><strong>Rank:</strong> <%# Eval("Rank") %></p>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
