using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;

namespace PianoPlus_System.BLL
{
    [DataObject]
    class InvoiceController
    {
        public bool AddNewInvoice(Payment payment)
        {
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Payments.Add(payment);
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


    }
}
