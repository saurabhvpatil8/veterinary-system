<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Veterinary_System.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <title>Sign Up</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet" />
    <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />


    <%--<script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>--%>
</head>
<body>
    <form role="form" runat="server">
        <main class="main-content  mt-0">
            <section>
                <div class="page-header min-vh-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
                                <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style="background-image: url('../assets/img/illustrations/illustration-signup.jpg'); background-size: cover;">
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
                                <div class="card card-plain">
                                    <div class="card-header">
                                        <h4 class="font-weight-bolder">Sign Up</h4>
                                        <p class="mb-0">Enter your name, email and password to register</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Name</label>
                                            <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Email</label>
                                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Password</label>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="input-group input-group-outline mb-3">

                                            <asp:DropDownList ID="drpLstUserType" class="form-control border-1" name="choice-button" runat="server">
                                                <asp:ListItem>Doctor</asp:ListItem>
                                                <asp:ListItem>User</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div id="hospital_name_group" class="input-group input-group-outline mb-3">
                                            <label class="form-label">Hospital Name</label>
                                            <asp:TextBox ID="txtHospitalName" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="text-center">
                                            <%--                                            <button class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" data-bs-target="#exampleModalForm"
                                                data-bs-toggle="modal" id="btnSignUp">Sign Up</button>--%>
                                            <asp:Button ID="btnSignUp" runat="server" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" 
                                                Text="Sign Up" OnClientClick="return isValid();" OnClick="btnSignUp_Click"/>

                                            <%--                                            <button type="button" id="btn_sign_up" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0"
                                                data-bs-toggle="modal">
                                                Sign Up</button>--%>
                                            <%--class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" OnClientClick="CheckIsDoctor(); return true;" OnClick="btnSignUp_Click" />--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                                    <p class="mb-2 text-sm mx-auto">
                                        Already have an account?
                                        <a href="SignIn.aspx" class="text-primary text-gradient font-weight-bold">Sign in</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%--  --%>


    </form>


    <%--  --%>
    <!--   Core JS Files   -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="./assets/js/plugins/choices.min.js"></script>
    <script>
        //if (document.getElementById("drpLstUserType")) {
        //    var element = document.getElementById("drpLstUserType");
        //    const example = new Choices(element, {});
        //}
    </script>
    <script>
        var win = navigator.platform.indexOf('Win') > -1;
        if (win && document.querySelector('#sidenav-scrollbar')) {
            var options = {
                damping: '0.5'
            }
            Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
        }
    </script>
    <!-- Github buttons -->
    <%--<script async defer src="https://buttons.github.io/buttons.js"></script>--%>
    <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="../assets/js/material-dashboard.min.js?v=3.1.0"></script>
    <script>
        //exampleModalForm

        $(window).load(function () {
            onUserTypeChange();
        });

        $(document).ready(function () {
            $('#drpLstUserType').on('change', function () {
                onUserTypeChange();
            });
        });

        function onUserTypeChange() {
            var dropdown = $('#drpLstUserType').val();
            if (dropdown === 'Doctor') {
                $('#hospital_name_group').show();
            } else {
                $('#hospital_name_group').hide();
            }
        }

        function isValid() {
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var password = $('#txtPassword').val();
            var user_type = $('#drpLstUserType').val();
            
            if (name == '') {
                alert('Name can not be empty');
                return false;
            }
            if (email == '') {
                alert('Email ID can not be empty')
                return false;
            }
            if (password == '') {
                alert('Password can not be empty')
                return false;
            }
            if (user_type == 'Doctor') {
                var hospital_name = $('#txtHospitalName').val();
                if (hospital_name == '') {
                    alert('Hospital name can not be empty')
                    return false;
                }
            }

            return true;
        }


    </script>
</body>
</html>
