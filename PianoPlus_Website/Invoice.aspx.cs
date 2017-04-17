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
        document.Close();

        //step 6: Write pdf bytes to outputstream
        Response.OutputStream.Write(m.GetBuffer(), 0, m.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();
        m.Close();
    }

    protected Document CreateAndSavePDF(Document doc)
    {
        //Dummy data for Invoice.
        string companyName = "Piano+";
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[6] {
                            new DataColumn("PaymentID", typeof(int)),
                            new DataColumn("CourseCode", typeof(string)),
                            new DataColumn("Hours", typeof(double)),
                            new DataColumn("LessonFee", typeof(decimal)),
                            new DataColumn("PaidTime", typeof(DateTime)),
                            new DataColumn("Total", typeof(int))});

        //dt.Rows.Add(101, "Sun Glasses", 200, 5, 1000); --> Add the fields from the form here


        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                //Generate Invoice (Bill) Header.
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
                sb.Append("<tr><td align='center' style='background-color: #18B5F0' colspan = '2'><b>Order Sheet</b></td></tr>");
                sb.Append("<tr><td colspan = '2'></td></tr>");
                sb.Append("</td><td align = 'right'><b>Date: </b>");
                sb.Append(DateTime.Now);
                sb.Append(" </td></tr>");
                sb.Append("<tr><td colspan = '2'><b>Company Name: </b>");
                sb.Append(companyName);
                sb.Append("</td></tr>");
                sb.Append("</table>");
                sb.Append("<br />");

                //Generate Invoice Items Grid.
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th style = 'background-color: #D20B0C;color:#000000'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
                sb.Append("<tr><td align = 'right' colspan = '");
                sb.Append(dt.Columns.Count - 1);
                sb.Append("'>Total</td>");
                sb.Append("<td>");
                sb.Append(dt.Compute("sum(Total)", ""));
                sb.Append("</td>");
                sb.Append("</tr></table>");

                //Export HTML String as PDF.

                //StringReader sr = new StringReader(sb.ToString());
                using (StringReader sr = new StringReader(sb.ToString()))
                {
                    ArrayList parsedList = HTMLWorker.ParseToList(sr, null);
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