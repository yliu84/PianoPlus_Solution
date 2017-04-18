using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PianoPlus_Data.Entities;
using PianoPlus_System.BLL;
using PianoPlus_Data.POCOS;
using System.Net;
using System.Web.Helpers;

public partial class AddPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CourseController controller = new CourseController();

            ddl_course.DataSource = controller.Course_List();
            ddl_course.DataTextField = "CourseName";
            ddl_course.DataValueField = "CourseCode";
            ddl_course.DataBind();
        }

    }

    protected void btn_add_Click(object sender, EventArgs e)
    {
        InvoiceController invoiceController = new InvoiceController();
        Transaction transaction = new Transaction();
        transaction.InstructorID = Convert.ToInt32(Session["InstructorID"]);
        transaction.CourseCode = ddl_course.SelectedValue;
        transaction.Hours = Convert.ToDouble(txt_Hours.Text);
        transaction.LessonAmount = Convert.ToDecimal(txt_Fee.Text);

        transaction.AccountID = invoiceController.GetAccountIDByStudentID(Convert.ToInt32(txt_studentID.Text));
        transaction.TransactionDate = DateTime.Now;

        if (invoiceController.AddNewTransaction(transaction))
        {
            MessageUserControl.ShowInfo("Transaction successfully added.");
        }
        else
        {
            MessageUserControl.ShowInfo("Transaction Failed.");
        }
    }

    protected void btn_select_Click(object sender, EventArgs e)
    {

        int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
        int studentID = Convert.ToInt32(StudentGridView.DataKeys[rowIndex].Values[0]);

        StudentController studentController = new StudentController();
        StudentInf currentStudent = studentController.GetStudentInfoByStudentID(studentID);

        if (currentStudent != null)
        {
            txt_studentID.Text = studentID.ToString();
            txt_name2.Text = currentStudent.FullName;
        }
    }
    protected void btn_next_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            step1.Attributes["class"] = "disabled";
            step2.Attributes["class"] = "active";

            tabTwo.Attributes.Add("class", "active");
            tabOne.Visible = false;
            tabTwo.Visible = true;
        }

    }
    protected void btn_back_Click(object sender, EventArgs e)
    {
        step1.Attributes["class"] = "active";
        step2.Attributes["class"] = "disabled";

        tabOne.Visible = true;
        tabTwo.Visible = false;
    }
}