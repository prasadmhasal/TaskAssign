<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="dashbord.aspx.cs" Inherits="TaskAssign.Admin.dashbord1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        canvas {
            max-width: 100%;
            height:200px;
        }
        .flex {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto
        }

        @media (max-width:991.98px) {
            .padding1 {
                padding: 1.5rem
            }
        }

        @media (max-width:767.98px) {
            .padding1 {
                padding: 1rem
            }
        }

     
        .order-card {
            /* background:#FAFAFA; */
            color: #fff;
        }

        .bg-c-blue {
            background: linear-gradient(to bottom right, rgba(255, 0, 0, 0.3), rgba(0, 0, 255, 0.3))
        }

        .bg-c-green {
            background: linear-gradient( to bottom right,#fcdf8a, #f38381);
        }

        .bg-c-yellow {
            background: linear-gradient( to bottom right,#f2d50f, #da0641);
        }

        .bg-c-pink {
            background: linear-gradient(to bottom right, #fad961, #f76b1c);
        }


        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            border: none;
            margin-bottom: 30px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

            .card .card-block {
                padding: 25px;
            }

        .order-card i {
            font-size: 26px;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-md-3 col-xl-3 mb-4">
                <div class="card bg-c-blue order-card">
                    <div class="card-block">
                        <h6 class="m-b-20">Sells</h6>
                        <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span>
                           </span></h2>
                        <p class="m-b-0">Sells<span class="f-right"><asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></span></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-xl-3 mb-4">
                <div class="card bg-c-green order-card">
                    <div class="card-block">
                        <h6 class="m-b-20">Orders Placed</h6>
                        <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span></h2>
                        <p class="m-b-0">Orders Placed<span class="f-right"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-xl-3 mb-4">
                <div class="card bg-c-yellow order-card">
                    <div class="card-block">
                        <h6 class="m-b-20">Course Count</h6>
                        <h2 class="text-right"><i class="fa fa-refresh f-left"></i><span>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></h2>
                        <p class="m-b-0">Course Count<span class="f-right"> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></span></p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3 col-xl-3 mb-4">
                <div class="card bg-c-pink order-card">
                    <div class="card-block">
                        <h6 class="m-b-20">User Account</h6>
                        <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></span></h2>
                        <p class="m-b-0">User Account<span class="f-right"><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></span></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content page-container container-fluid" id="page-content">
            <div class="padding1 w-100">
                <div class="row">
                    <div class="container-fluid d-flex justify-content-center">
                        <div class="col-sm-12 col-md-10 col-lg-8 col-xl-6 w-100">
                            <div class="card1">
                                <div class="card-header card-header1">Student chart</div>
                                <div class="card-body">
                                    <canvas id="myPolarAreaChart" class="chartjs-render-monitor"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

               
    <script>
        $(document).ready(function() {
            const data = {
                labels: ['Red', 'Green', 'Yellow', 'Grey', 'Blue'],
                datasets: [{
                    label: 'My First Dataset',
                    data: [11, 16, 7, 3, 14],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(75, 192, 192)',
                        'rgb(255, 205, 86)',
                        'rgb(201, 203, 207)',
                        'rgb(54, 162, 235)'
                    ],
                    borderColor: 'rgba(0, 0, 0, 0.2)',
                    borderWidth: 1
                }]
            };

            const config = {
                type: 'polarArea',
                data: data,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                           
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.label + ': ' + tooltipItem.raw;
                                }
                            }
                        }
                    }
                }
            };

            const ctx = document.getElementById('myPolarAreaChart').getContext('2d');
            new Chart(ctx, config);
        });
    </script>


</asp:Content>
