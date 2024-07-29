<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="userdashbord.aspx.cs" Inherits="TaskAssign.User.userdashbord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <style>
  /* Container styling */
.container {
    
    padding:20px;
}

/* Card styling */
.card {
    position: relative;
    border: none;
    overflow: hidden;
    border-radius: 10px;
}

/* Image styling */
.card-img {
    width: 100%;
    height: auto;
    object-fit: cover;
    opacity: 0.8;
}

/* Card overlay styling */
.card-img-overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
   
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    width: 100%; /* Ensures the overlay covers the entire card */
    height: 100%; /* Ensures the overlay covers the entire card */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

/* Card title styling */
.card-title {
    font-size: 1.5rem;
    font-weight: bold;
}

/* Card text styling */
.card-text {
    font-size: 1rem;
    margin-top: 10px;
}

.card-text:last-child {
    margin-top: 20px;
    font-size: 0.85rem;
    color: #dcdcdc;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="card bg-dark text-white">
            
            <asp:Image ID="Image1" runat="server"  class="card-img" ImageUrl="~/image/studentbanner.jpg" />  
            <div class="card-img-overlay">
                <h5 class="card-title ">Welcome To Student Portal</h5>
                <p class="card-text">Your gateway to educational resources and support.</p>
                <p class="card-text">Last updated 3 mins ago</p>
            </div>
        </div>

    </div>

</div>
</asp:Content>
