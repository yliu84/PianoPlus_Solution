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
            try
            {
                using (var context = new PianoPlusContext())
                {
                    context.Blogs.Add(newBlog);

                    context.SaveChanges();
                    return true;

                }
           
            }
            catch
            {
                return false;
            }
                
           
        }

        public List<BlogInfo> Post_List()
        {
            using (var context = new PianoPlusContext())
            {
                var results = from post in context.Blogs
                              orderby post.PostDate
                              select new BlogInfo()
                              {
                                  BlogID = post.BlogID,
                                  InstructorName = post.Instructor.FirstName + " " + post.Instructor.LastName,
                                  PostDate = post.PostDate,
                                  Title = post.Title,
                                  Content = post.Content
                              };

                return results.ToList();
            }
        }
    }
}
