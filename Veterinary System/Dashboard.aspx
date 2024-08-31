<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Veterinary_System.Doctor.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <h6 class="font-weight-bolder mb-0">Doctor Dashboard</h6>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <button type="button" class="btn bg-gradient-primary" data-bs-toggle="modal" data-bs-target="#ModalAddDoctor">
                            Add Doctor
                        </button>
                    </li>
                    <li>&nbsp; &nbsp;</li>
                    <li class="nav-item d-flex align-items-center">
                        <button type="button" class="btn bg-gradient-primary" data-bs-toggle="modal" data-bs-target="#ModalAddCompounder">
                            Add Compounder
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
    </div>

    <!-- Modal Add Doctor -->
    <div class="modal fade" id="ModalAddDoctor" tabindex="-1" aria-labelledby="ModalAddDoctor" aria-hidden="true">
        <div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
            <div class="modal-content">
                <div class="modal-body p-0">
                    <div class="card card-plain">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1 text-center py-4">
                                <h4 class="font-weight-bolder text-white mt-1">Add Details</h4>
                            </div>
                        </div>
                        <div class="card-body pb-3">
                            <div class="input-group input-group-outline mb-3">
                                <label class="form-label">Name</label>
                                <input class="form-control" id="txtDoctorName" type="text">
                            </div>
                            <div class="input-group input-group-outline mb-3">
                                <label class="form-label">Email</label>
                                <input class="form-control" id="txtDoctorEmail" type="email">
                            </div>
                            <div class="text-center">
                                <button class="btn bg-gradient-primary" type="button" onclick="btnAddDoctor()">Add Doctor</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Add Compounder -->
    <div class="modal fade" id="ModalAddCompounder" tabindex="-1" aria-labelledby="ModalAddCompounder" aria-hidden="true">
        <div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
            <div class="modal-content">
                <div class="modal-body p-0">
                    <div class="card card-plain">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1 text-center py-4">
                                <h4 class="font-weight-bolder text-white mt-1">Add Details</h4>
                            </div>
                        </div>
                        <div class="card-body pb-3">
                            <form runat="server">
                                <div class="input-group input-group-outline mb-3">
                                    <label class="form-label">Name</label>
                                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="input-group input-group-outline mb-3">
                                    <label class="form-label">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btnAddNewCompounder" runat="server" Text="Add New Compunder" OnClick="btnAddNewCompounder_Click" class="btn bg-gradient-primary" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const dashboard_link = document.getElementById("dashboard_link");
        dashboard_link.classList.add("bg-gradient-primary");

        document.getElementById('user_dashboard').style.display = 'none';
        /*user_dashboard.style.display = "none";*/


        function btnAddDoctor() {
            var name = $('#txtDoctorName').val();
            var email = $('#txtDoctorEmail').val();

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/AddDoctor",
                data: JSON.stringify({ strName: name, strEmail: email }),
                contentType: "application/json;",
                dataType: "json",
                success: function (response) {
                    if (response.d > 0) {
                        alert('Doctor added.')
                    } else {
                        alert('Database error, Please try after some time..!')
                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        //$('#permission_link').css('display', 'none');


        //$(document).ready(function () {            });
        $.ajax({
            type: "POST",
            url: "Dashboard.aspx/GetPermissions",
            contentType: "application/json;",
            dataType: "json",
            success: function (response) {

                if (response.d.bDashboard) {
                    $('#dashboard_link').show();
                } else {
                    $('#dashboard_link').hide();
                }
                if (response.d.bPermission) {
                    $('#doctor_permissions').show();
                } else {
                    $('#doctor_permissions').hide();
                }
                if (response.d.bBilling) {
                    $('#billing_link').show();
                } else {
                    $('#billing_link').hide();
                }

                //$('#permission_link').hide();

                //$("#Content").text(response.d);
            },
            failure: function (response) {
                alert(response.d);
            }
        });

    </script>

</asp:Content>
