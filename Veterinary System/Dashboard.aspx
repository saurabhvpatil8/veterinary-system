<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Veterinary_System.Doctor.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
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
        <div class="row">
            <h2>Appointments</h2>
            <table id="appointmentTable" class="table table-striped text-center mb-0">
                <thead>
                    <tr>
                        <th scope="col" class="text-center">Doctor Name</th>
                        <th scope="col" class="text-center">Animal Specie</th>
                        <th scope="col" class="text-center">Animal Breed</th>
                        <th scope="col" class="text-center">Pet Parent</th>
                        <th scope="col" class="text-center">Appointment Date</th>
                        <th scope="col" class="text-center">Status</th>
                        <th scope="col" class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody id="appointmentTableBody">
                </tbody>
            </table>

        </div>
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
                                    <asp:Button ID="btnAddNewCompounder" runat="server" Text="Add New Compounder" OnClick="btnAddNewCompounder_Click" class="btn bg-gradient-primary" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const itemsPerPage = 3; // Change this value to display more/less rows per page
        let currentPage = 1;
        let appointments = [];
        
        const dashboard_link = document.getElementById("dashboard_link");
        dashboard_link.classList.add("bg-gradient-primary");

        //document.getElementById('user_dashboard').style.display = 'none';


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
                    $('#ModalAddDoctor').modal('hide');
                },
                failure: function (response) {
                    alert(response.d);
                }
            });

        }

        function loadAppointments() {
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/GetAppointments",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    appointments = response.d;
                    console.log(appointments);

                    renderTable();
                },
                error: function (err) {
                    console.error("Error fetching appointments: ", err);
                }
            });
        }


        function renderTable() {
            let tableBody = $('#appointmentTableBody');
            tableBody.empty(); // Clear previous data

            appointments.forEach(function (appointment) {
                let row = $('<tr>');

                // Doctor Name, Animal Name, Specie, Breed
                row.append(`<td class="text-center">${appointment.strDoctorFName} ${appointment.strDoctorLName}</td>`);
                row.append(`<td class="text-center">${appointment.strSpecie}</td>`);
                row.append(`<td class="text-center">${appointment.strBreed}</td>`);
                row.append(`<td class="text-center">${appointment.strUserFName} ${appointment.strUserLName}</td>`);

                var dtFormattedAppointment = formatJsonDate(appointment.dtAppointmentDate);

                // Appointment Date (editable if status is "Pending")  Pending == 0
                let dateColumn = appointment.enumStatus === 0
                    ? `<input type="date" class="form-control" value="${dtFormattedAppointment}" onchange="changeAppointmentDate('${appointment.iAppointmentId}', this.value)">`
                    : dtFormattedAppointment;
                row.append(`<td class="text-center">${dateColumn}</td>`);

                // Status
                console.log('appointment Status: ' + appointment.enumStatus);
                if (appointment.enumStatus == 0) {
                    row.append(`<td class="text-center">Pending</td>`);
                } else if (appointment.enumStatus == 1) {
                    row.append(`<td class="text-center">Confirmed</td>`);
                } else if (appointment.enumStatus == 2) {
                    row.append(`<td class="text-center">Canceled</td>`);
                } else if (appointment.enumStatus == 3) {
                    row.append(`<td class="text-center">Missed</td>`);
                } else if (appointment.enumStatus == 4) {
                    row.append(`<td class="text-center">Completed</td>`);
                }

                //  Action buttons
                let actions;
                if (appointment.enumStatus == 0) {
                    actions = `
                        <button class="btn btn-outline-success" onclick="approveAppointment('${appointment.iAppointmentId}')">Approve</button>
                        <button class="btn btn-outline-danger" onclick="rejectAppointment('${appointment.iAppointmentId}')">Reject</button>`;
                } else if (appointment.enumStatus == 1) {
                    actions = `
                        <button class="btn btn-outline-info" onclick="diagnosisAppointment('${appointment.iAppointmentId}')">Diagnosis</button>
                        <button class="btn btn-outline-warning" onclick="missedAppointment('${appointment.iAppointmentId}')">Missed</button>`;
                } else {
                    actions = `<span>Nothing</span>`;
                }
                row.append(`<td class="text-center">${actions}</td>`);

                // Append row to the table body
                tableBody.append(row);
            });
        }

        function changeAppointmentDate(appointmentId, newDate) {
            //$.ajax({
            //    type: "POST",
            //    url: "YourWebService.asmx/UpdateAppointmentDate", // Update with actual method URL
            //    data: JSON.stringify({ id: appointmentId, date: newDate }),
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (response) {
            //        console.log("Date updated successfully");
            //    },
            //    error: function (err) {
            //        console.error("Error updating date: ", err);
            //    }
            //});
        }

        function approveAppointment(appointmentId) { 
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/ApproveAppointment",
                data: JSON.stringify({ id: appointmentId }),
                contentType: "application/json;",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        loadAppointments(); // Reload table after approval
                    } else {
                        alert('There is some issue in completing your request..!')
                    }
                },
                failure: function (response) {
                    console.error("Error approving appointment: ", response.d);
                }
            });
        }

        function rejectAppointment(appointmentId) {
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/RejectAppointment",
                data: JSON.stringify({ id: appointmentId }),
                contentType: "application/json;",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        loadAppointments(); // Reload table after approval
                    } else {
                        alert('There is some issue in completing your request..!')
                    }
                },
                failure: function (response) {
                    console.error("Error approving appointment: ", response.d);
                }
            });
        }

        function diagnosisAppointment(appointmentId) {
            console.log("Diagnosis action for appointment ID: " + appointmentId);
            // Handle diagnosis functionality here, e.g., redirect or update status
        }

        // Function for missed appointment
        function missedAppointment(appointmentId) {
            console.log("Missed action for appointment ID: " + appointmentId);
            // Handle missed functionality here, e.g., update status or log event
        }
        function formatJsonDate(jsonDateString) {
            var timestamp = parseInt(jsonDateString.replace(/\/Date\((\d+)\)\//, '$1'));
            var date = new Date(timestamp);

            // Format the date to 'yyyy-MM-dd'
            var year = date.getFullYear();
            var month = ("0" + (date.getMonth() + 1)).slice(-2);  // Add leading 0 to month if needed
            var day = ("0" + date.getDate()).slice(-2);            // Add leading 0 to day if needed

            return `${year}-${month}-${day}`;  // Return formatted date string
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

        $(document).ready(function () {
            loadAppointments();
            $('#appointmentTable').DataTable();
        });



    </script>

</asp:Content>
