using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PianoPlus_Data.Entities;
using PianoPlus_Data;
using PianoPlus_Data.POCOS;
using System.ComponentModel;
using System.Data.Entity;

namespace PianoPlus_System.BLL
{
    public class BlogController
    {
        public bool AddPost(Blog newBlog)
        {
            
      
                using (var context = new PianoPlusContext())
                {
                    context.Blogs.Add(newBlog);

                    context.SaveChanges();
                    return true;
                    
                }
           
            
        }
    }
}
