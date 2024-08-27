<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="Veterinary_System.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>--%>
    <style>
    </style>
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
                        <button type="button" class="btn bg-gradient-primary" data-bs-toggle="modal" data-bs-target="#ModalAddPet">
                            Add Pet
                        </button>
                        <%--<a class="btn btn-outline-primary btn-sm mb-0 me-3" target="_blank" href="#">Add New Compounder</a>--%>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

    <%--  <div id="toastPetAdd" class="d-flex align-items-center justify-content-between bg-gradient-primary border-0 pe-2 mx-auto" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body text-white">
            Hello, world! This is a notification message.
        </div>
        <i class="fas fa-times text-md cursor-pointer pe-2 text-white" data-bs-dismiss="toast" aria-label="Close"></i>
    </div>--%>

    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                            <h6 class="text-white text-capitalize ps-3">Staff Members</h6>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive p-0">
                            <table class="table align-items-center mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Function</th>
                                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Employed</th>
                                        <th class="text-secondary opacity-7"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div>
                                                    <img src="../assets/img/team-2.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">John Michael</h6>
                                                    <p class="text-xs text-secondary mb-0">john@creative-tim.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Manager</p>
                                            <p class="text-xs text-secondary mb-0">Organization</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-primary">Online</span>
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">23/04/18</span>
                                        </td>
                                        <td class="align-middle">
                                            <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">Edit
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div>
                                                    <img src="../assets/img/team-3.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user2">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">Alexa Liras</h6>
                                                    <p class="text-xs text-secondary mb-0">alexa@creative-tim.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Programator</p>
                                            <p class="text-xs text-secondary mb-0">Developer</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-secondary">Offline</span>
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">11/01/19</span>
                                        </td>
                                        <td class="align-middle">
                                            <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">Edit
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div>
                                                    <img src="../assets/img/team-4.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user3">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">Laurent Perrier</h6>
                                                    <p class="text-xs text-secondary mb-0">laurent@creative-tim.com</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0">Executive</p>
                                            <p class="text-xs text-secondary mb-0">Projects</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-primary">Online</span>
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">19/09/17</span>
                                        </td>
                                        <td class="align-middle">
                                            <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">Edit
                                            </a>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="ModalAddPet" tabindex="-1" aria-labelledby="ModalAddPet" aria-hidden="true">
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
                            <%--<form runat="server" id="myForm">--%>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Name:</strong>
                                <input type="text" id="txtName" class="form-control">
                                <%--<asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select specie:</strong>
                                <%--<label class="form-label">Email</label>--%>
                                <select id="drpSpecies" class="form-control"></select>
                                <%--<asp:DropDownList ID="drpSpecies" class="form-control" runat="server"></asp:DropDownList>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select breed:</strong>
                                <select id="drpBreeds" class="form-control"></select>
                                <%--<asp:DropDownList ID="drpBreeds" class="form-control" runat="server"></asp:DropDownList>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select gender:</strong>
                                <select id="drpAnimalGender" class="form-control">
                                    <option value="Male" selected="selected">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                                <%--                                    <asp:DropDownList ID="drpAnimalGender" class="form-control" runat="server">
                                        <asp:ListItem Selected="True" Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                    </asp:DropDownList>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Weight: (in KG)</strong>
                                <input type="number" id="txtWeight" class="form-control">
                                <%--<asp:TextBox ID="txtWeight" runat="server" TextMode="Number" class="form-control"></asp:TextBox>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Birth date</strong>
                                <input type="date" id="birthDate" class="form-control">
                                <%--<asp:TextBox runat="server" class="form-control" TextMode="Date"></asp:TextBox>--%>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Description:</strong>
                                <textarea id="txtDescription" class="form-control"></textarea>
                                <%--<asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>--%>
                            </div>
                            <div class="text-center">
                                <button class="btn bg-gradient-primary w-100 mt-4 mb-0" onclick="btnPetAdd()">Add Pet</button>
                                <%--<asp:Button ID="btnAddPet" runat="server" Text="Add Pet" OnClick="btnAddPet_Click" class="btn bg-gradient-primary w-100 mt-4 mb-0" />--%>
                            </div>
                            <%--</form>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>--%>
    <%--<script src="/assets/js/plugins/flatpickr.min.js"></script>--%>
    <script>
        document.getElementById("home_link").classList.add('bg-gradient-primary');
        document.getElementById('vet_dashboard').style.display = 'none';

        var submit = false;
        fillUpSpecieDropDown();

        //$(document).ready(function () {
        //});

        function fillUpSpecieDropDown() {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetAllSpecies",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var drpSpecies = $('#drpSpecies');
                    drpSpecies.empty();
                    $.each(response.d, function (index, value) {
                        drpSpecies.append($('<option></option>').val(value).text(value));
                    });

                    var specieVal = document.getElementById('drpSpecies');
                    fillUpBreedsDropDown(specieVal.value);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        function fillUpBreedsDropDown(speciesName) {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetBreedBySpecie",
                data: JSON.stringify({ speciesName: speciesName }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var drpBreeds = $('#drpBreeds');
                    drpBreeds.empty();

                    $.each(response.d, function (index, value) {
                        drpBreeds.append($('<option></option>').val(value).text(value));
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        $('#drpSpecies').change(function () {
            var selectedSpecies = $(this).val();
            fillUpBreedsDropDown(selectedSpecies);
        });

        //document.getElementById('myForm').addEventListener('submit', function (event) {
        //    if (!submit) { event.preventDefault(); }
        //});

        function btnPetAdd() {
            if ($('#txtName').val() == null || $('#txtName').val() == '') {
                alert('Enter your Pet name..!')
                return;
            }
            var objAnimal = {
                strName: $('#txtName').val(),
                strSpecie: $('#drpSpecies').val(),
                strBreed: $('#drpBreeds').val(),
                strGender: $('#drpAnimalGender').val(),
                strWeight: $('#txtWeight').val(),
                dtBirthDate: $('#birthDate').val(),
                strDescription: $('#txtDescription').val()
            };

            $.ajax({
                type: "POST",
                url: "Home.aspx/AddNewPet",
                data: JSON.stringify({ objAnimal: objAnimal }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (response.d == true) {
                        alert('New Pet Added Successfully')
                        $('#ModalAddPet').modal('hide');
                    } else {
                        alert('There is some problem in adding your pet, please try after some time..!')
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }



    </script>

</asp:Content>
