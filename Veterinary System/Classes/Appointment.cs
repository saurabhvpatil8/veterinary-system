using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Veterinary_System.Classes
{
    public class Appointment
    {
        public int iAppointmentId { get; set; }
        public int iDoctorId { get; set; }
        public int iAnimalId { get; set; }
        public DateTime dtAppointmentDate { get; set; }
        public enumAppointmentStatus enumStatus { get; set; }
        public enum enumAppointmentStatus { Pending, Approved, Rejected, Missed }
        //public enum enumAppointmentStatus { Pending,  Confirmed, Canceled, Missed, Completed }
    }

    public class AppointmentForDoctor
    {
        public int iAppointmentId { get; set; }
        public int iDoctorId { get; set; }
        public string  strDoctorFName { get; set; }
        public string  strDoctorLName { get; set; }
        public string strUserFName { get; set; }
        public string strUserLName { get; set; }
        public int iAnimalId { get; set; }
        public string  strSpecie { get; set; }
        public string  strBreed { get; set; }
        public DateTime dtAppointmentDate { get; set; }
        public enumAppointmentStatus enumStatus { get; set; }
        public enum enumAppointmentStatus { Pending, Approved, Rejected, Missed }
    }


    //// The appointment is planned and confirmed but has not yet occurred
    //Scheduled,

    //// The appointment is awaiting confirmation or approval
    //Pending,

    //// The appointment has been confirmed by both the user and the provider
    //Confirmed,

    //// The appointment has been moved to a different time or date
    //Rescheduled,

    //// The appointment was canceled by the user or provider
    //Canceled,

    //// The user or provider did not attend the appointment
    //NoShow,

    //// The appointment has taken place and is now finished
    //Completed,

    //// The appointment is currently taking place
    //InProgress,

    //// Similar to NoShow, indicates that the appointment was missed without prior cancellation
    //Missed,

    //// The appointment has been completed, but a follow-up action or appointment is required
    //FollowUpNeeded,

    //// The appointment has been completed, but payment is still pending
    //PendingPayment,

    //// The appointment is awaiting additional documents or information before it can proceed
    //AwaitingDocuments,

    //// The appointment has been confirmed by the provider but not yet confirmed by the user
    //ConfirmedByProvider,

    //// The appointment has been confirmed by the user but not yet confirmed by the provider
    //ConfirmedByUser,

    //// The appointment request was declined by either the user or the provider
    //Declined,

    //// The appointment is temporarily on hold and cannot be rescheduled or canceled until further notice
    //OnHold
}