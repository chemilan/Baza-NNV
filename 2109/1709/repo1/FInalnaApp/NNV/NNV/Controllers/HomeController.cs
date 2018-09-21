using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Reflection;
using System.Data;
using System.Data.Linq.Mapping;
using System.Linq.Expressions;
using System.ComponentModel;
using System.Web.Mvc;


namespace NNV.Controllers
{
    public class HomeController 
    {


       // public ActionResult Index()
        {
          
            //return ViewPage();
        }

        public ActionResult About()
        {
            //ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
           // ViewBag.Message = "Your contact page.";

            //return View();
        }

        public ActionResult Login()
        {

           // return View();
        }

        [HttpPost]

        
       // public ActionResult NNV()
        {

         
        }




        public ActionResult ADMIN()
        {

           // return View();
        }

    }



}