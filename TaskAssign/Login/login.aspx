<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TaskAssign.Login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1AnmZUF9siQK0XScQiiml1rkMheV4IR5lkkp7Q/yyzWn5aQo8E" crossorigin="anonymous"/>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../component/css/material-design-iconic-font.min.css"/>

    <!-- Main css -->
    <link rel="stylesheet" href="../component/css/style.css"/>
</head>
<body>
  <form id="form1" runat="server">
        <div class="container mt-5 mb-5">
            <!-- Sign In Form -->
            <section class="sign-in">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure>
                            <img src="../component/pic/signin-image.jpg" alt="sign in image" />
                        </figure>
                         <asp:HyperLink ID="HyperLink1" CssClass=" signup-image-link" runat="server" NavigateUrl="~/Login/Resgistration.aspx">Create an account</asp:HyperLink>
                    </div>
                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <div class="form-group">
                            <label for="your_name">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                </svg>
                            </label>
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="your_pass">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
                                    <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
                                </svg>
                            </label>
                            <asp:TextBox ID="Pass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:CheckBox ID="remember_me" runat="server" CssClass="agree-term" />
                            <label for="remember_me" class="label-agree-term"><span><span></span></span>Remember me</label>
                        </div>
                        <div class="form-group ">
                            <asp:Button ID="Button1" runat="server" style="cursor:pointer;" Text="Log in" CssClass="btn btn-primary" OnClick="Button1_Click" />
                        </div>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li>
                                    <a href="#">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951" />
                                        </svg>
                                    </a>
                                </li>
                                <li><a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="skyblue" class="bi bi-twitter" viewBox="0 0 16 16">
                                        <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334q.002-.211-.006-.422A6.7 6.7 0 0 0 16 3.542a6.7 6.7 0 0 1-1.889.518 3.3 3.3 0 0 0 1.447-1.817 6.5 6.5 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.32 9.32 0 0 1-6.767-3.429 3.29 3.29 0 0 0 1.018 4.382A3.3 3.3 0 0 1 .64 6.575v.045a3.29 3.29 0 0 0 2.632 3.218 3.2 3.2 0 0 1-.865.115 3 3 0 0 1-.614-.057 3.28 3.28 0 0 0 3.067 2.277A6.6 6.6 0 0 1 .78 13.58a6 6 0 0 1-.78-.045A9.34 9.34 0 0 0 5.026 15" />
                                    </svg></a></li>
                                <li><a href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="ranbow" class="bi bi-google" viewBox="0 0 16 16">
                                        <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z" />
                                    </svg></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>

       <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
   
</body>
</html>
