<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Diagnosis.aspx.cs" Inherits="Veterinary_System.Diagnosis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <h4 class="font-weight-bolder mb-0">Diagnosis</h4>
            </nav>
        </div>
    </nav>
    <%--////////////////////////////////--%>
    <div class="container-fluid py-4 m-2">
        <div class="row">
            <div class="col-12">
                <div class="input-group input-group-outline row m-1">
                    <strong>Search by animal number</strong>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                <input type="number" class="form-control" style="border: solid 2px; padding: 5px 10px;" placeholder="Enter animal number" id="search_animal_number" name="search_animal_number">
            </div>
            <div class="col-2">
                <div class="input-group row input-group-outline">
                    <input type="button" class="btn btn-primary btn-custom" onclick="SearchAnimalByNumber()" value="Search" />
                </div>
            </div>
        </div>

        <%--  --%>
        <div class="container" style="border: solid 1px; padding: 10px; border-radius: 10px;">
            <div class="row m-1">
                <div class="col-4">
                    <strong>Select Doctor</strong>
                </div>
                <div class="col-2">
                    <select class="form-select" style="border: solid 2px; padding: 5px 10px;" id="drpDoctorNames">
                    </select>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Animal's Parent Name</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="animal_parent_name" readonly />
                    <input type="hidden" id="animal_id" />
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Animal name</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="animal_name" readonly>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Specie</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="animal_specie" readonly>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Breed</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="animal_breed" readonly>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Date</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="today_date" readonly>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Symptoms</strong>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="symptoms">
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Dosage</strong>
                </div>
                <div class="col-3">
                    <input type="number" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="dosage">
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Description</strong>
                </div>
                <div class="col-3">
                    <textarea class="form-control outlinee" style="border: solid 2px; padding: 5px 10px;" id="description" rows="2"></textarea>
                </div>
            </div>
            <div class="row m-1">
                <div class="col-4">
                    <strong>Follow-up Date</strong>
                </div>
                <div class="col-3">
                    <input type="date" class="form-control" style="border: solid 2px; padding: 5px 10px;" id="follow_up_date">
                </div>
            </div>

            <div class="row m-1">
                <div class="col-4">
                </div>
                <div class="col-3">
                    <input type="button" class="btn btn-primary btn-custom" onclick="AddDiagnosis()" value="Add" />
                </div>
            </div>

        </div>


    </div>



    <script>
        document.getElementById("diagnosis_link").classList.add('bg-gradient-primary');
        var animalWithOwner = null;

        const today = new Date();
        const day = String(today.getDate()).padStart(2, '0');
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const year = today.getFullYear();

        const formattedTodayDate = `${day}-${month}-${year}`;
        $('#today_date').val(formattedTodayDate);
        console.log(formattedTodayDate)

        $.ajax({
            type: "POST",
            url: "Diagnosis.aspx/GetHospitalWithDoctor",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                console.log('Doctor');
                console.log(response.d);
                var doctorNames = document.getElementById('drpDoctorNames');
                var doctorsList = response.d.lstDoctors;
                $('#drpDoctorNames').empty();
                var options = '';
                for (let i = 0; i < doctorsList.length; i++) {
                    options += $('<option id="' + doctorsList[i].iUserId + '" ></option>').val(doctorsList[i].iUserId).text(doctorsList[i].strFName + ' ' + doctorsList[i].strLName).prop('outerHTML');
                }
                $('#drpDoctorNames').append(options);
            }
        });


        function SearchAnimalByNumber() {
            var animalNumber = $('#search_animal_number').val();

            $.ajax({
                type: "POST",
                url: "Diagnosis.aspx/SearchAnimalByNumber",
                data: JSON.stringify({ animalNumber: animalNumber }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    animalWithOwner = response.d;
                    //console.log(animalWithOwner)
                    $('#animal_name').val(response.d.objAnimal.strName);
                    $('#animal_specie').val(response.d.objAnimal.strSpecie);
                    $('#animal_breed').val(response.d.objAnimal.strBreed);
                    $('#animal_parent_name').val(response.d.objUser.strFName + ' ' + response.d.objUser.strLName);
                    $('#animal_id').val(response.d.objAnimal.iAnimalId);
                },
                error: function (error) {
                    alert("Error fetching animal information.");
                }
            });
        }

        function AddDiagnosis() {
            var doctorId = $('#drpDoctorNames').val();
            var animalId = $('#animal_id').val();
            var symptoms = $('#symptoms').val();
            var dosage = $('#dosage').val();
            var description = $('#description').val();
            var follow_up_date = $('#follow_up_date').val();

            //console.log(follow_up_date)
            $.ajax({
                type: "POST",
                url: "Diagnosis.aspx/AddDiagnosisDetails",
                data: JSON.stringify({ iDoctorId: doctorId, iAnimalId: animalId, strSymtoms: symptoms, strDosage: dosage, strDescription: description, strFollowUpDate: follow_up_date }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    if (response.d != '') {
                        alert('Added');
                        $('#drpDoctorNames').val() = '';
                    } else {
                        // report was not saved or generated
                    }
                },
                error: function (error) {
                    alert("Error fetching animal information.");
                }
            });
        }

    </script>

</asp:Content>
