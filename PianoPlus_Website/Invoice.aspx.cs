using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.SessionState;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Text;

using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using PianoPlus_System.BLL;
using PianoPlus.UI;


public partial class Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
                
        //step 1
        //need to write to memory first due to IE wanting
        //to know the length of the pdf beforehand
        MemoryStream m = new MemoryStream();
        Document document = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        try
        {
            //step 2: we set the ContentType and create an instance of the Writer
            Response.ContentType = "application/pdf";
            PdfWriter writer = PdfWriter.GetInstance(document, m);
            writer.CloseStream = false;
            //step 3

            //step 4
            document = CreateAndSavePDF(document);
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.StackTrace);
            Console.Error.WriteLine(ex.Message);
        }

        //step 5: Close document

        //step 6: Write pdf bytes to outputstream
        Response.OutputStream.Write(m.GetBuffer(), 0, m.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        m.Close();
    }

    protected Document CreateAndSavePDF(Document doc)
    {
        InvoiceController invoiceController = new InvoiceController();
        StudentController studentController = new StudentController();

        string studentID = Request.Cookies["studID"].Value;
        int studIDNumber = Convert.ToInt32(studentID);
        AccountInfo studentAccounteInfo = invoiceController.GetAccountInfoByStudentID(studIDNumber);
        StudentInf studentInfo = studentController.GetStudentInfoByStudentID(studentAccounteInfo.StudentID);
        //Dummy data for Invoice.
        string companyName = "Piano Plus Studio";
        List<TransactionInfo> transactionList = studentAccounteInfo.TransactionList;
        List<string> transactionHeaders = new List<string>();
        //transactionHeaders.Add("PaymentID");
        transactionHeaders.Add("Course");
        transactionHeaders.Add("Transaction Date");
        transactionHeaders.Add("Hours");
        transactionHeaders.Add("Lesson Total");

        //dt.Rows.Add(101, "Sun Glasses", 200, 5, 1000); --> Add the fields from the form here


        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                //Generate Invoice (Bill) Header.
                sb.Append("<div align='center' style='background-color: #18B5F0'><b> Order Sheet</b></div>");
                sb.Append("<div style='margin-left:200px; margin-right:200px;'>");
                sb.Append("<div style='margin-left:200px; margin-right:200px;'>");
                        sb.Append("<table style='border-style: none;'>");
                            sb.Append("<tr>");
                                sb.Append("<td>");
                                sb.Append("</td>");
                                sb.Append("<td>");
                                sb.Append("</td>");
                                sb.Append("<td style='text-align:left; '>");
                                    sb.Append("<span style='text-align:left; font-size: 10px;'>");
                                        sb.Append("<b>Company Name:</b> ");
                                        sb.Append(companyName);
                                        sb.Append("<br />");
                                        sb.Append("<b>Date: </b>");
                                        sb.Append(DateTime.Now);
                                        sb.Append("<br />");
                                        sb.Append("<b>Phone:</b> ");
                                        sb.Append("(778) 896 - 9098");
                                        sb.Append("<br />");
                                        sb.Append("<b>Address:</b> ");
                                        sb.Append("8888 Odlin Crescent #3165");
                                        sb.Append("<br />");                                      
                                        sb.Append("Richmond, BC V6X 3Z8");
                                        sb.Append("<br />");
                                        sb.Append("<b>GST #:</b> ");
                                        sb.Append("insert GST number here");
                                        sb.Append("<br />");
                                    sb.Append("</span>");
                                sb.Append("</td>");
                            sb.Append("</tr>");
                        sb.Append("</table>");
                    sb.Append("</div>");

                    sb.Append("<div style='text-align:center;'> ");
                    sb.Append("______________________________________________________________________________");
                    sb.Append("<br />");
                    sb.Append("<br />");
                    sb.Append("</div>");

                    sb.Append("<div style=' font-size:10px; float:right;'>");
                    sb.Append("<span style='text-align:left'>");                    
                            sb.Append("<b>StudentID :</b> ");
                            sb.Append(studentAccounteInfo.StudentID);
                            sb.Append("<br />");
                            sb.Append("<b>Student Name: </b>");
                            sb.Append(studentAccounteInfo.StudentFullName);
                            sb.Append("<br />");
                            sb.Append("<b>Phone:</b> ");
                            sb.Append(string.Format("{0:(###) ###-####}", studentInfo.Phone));
                            sb.Append("<br />");
                            sb.Append("<b>Address:</b> ");
                            sb.Append(studentInfo.Address);
                            sb.Append("<br />");
                            sb.Append("<b>City:</b> ");
                            sb.Append(studentInfo.City + ", " + studentInfo.Province);                            
                            sb.Append("<br />");
                            sb.Append("<b>Postal Code:</b> ");
                            sb.Append(studentInfo.PostalCode);
                            sb.Append("<br />");
                            sb.Append("<b>Reciept Number:</b> ");
                            sb.Append("How do we do Reciept Number");
                            sb.Append("<br />");
                        sb.Append("</span>");
                    sb.Append("</div>");
                    //Generate Invoice Items Grid.

                    sb.Append("<div style='text-align:center;'> ");
                    sb.Append("______________________________________________________________________________");
                    sb.Append("<br />");
                    sb.Append("<br />");
                    sb.Append("</div>");
                    sb.Append("<div>");
                    sb.Append("<table border = '1'>");
                    sb.Append("<tr>");
                    foreach (string column in transactionHeaders)
                    {
                        sb.Append("<th style = 'background-color: #D20B0C;color:#000000'>");
                        sb.Append("<b>" + column + "</b>");
                        sb.Append("</th>");
                    }
                    sb.Append("</tr>");
                    foreach (TransactionInfo transaction in transactionList)
                    {
                        sb.Append("<tr>");
                            sb.Append("<td>");
                                sb.Append(transaction.CourseDescription);
                            sb.Append("</td>");
                        
                            sb.Append("<td>");
                                sb.Append(transaction.TransactionDate);
                            sb.Append("</td>");

                            sb.Append("<td>");
                                sb.Append(transaction.Hours);
                            sb.Append("</td>");

                            sb.Append("<td>");
                                sb.Append(transaction.LessonTotal);
                            sb.Append("</td>");

                        sb.Append("</tr>");
                    }
                    sb.Append("<tr><td align = 'right' colspan = '");
                    sb.Append(transactionHeaders.Count - 1);
                    sb.Append("'><b>Total</b></td>");
                    sb.Append("<td>");
                    sb.Append(studentAccounteInfo.AccountTotal);
                    sb.Append("</td>");
                    sb.Append("</tr></table>");

                    sb.Append("</div>");
                sb.Append("</div>");
                //Export HTML String as PDF.

                //StringReader sr = new StringReader(sb.ToString());
                using (StringReader sr = new StringReader(sb.ToString()))
                {
                    List<IElement> parsedList = HTMLWorker.ParseToList(sr, null);
                    doc.Open();
                    foreach (object item in parsedList)
                    {
                        doc.Add((IElement)item);
                    }
                    doc.Close();
                }

            }
            return doc;
        }
    }
}


    //using (FileStream fs = new FileStream("TestOutput.pdf", FileMode.Create)) {
    //    PdfWriter.GetInstance(document, fs);
    //    using (StringReader stringReader = new StringReader(download)) {
    //        ArrayList parsedList = HTMLWorker.ParseToList(stringReader, null);
    //        document.Open();
    //        foreach (object item in parsedList) {
    //            document.Add((IElement)item);
    //        }
    //        document.Close();
    //    }
    //}



                //StringReader sr = new StringReader(sb.ToString());

                //ArrayList parsedList = HTMLWorker.ParseToList(sr, null);
                //foreach (object item in parsedList)
                //{
                //    doc.Add((IElement)item);
                //}


                ////Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                //PdfWriter writer = PdfWriter.GetInstance(doc, Response.OutputStream);
                //Response.ContentType = "application/pdf";
                ////Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf"); --> change to include payment id in filename
                //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //Response.Write(doc);
                //HttpContext.Current.ApplicationInstance.CompleteRequest();