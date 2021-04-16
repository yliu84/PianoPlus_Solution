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
    [DataObject]
    public class BlogController
    {
        public void AddPost(Blog newBlog)
        {
           
                using (var context = new PianoPlusContext())
                {
                    context.Blogs.Add(newBlog);

                    context.SaveChanges();
                    
                }
                   
           
        }

        public BlogInfo Get_PostInfo(int blogid)
        {
            using (var context = new PianoPlusContext())
            {
                var result = (from post in context.Blogs
                              where post.BlogID == blogid
                              select new BlogInfo()
                              {
                                  BlogID = post.BlogID,
                                  Title = post.Title,
                                  InstructorName = post.Instructor.FirstName + " " + post.Instructor.LastName,
                                  Content = post.Content
                              }).FirstOrDefault();

                return result;
            }
        }

        public List<BlogInfo> Post_List()
        {
            using (var context = new PianoPlusContext())
            {
                var results = from post in context.Blogs
                              orderby post.PostDate descending
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

        public List<Blog> GetPostsByInstructorID(int instructorID)
        {
            using(var context = new PianoPlusContext())
            {
                var result = from x in context.Blogs
                             where x.InstructorID == instructorID
                             orderby x.PostDate descending
                             select x;

                return result.ToList();
            }
        }

        public void UpdatePost(Blog blog)
        {

            using (var context = new PianoPlusContext())
            {
                //Find the entity
                Blog currentBlog = context.Blogs.Find(blog.BlogID);

                //Check if there is a change.
                if (currentBlog.Content != blog.Content)
                {
                    currentBlog.Content = blog.Content;
                }
                if (currentBlog.Title != blog.Title)
                {
                    currentBlog.Title = blog.Title;
                }
                if (currentBlog.PostDate != blog.PostDate)
                {
                    currentBlog.PostDate = blog.PostDate;
                }

                //DO the update
                var update = context.Entry(context.Blogs.Attach(currentBlog));
                update.Property(x => x.Content).IsModified = true;
                update.Property(x => x.Title).IsModified = true;
                update.Property(x => x.PostDate).IsModified = true;
                
                //Save the changes in DB
                context.SaveChanges();

            }

        }

        public void Delete_Post(Blog blog)
        {
            using(var context = new PianoPlusContext())
            {
                Blog deleted = context.Blogs.Find(blog.BlogID);

                context.Blogs.Remove(deleted);
                context.SaveChanges();
            }
        }
    }
}
