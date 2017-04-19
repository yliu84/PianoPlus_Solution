using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data;
using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
using PianoPlus.UI;

public partial class InvoiceManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            StudentGridView.DataBind();
        }
    }
    protected void btn_select_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[1]);

        StudentController studentController = new StudentController();
        Student currentStudent = studentController.GetStudentByStudentID(studentID);

        if (currentStudent != null)
        {
            HttpCookie studIDCookie = new HttpCookie("studID");
            studIDCookie.Value = currentStudent.StudentID.ToString();
            Response.Cookies.Add(studIDCookie);
            Response.Write("<script>window.open('Invoice.aspx')</script>");
        }
    }

    protected void btn_view_Click(object sender, EventArgs e)
    {
        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int accountId = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[1]);

        InvoiceController invoiceController = new InvoiceController();
        StudentController studentController = new StudentController();
        StudentInf student = null;
        transactions.Visible = true;

        if(invoiceController.Transaction_List(accountId).Count() != 0)
        {
            List<TransactionInfo> TransactionList = new List<TransactionInfo>();
            TransactionList = invoiceController.Transaction_List(accountId);
            TransactionGridView.DataSource = TransactionList;

            student = new StudentInf();
            student = studentController.GetStudentInfoByStudentID(studentID);
            txt_studentId.Text = studentID.ToString();
            txt_name.Text = student.FullName;
                
        }

        TransactionGridView.DataBind();
    }
    //protected void btn_pdf_Click(object sender, EventArgs e)
    //{
    //    int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
    //    int transactionId = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);
    //    int studentId = int.Parse(txt_studentId.Text);
    //    StudentController studentController = new StudentController();
    //    Student currentStudent = studentController.GetStudentByStudentID(studentId);

    //    if (currentStudent != null)
    //    {
    //        HttpCookie studIDCookie = new HttpCookie("studID");
    //        studIDCookie.Value = currentStudent.StudentID.ToString();
    //        Response.Cookies.Add(studIDCookie);
    //        Response.Write("<script>window.open('Invoice.aspx')</script>");
    //    }
    //}
}