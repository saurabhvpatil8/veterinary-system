<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Permissions.aspx.cs" Inherits="Veterinary_System.Permissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table-container {
            margin: 50px;
        }

        .update-btn {
            margin-top: 20px;
            align-items: flex-end;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                            <table class="table table-bordered text-center mb-0">
                                <thead>
                                    <tr>
                                        <th>Names</th>
                                        <th>Dashboard</th>
                                        <th>Diagnosis</th>
                                        <th>Billing</th>
                                    </tr>
                                </thead>
                                <tbody id="permissionsTableBody">
                                    <!-- Permissions rows will be dynamically generated here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button class="btn btn-primary update-btn" onclick="updatePermissions()">Update</button>

    </div>
    <%--</main>--%>

    <script>
        document.getElementById("permission_link").classList.add('bg-gradient-primary');
        //document.getElementById('user_dashboard').style.display = 'none';
        //console.log(34)
        function loadPermissions() {
            $.ajax({
                type: "POST",
                url: "Permissions.aspx/GetPermissions",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    renderPermissionsTable(response.d);
                },
                error: function (err) {
                    console.error("Error fetching permissions: ", err);
                }
            });
        }

        // Function to render the permissions table
        function renderPermissionsTable(permissions) {
            let tableBody = $('#permissionsTableBody');
            tableBody.empty();  // Clear previous rows

            permissions.forEach(permission => {
                let row = `<tr>
                    <td>${permission.strCompounderFName} ${permission.strCompounderLName}</td>
                    <td><input type="checkbox" class="form-check-input border border-2 border-dark" ${permission.bDashboard ? 'checked' : ''} data-permission-id="${permission.iPermissionId}" data-field="bDashboard"></td>
                    <td><input type="checkbox" class="form-check-input border border-2 border-dark" ${permission.bDiagnosis ? 'checked' : ''} data-permission-id="${permission.iPermissionId}" data-field="bDiagnosis"></td>
                    <td><input type="checkbox" class="form-check-input border border-2 border-dark" ${permission.bBilling ? 'checked' : ''} data-permission-id="${permission.iPermissionId}" data-field="bBilling"></td>
                </tr>`;
                tableBody.append(row);
            });

        }

        function updatePermissions() {
            let updatedPermissions = [];

            // Gather data from the table
            $('#permissionsTableBody input[type="checkbox"]').each(function () {
                let permissionId = $(this).data('permission-id');
                let field = $(this).data('field');
                let checked = $(this).is(':checked');

                // Check if permissionId exists in updatedPermissions, if not create an entry
                let permission = updatedPermissions.find(p => p.iPermissionId === permissionId);
                if (!permission) {
                    permission = { iPermissionId: permissionId };
                    updatedPermissions.push(permission);
                }

                permission[field] = checked;
            });
            /*console.log(updatedPermissions)*/

            $.ajax({
                type: "POST",
                url: "Permissions.aspx/UpdatePermissions",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ permissions: updatedPermissions }),
                success: function (response) {
                    if (response.d)

                    alert("Permissions updated successfully!");
                },
                error: function (err) {
                    console.error("Error updating permissions: ", err);
                }
            });
        }

        // Load permissions when the page loads
        $(document).ready(function () {
            loadPermissions();
        });


    </script>
</asp:Content>
