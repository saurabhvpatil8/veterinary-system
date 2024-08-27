<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Veterinary_System.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .outlinee {
            border: 2px solid #d2d6da;
            padding: 8px 9px 6.5px 9px;
            /*padding: 5px 6px 3.5px 6px;*/
        }

            .outlinee:focus {
                border: 2px solid #43A047;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-2 px-md-4">
        <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
            <span class="mask  bg-gradient-primary  opacity-6"></span>
        </div>
        <div class="card card-body mx-3 mx-md-4 mt-n6 m-2">
            <div class="container-xl px-4 mt-4">
                <div class="row">
                    <div>
                        <h5>Profile Details</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>First name</strong>
                                    <input class="form-control outlinee" id="txtFirstName" type="text" placeholder="Enter your first name">
                                </div>
                                <div class="col-md-6">
                                    <strong>Last name</strong>
                                    <input class="form-control outlinee" id="txtLastName" type="text" placeholder="Enter your last name">
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>Email ID</strong>
                                    <input class="form-control outlinee" id="txtEmail" type="email" placeholder="Enter your email">
                                </div>
                                <div class="col-md-6">
                                    <strong>Phone number</strong>
                                    <input class="form-control outlinee" id="txtPhoneNumber" type="text" placeholder="Enter your phone number">
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>User Type</strong>
                                    <input class="form-control outlinee" id="txtUserType" disabled type="text" placeholder="Your User Type">
                                </div>
                                <div class="col-md-6" id="specialization_div">
                                    <strong>Specialization</strong>
                                    <input class="form-control outlinee" id="txtSpecialization" type="text" placeholder="Specialized in...">
                                </div>
                            </div>
                            <%--                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>State</strong>
                                    <select id="drpState" class="form-control outlinee"></select>
                                </div>
                                <div class="col-md-6">
                                    <strong>City</strong>
                                    <select id="drpCity" class="form-control outlinee"></select>
                                </div>
                            </div>--%>
                            <div class="mb-3">
                                <strong>Address</strong>
                                <textarea class="form-control outlinee" id="txtAddress" rows="2"></textarea>
                            </div>
                            <button class="btn btn-success" type="button" onclick="btnUpdateProfile()">Update changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <hr />
        <br />
        <div class="card card-body mx-3 mx-md-4 mt-n6 m-2">
            <div class="container-xl px-4 mt-4">
                <div class="row">
                    <div class="">
                        <h5 class="">Hospital Details</h5>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>Name</strong>
                                    <input class="form-control outlinee" id="txtName" type="text" placeholder="Enter hospital name">
                                </div>
                                <div class="col-md-6">
                                    <strong>Phone number</strong>
                                    <input class="form-control outlinee" id="txtHospitalPhoneNumber" type="text" placeholder="Enter hospital's phone number">
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>Email ID</strong>
                                    <input class="form-control outlinee" id="txtHospitalEmail" type="text" placeholder="Enter hospital's email">
                                </div>
                                <div class="col-md-6">
                                    <strong>Hospital Type</strong>
                                    <select id="drpHospitalType" class="form-control outlinee">
                                        <option value="Male">Unknown</option>
                                        <option value="Female">Public</option>
                                        <option value="Female">Private</option>
                                        <option value="Other">Non-Profit</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <strong>State</strong>
                                    <select id="drpState" class="form-control outlinee"></select>
                                </div>
                                <div class="col-md-6">
                                    <strong>City</strong>
                                    <select id="drpCity" class="form-control outlinee"></select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <strong>Address</strong>
                                <textarea class="form-control outlinee" id="txtHospitalAddress" rows="2"></textarea>
                            </div>
                            <button class="btn btn-success" type="button" onclick="btnUpdateHospital()">Update changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>

    <script>
        document.getElementById("profile_link").classList.add('bg-gradient-primary');
        var user_type = '';
        onPageLoad();

        function onPageLoad() {
            $.ajax({
                type: "POST",
                url: "Profile.aspx/GetUserData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#txtFirstName').val(response.d.strFName)
                    $('#txtLastName').val(response.d.strLName)
                    $('#txtEmail').val(response.d.strEmail)
                    $('#txtPhoneNumber').val(response.d.strPhoneNo)
                    $('#txtUserType').val(response.d.strUserType)
                    $('#txtSpecialization').val(response.d.strSpecialization)
                    $('#txtAddress').val(response.d.strAddress)

                    user_type = response.d.strUserType;
                    if (user_type == 'User') {
                        document.getElementById('vet_dashboard').style.display = 'none';
                        document.getElementById('specialization_div').style.visibility = 'hidden';

                    } else {
                        document.getElementById('user_dashboard').style.display = 'none';
                        document.getElementById('specialization_div').style.visibility = 'visible';
                    }

                },
                error: function (error) {
                    console.log(error);
                }
            });

            $.ajax({
                type: "POST",
                url: "Profile.aspx/GetHospitalData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#txtName').val(response.d.strName)
                    $('#txtHospitalPhoneNumber').val(response.d.strPhoneNumber)
                    $('#txtHospitalEmail').val(response.d.strEmail)
                    var hospital_type = response.d.strType;
                    if (hospital_type == '')

                    $('#drpHospitalType').val(response.d.strType)
                    $('#drpState').val(response.d.strState)
                    $('#drpCity').val(response.d.strCity)
                    $('#txtHospitalAddress').val(response.d.strAddress)

                    //user_type = response.d.strUserType;
                    //if (user_type == 'User') {
                    //    document.getElementById('vet_dashboard').style.display = 'none';
                    //    document.getElementById('specialization_div').style.visibility = 'hidden';

                    //} else {
                    //    document.getElementById('user_dashboard').style.display = 'none';
                    //    document.getElementById('specialization_div').style.visibility = 'visible';
                    //}

                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

        $(window).on("load", function () {
            console.log("user_type: " + user_type);
        });
        /*$(document).ready(function () {          });*/

        function btnUpdateProfile() {

        }

        function btnUpdateHospital() {

        }
//        document.getElementById('vet_dashboard').style.display = 'none';


    </script>

    <%--    <script async defer src="https://buttons.github.io/buttons.js"></script>--%>
</asp:Content>
