<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="dashbord.aspx.cs" Inherits="TaskAssign.Admin.dashbord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .signup {
            width: 100%;
            padding: 50px 0;
            background: #f2f2f2;
        }

        .container {
            max-width: 1170px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .signup-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .signup-form, .signup-image {
            flex: 1;
            padding: 20px;
        }

        .signup-form {
    background: #fff;
    padding: 40px 60px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    border-radius:20px;
}

        .form-title {
            margin-bottom: 30px;
            font-size: 30px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

            .form-group label {
                position: absolute;
                top: 50%;
                left: 10px;
                transform: translateY(-50%);
                color: #333;
            }

            .form-group svg {
                position: absolute;
                top: 50%;
                left: 10px;
                transform: translateY(-50%);
                fill: #333;
            }

        .form-control {
            width: 100%;
            padding: 10px 20px;
            padding-left: 40px;
            border: 1px solid #ddd;
            border-radius: 25px;
            background: #f7f7f7;
            color: #333;
            transition: all 0.3s;
        }

            .form-control:focus {
                border-color: #333;
                background: #fff;
            }

        .form-check {
            display: inline-block;
            margin-right: 10px;
        }

        .form-check-label {
            display: inline-block;
            font-size: 14px;
            color: #333;
        }

        .term-service {
            color: #333;
            text-decoration: underline;
        }

        .form-submit {
            width: 100%;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            background: #333;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

            .form-submit:hover {
                background: #555;
            }

        .signup-image {
            text-align: center;
        }

            .signup-image figure {
                margin-bottom: 30px;
            }

            .signup-image img {
                max-width: 100%;
                height: auto;
            }

        .signup-image-link {
            color: #333;
            text-decoration: none;
            font-size: 16px;
            text-align: center;
            display: inline-block;
            margin-top: 20px;
        }

            .signup-image-link:hover {
                text-decoration: underline;
            }
    </style>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/multiselect/2.2.15/css/multi-select.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/multiselect/2.2.15/js/jquery.multi-select.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= ddlUser_name.ClientID %>').multiSelect({
                selectableHeader: "<input type='checkbox' id='selectAll' /> Select All",
                selectionHeader: "<div>Selected Users</div>"
            });

            $('#selectAll').on('click', function () {
                if (this.checked) {
                    $('#<%= ddlUser_name.ClientID %>').multiSelect('select_all');
                } else {
                    $('#<%= ddlUser_name.ClientID %>').multiSelect('deselect_all');
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Task Assign</h2>
                    <div class="form-group">
                        <label for="name">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                            </svg></label>
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" Placeholder="Task Name" />
                    </div>
                   
                   
                    <div class="form-group">
                        <label for="email">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                            </svg></label>
                        <asp:DropDownList ID="ddlbatch" runat="server" CssClass="form-control" AutoPostBack="True"  OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged" >
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label for="your_pass">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
                            </svg>
                        </label>
                        <asp:DropDownList ID="ddlUser_name" runat="server" CssClass="form-control"  AutoPostBack="True" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>   
                    <div class="form-group">
                        <label for="email">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                            </svg></label>
                        <%--<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" Placeholder="Your Email" TextMode="Email" />--%>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Placeholder="Attachment" />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" ID="Button" CssClass="form-submit" Text="Assign" OnClick="Button1_Click" />
                    </div>

                </div>
               
            </div>
        </div>
    
</div>
</asp:Content>
