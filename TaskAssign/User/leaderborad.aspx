<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="leaderborad.aspx.cs" Inherits="TaskAssign.User.leaderborad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500&display=swap" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com"  />
    <style>
       * {
  font-size: 62, 5%;
  box-sizing: border-box;
  margin: 0;
}
       main{
           padding-top:20px;
       }

body {
  height: 100%;
  width: 100%;

  background-color: #fbfaff;
  display: flex;
  align-items: center;
  justify-content: center;
}

main {
  width: 40rem;
  height: 43rem;
  background-color: #ffffff;
  -webkit-box-shadow: 0px 5px 15px 8px #e4e7fb;
  box-shadow: 0px 5px 15px 8px #e4e7fb;
  display: flex;
  flex-direction: column;
  align-items: center;
  border-radius: 0.5rem;
}

#header {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 2.5rem 2rem;
}

.share {
  width: 4.5rem;
  height: 3rem;
  background-color: #f55e77;
  border: 0;
  border-bottom: 0.2rem solid #c0506a;
  border-radius: 2rem;
  cursor: pointer;
}

.share:active {
  border-bottom: 0;
}

.share i {
  color: #fff;
  font-size: 2rem;
}

h1 {
  font-family: "Rubik", sans-serif;
  font-size: 1.7rem;
  color: #141a39;
  text-transform: uppercase;
  cursor: default;
}

#leaderboard {
  width: 100%;
  position: relative;
}

table {
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
  color: #141a39;
  cursor: default;
}

tr {
  transition: all 0.2s ease-in-out;
  border-radius: 0.2rem;
}

tr:not(:first-child):hover {
  background-color: #fff;
  transform: scale(1.1);
  -webkit-box-shadow: 0px 5px 15px 8px #e4e7fb;
  box-shadow: 0px 5px 15px 8px #e4e7fb;
}

tr:nth-child(odd) {
  background-color: #f9f9f9;
}

tr:nth-child(1) {
  color: #fff;
}

td {
  height: 5rem;
  font-family: "Rubik", sans-serif;
  font-size: 1.4rem;
  padding: 1rem 2rem;
  position: relative;
}

.number {
  width: 1rem;
  font-size: 2.2rem;
  font-weight: bold;
  text-align: left;
}

.name {
  text-align: left;
  font-size: 1.2rem;
}

.points {
  font-weight: bold;
  font-size: 1.3rem;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.points:first-child {
  width: 10rem;
}

.gold-medal {
  height: 3rem;
  margin-left: 1.5rem;
}

.ribbon {
  width: 42rem;
  height: 5.5rem;
  top: 3rem;
  background-color: #5c5be5;
  position: absolute;
  left: -1rem;
  -webkit-box-shadow: 0px 15px 11px -6px #7a7a7d;
  box-shadow: 0px 15px 11px -6px #7a7a7d;
}

.ribbon::before {
  content: "";
  height: 1.5rem;
  width: 1.5rem;
  bottom: -0.8rem;
  left: 0.35rem;
  transform: rotate(45deg);
  background-color: #5c5be5;
  position: absolute;
  z-index: -1;
}

.ribbon::after {
  content: "";
  height: 1.5rem;
  width: 1.5rem;
  bottom: -0.8rem;
  right: 0.35rem;
  transform: rotate(45deg);
  background-color: #5c5be5;
  position: absolute;
  z-index: -1;
}

#buttons {
  width: 100%;
  margin-top: 3rem;
  display: flex;
  justify-content: center;
  gap: 2rem;
}

.exit {
  width: 11rem;
  height: 3rem;
  font-family: "Rubik", sans-serif;
  font-size: 1.3rem;
  text-transform: uppercase;
  color: #7e7f86;
  border: 0;
  background-color: #fff;
  border-radius: 2rem;
  cursor: pointer;
}

.exit:hover {
  border: 0.1rem solid #5c5be5;
}

.continue {
  width: 11rem;
  height: 3rem;
  font-family: "Rubik", sans-serif;
  font-size: 1.3rem;
  color: #fff;
  text-transform: uppercase;
  background-color: #5c5be5;
  border: 0;
  border-bottom: 0.2rem solid #3838b8;
  border-radius: 2rem;
  cursor: pointer;
}

.continue:active {
  border-bottom: 0;
}

@media (max-width: 740px) {
    * {
      font-size: 70%;
    }
}

@media (max-width: 500px) {
    * {
      font-size: 55%;
    }
}

@media (max-width: 390px) {
    * {
      font-size: 45%;
    }
}
.grid-header {
    background-color: #5c5be5; 
    color: #fff; 
    font-weight: bold;
}
.gold-medal {
    height: 2rem; 
    margin-left: 1rem;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div id="header">
            <h1>Ranking</h1>
            <button class="share">
                <i class="ph ph-share-network"></i>
            </button>
        </div>
        <div id="leaderboard">
            <div class="ribbon"></div>
           <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Rank" HeaderText="#" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:TemplateField HeaderText="Points">
                    <ItemTemplate>
                        <asp:Label ID="lblPoints" runat="server" Text='<%# Eval("Points") %>' />
                       <asp:Image ID="imgMedal" runat="server" 
           ImageUrl="~/image/gold-medal.png" 
           AlternateText="gold medal" 
           CssClass="gold-medal" 
           Visible='<%# Convert.ToInt32(Eval("Rank")) == 1 %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
     
</asp:Content>
