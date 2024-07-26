<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resgistration.aspx.cs" Inherits="TaskAssign.Login.Resgistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        /*.signup-form {
    background: #fff;
    padding: 40px 60px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}*/

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1AnmZUF9siQK0XScQiiml1rkMheV4IR5lkkp7Q/yyzWn5aQo8E" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../component/css/material-design-iconic-font.min.css"/>
     <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="../component/css/style.css"/>
    
</head>
<body>
   <form id="form1" runat="server">
    <div class="signup">
       <asp:ScriptManager runat="server" />
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>

                        <div class="form-group">
                            <label for="name">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg></label>
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" Placeholder="Your Name" />
                        </div>
                        <div class="form-group">
                            <label for="email">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg></label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" Placeholder="Your Email" TextMode="Email" />
                        </div>
                        <div class="form-group">
                            <label for="email">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg></label>
                            <%--<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" Placeholder="Your Email" TextMode="Email" />--%>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"  />
                        </div>
                        <div class="form-group">
                            <label for="email">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg></label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem Text="--select batch--" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="Batch1" Value="Batch1"></asp:ListItem>
                                <asp:ListItem Text="Batch2" Value="Batch2"></asp:ListItem>
                                <asp:ListItem Text="Batch3" Value="Batch3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="your_pass">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
                                </svg>
                            </label>
                            <asp:TextBox runat="server" ID="Pass" CssClass="form-control" Placeholder="Password" TextMode="Password" />
                        </div>
                        <div class="form-group">
                            <label for="your_pass">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
                                </svg>
                            </label>
                            <asp:TextBox runat="server" ID="RePass" CssClass="form-control" Placeholder="Repeat your password" TextMode="Password" />
                        </div>
                        <div class="form-group">
                            <asp:CheckBox runat="server" ID="AgreeTerm" CssClass="form-check" />
                            <label for="AgreeTerm" class="form-check-label">
                                I agree all statements in <a href="#" class="term-service">Terms of service</a>
                            </label>
                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" ID="Signup" CssClass="form-submit" Text="Register" OnClick="Signup_Click" />
                        </div>

                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="../component/pic/signup-image.jpg" alt="sign up image" />
                        </figure>
                        <a href="#"></a>
                        <asp:HyperLink ID="HyperLink1" class="signup-image-link" runat="server" NavigateUrl="~/Login/login.aspx">I am already a member</asp:HyperLink>
                    </div>
                </div>
            </div>
        
    </div>
</form>


</body>
</html>
