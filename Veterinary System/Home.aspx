<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="Veterinary_System.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>--%>
    <style>
        .pet-image {
            width: 100%;
            height: 200px;
            /*background-color: #e9ecef;*/
            display: flex;
            /*            justify-content: center;
            align-items: center;*/
            margin-bottom: 10px;
        }

        #navbarBlur {
            margin-bottom: -20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <h6 class="font-weight-bolder mb-0">User Dashboard</h6>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <button type="button" class="btn bg-gradient-primary" data-bs-toggle="modal" data-bs-target="#ModalAddPet">
                            Add Pet
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

    <div class="container-fluid py-4 m-2">
        <div class="row">
            <div class="col-12">
                <h4>Pet Details</h4>
            </div>
        </div>

        <div class="row" id="divAnimalsContainer">
            <div class="col-md-4">
                <div class="pet-image">
                    <img src="assets/img/animals/dogs1.jpg" width="350px" height="200px" />
                </div>
                <button class="btn btn-outline-secondary btn-custom">Edit</button>
                <button class="btn btn-outline-secondary btn-custom">See Past Records</button>
            </div>
            <div class="col-md-8">
                <div class="row mb-2">
                    <div class="col-md-6">
                        <strong>Name:</strong> <span id="pet_name">pet_name</span>
                    </div>
                    <div class="col-md-6">
                        <strong>Weight:</strong> <span id="pet_weight">0 KG</span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6">
                        <strong>Pet Number:</strong> <span id="pet_number">number</span>
                    </div>
                    <div class="col-md-6">
                        <strong>Age:</strong> <span id="pet_age">0 years</span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6">
                        <strong>Gender:</strong> <span id="pet_gender">gender</span>
                    </div>
                    <div class="col-md-6">
                        <strong>Description:</strong> <span id="pet_description">description</span>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-6">
                        <strong>Specie:</strong> <span id="pet_specie">specie</span>
                    </div>
                    <div class="col-md-6">
                        <strong>Breed:</strong> <span id="pet_breed">breed</span>
                    </div>
                </div>
                <button class="btn btn-primary btn-custom">Book Appointment</button>
            </div>
        </div>
    </div>

    <!-- Modal Pet Add -->
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
                            <div class="input-group input-group-outline row m-1">
                                <strong>Name:</strong>
                                <input type="text" id="txtName" class="form-control">
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select specie:</strong>
                                <select id="drpSpecies" class="form-control"></select>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select breed:</strong>
                                <select id="drpBreeds" class="form-control"></select>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select gender:</strong>
                                <select id="drpAnimalGender" class="form-control">
                                    <option value="Male" selected="selected">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Weight: (in KG)</strong>
                                <input type="number" id="txtWeight" class="form-control">
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Birth date</strong>
                                <input type="date" id="birthDate" class="form-control">
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Description:</strong>
                                <textarea id="txtDescription" class="form-control"></textarea>
                            </div>
                            <div class="text-center">
                                <button class="btn bg-gradient-primary w-100 mt-4 mb-0" onclick="btnPetAdd()">Add Pet</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Book Appointment -->
    <div class="modal fade" id="ModalBookAppointment" tabindex="-1" aria-labelledby="ModalBookAppointment" aria-hidden="true">
        <div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
            <div class="modal-content">
                <div class="modal-body p-0">
                    <div class="card card-plain">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1 text-center py-4">
                                <h4 class="font-weight-bolder text-white mt-1">Select Doctor</h4>
                            </div>
                        </div>
                        <div class="card-body pb-3">
                            <div class="input-group input-group-outline row m-1">
                                <div class="col-md-8">
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <strong>Select State:</strong>
                                            <%--<select id="drpState" class="form-control"></select>--%>
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Select City:</strong>
                                            <%--<select id="drpCity" class="form-control"></select>--%>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                    </div>
                                </div>
                            </div>
                            <%--<div class="input-group input-group-outline row m-1">
                                <strong>Select City:</strong>
                                <select id="drpCity" class="form-control"></select>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Select gender:</strong>
                                <select id="drpAnimalGender1" class="form-control">
                                    <option value="Male" selected="selected">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Weight: (in KG)</strong>
                                <input type="number" id="txtWeight1" class="form-control">
                            </div>--%>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Birth date</strong>
                                <input type="date" id="birthDate1" class="form-control">
                            </div>
                            <div class="input-group input-group-outline row m-1">
                                <strong>Description:</strong>
                                <textarea id="txtDescription1" class="form-control"></textarea>
                            </div>
                            <div class="text-center">
                                <button class="btn bg-gradient-primary w-100 mt-4 mb-0" onclick="btnPetAdd()">Add Pet</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="doctorAppointmentModal" tabindex="-1" aria-labelledby="doctorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="doctorModalLabel">Select Doctor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-5">
                            <label for="drpState">Select State:</label>
                            <select id="drpState" class="form-select p-2"></select>
                            <%--<select id="state" class="form-select" onchange="getDoctors()">
                                <option value="Maharashtra">Maharashtra</option>
                                <option value="Gujarat">Gujarat</option>
                            </select>--%>
                        </div>
                        <div class="col-md-5">
                            <label for="drpCity">Select City:</label>
                            <select id="drpCity" class="form-select p-2"></select>
                            <%--<select id="drpCity" class="form-select p-2" onchange="getDoctors();" ></select>--%>
                            <%--<select id="city" class="form-select" onchange="getDoctors()">
                                <option value="Nashik">Nashik</option>
                                <option value="Mumbai">Mumbai</option>
                            </select>--%>
                        </div>
                        <div class="col-md-2">
                            <br />
                            <input value="Search" title="Search" type="button" onclick="getDoctors();" class="btn btn-primary btn-custom" />
                        </div>
                    </div>
                    <div id="hospitalContainer" class="container"></div>
                </div>
            </div>
        </div>
    </div>

    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>--%>
    <%--<script src="/assets/js/plugins/flatpickr.min.js"></script>--%>
    <script>
        document.getElementById("home_link").classList.add('bg-gradient-primary');
        //document.getElementById('vet_dashboard').style.display = 'none';

        var submit = false;
        var petId = 0;
        fillUpSpecieDropDown();
        fillUpStateDropDown();

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

        function fillUpStateDropDown() {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetAllStates",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var drpState = $('#drpState');
                    drpState.empty();
                    $.each(response.d, function (index, value) {
                        drpState.append($('<option></option>').val(value).text(value));
                    });

                    var stateVal = document.getElementById('drpState');
                    fillUpCitiesDropDown(stateVal.value);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        function fillUpCitiesDropDown(stateName) {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetCityByState",
                data: JSON.stringify({ stateName: stateName }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var drpCity = $('#drpCity');
                    drpCity.empty();

                    $.each(response.d, function (index, value) {
                        drpCity.append($('<option></option>').val(value).text(value));
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

        $('#drpState').change(function () {
            var selectedState = $(this).val();
            fillUpCitiesDropDown(selectedState);
        });

        //document.getElementById('myForm').addEventListener('submit', function (event) {
        //    if (!submit) { event.preventDefault(); }
        //});

        GetAnimals();
        function GetAnimals() {
            $.ajax({
                type: "POST",
                url: "Home.aspx/GetAnimals",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d)
                    var animals = response.d;
                    var container = $('#divAnimalsContainer');
                    container.empty();

                    animals.forEach(function (animal) {
                        var animalImage = '';

                        if (animal.strSpecie === 'Cow') {
                            animalImage = `<img src="assets/img/animals/cow.jpeg" style="border-radius: 10px;" width="350px" height="200px" />`;
                        } else if (animal.strSpecie === 'Dog') {
                            animalImage = `<img src="assets/img/animals/dog.jpg" style="border-radius: 10px;" width="350px" height="200px" />`;
                        } else if (animal.strSpecie === 'Cat') {
                            animalImage = `<img src="assets/img/animals/cat.jpg" style="border-radius: 10px;" width="350px" height="200px" />`;
                        } else {
                            animalImage = `<img src="assets/img/animals/default.jpg" style="border-radius: 10px;" width="350px" height="200px" />`;
                        }
                        var animalHtml = `
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <div class="pet-image">
                                    ${animalImage}
                                </div>
                                <button class="btn btn-outline-secondary btn-custom" onclick="editAnimal(${animal.iAnimalId})">Edit</button>
                                <button class="btn btn-outline-secondary btn-custom">See Past Records</button>
                            </div>
                            <div class="col-md-8">
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <strong>Name:</strong> <span>${animal.strName}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <strong>Weight:</strong> <span>${animal.strWeight} KG</span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <strong>Pet Number:</strong> <span>${animal.strAnimalNumber}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <strong>Age:</strong> <span>${calculateAge(animal.dtBirthDate)} years</span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <strong>Gender:</strong> <span>${animal.strGender}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <strong>Description:</strong> <span>${animal.strDescription}</span>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <strong>Specie:</strong> <span>${animal.strSpecie}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <strong>Breed:</strong> <span>${animal.strBreed}</span>
                                    </div>
                                </div>

                                 <button class="btn btn-primary btn-custom" onclick="callAppointmentModal(${animal.iAnimalId})">Book Appointment</button>
                                <input type="hidden" id="animalId_${animal.iAnimalId}" value="${animal.iAnimalId}" />
                            </div>
                        </div>`;

                        container.append(animalHtml);
                    });

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }

        function calculateAge(birthDate) {
            var timestamp = parseInt(birthDate.replace(/\/Date\((\d+)\)\//, '$1'), 10);
            var birth = new Date(timestamp);
            var ageDiffMs = Date.now() - birth.getTime();
            var ageDate = new Date(ageDiffMs);

            return Math.abs(ageDate.getUTCFullYear() - 1970);
        }

        function editAnimal(animalId) {
            console.log('Animal ID: ' + animalId)
            console.log('Pet ID: ' + petId)
        }

        function callAppointmentModal(animalId) {
            petId = animalId;
            $('#doctorAppointmentModal').modal('show');
        }

        function bookAppointment(doctorId) {
            var dtAppointment = document.getElementById(`date_${doctorId}`).value;

            console.log('DoctorID : ' + doctorId + ', PetId : ' + petId + ', Date : ' + dtAppointment);

            if (dtAppointment != null && dtAppointment != '') {
                $.ajax({
                    type: "POST",
                    url: "Home.aspx/AddAppointment",
                    data: JSON.stringify({ doctorId: doctorId, animalId: petId, dtAppointmentDate: dtAppointment }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d)
                    },
                    error: function (error) {
                        console.log('Error: ' + error);
                    }
                });
            } else {
                alert('Please select date of Appointment..!');
            }


        }

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

        function getDoctors() {
            var state = $('#drpState').val();
            var city = $('#drpCity').val();

            $.ajax({
                type: "POST",
                url: "Home.aspx/GetHospitalWithDoctors",
                data: JSON.stringify({ strState: state, strCity: city }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var hospitals = response.d;
                    $('#hospitalContainer').empty();

                    if (hospitals.length > 0) {
                        hospitals.forEach(function (hospital) {
                            var doctorInfo = '';

                            hospital.lstDoctors.forEach(function (doctor) {
                                doctorInfo += `</br>
                            <div class="row">
                                <div class="col-md-5">
                                    <p><strong>Doctor Name:</strong> ${doctor.strFName} ${doctor.strLName}</p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Specialization:</strong> ${doctor.strSpecialization}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <strong>Select Date: </strong><input id="date_${doctor.iUserId}" class="border p-2" type="date" />
                                </div>
                                <input type="hidden" id="doctor_${doctor.iUserId}" value="${doctor.iUserId}">
                                <div class="col-md-6">
                                    <button class="btn btn-primary btn-custom" onclick="bookAppointment(${doctor.iUserId});">Book Appointment</button>
                                </div>
                            </div>
                            `;
                            });

                            var hospitalHtml = `
                        <div class="border rounded p-2">
                            <div class="row">
                                <div class="col-md-4">
                                    <h5>Hospital: ${hospital.objHospital.strName}</h5>
                                </div>
                                <div class="col-md-8">
                                    <p><strong>Phone no.:</strong> ${hospital.objHospital.strPhoneNumber} | <strong>Email ID:</strong> ${hospital.objHospital.strEmail}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <p><strong>Type:</strong> ${hospital.objHospital.strType}</p>
                                </div>
                                <div class="col-md-10">
                                    <p><strong>Address:</strong> ${hospital.objHospital.strAddress}</p>
                                </div>
                            </div>
                            ${doctorInfo}
                        </div>
                        </br>`;
                            $('#hospitalContainer').append(hospitalHtml);
                        });
                    } else {
                        $('#hospitalContainer').append('<p>No Hospital Found..!</p>');
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }



    </script>

</asp:Content>
