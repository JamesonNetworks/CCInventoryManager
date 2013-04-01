using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CCInventoryManager.Models;

namespace CCInventoryManager.db_populate
{
    public class db_populater
    {
        public void populateCustomers() 
        {
            CCINVEntities _db = new CCINVEntities();
            Customer thisCustomer = new Customer();
            List<string> CFirstName = new List<string>();
            CFirstName.Add("Steve");
            CFirstName.Add("Nancy");
            CFirstName.Add("Roger");
            CFirstName.Add("Dan");
            CFirstName.Add("Scott"); 
            CFirstName.Add("Nick");
            CFirstName.Add("Brandon");
            CFirstName.Add("Rachel");
            CFirstName.Add("Melissa");
            CFirstName.Add("Thomas");

            List<string> CLastName = new List<string>();
            CLastName.Add("Johnson");
            CLastName.Add("Jameson");
            CLastName.Add("Morrison");
            CLastName.Add("Einstein");
            CLastName.Add("Kwalski");
            CLastName.Add("Smith");
            CLastName.Add("Moore");
            CLastName.Add("Jones");
            CLastName.Add("Laughridge");
            CLastName.Add("Abole");

            string email_add = "@fakemail.com";
            foreach (string fname in CFirstName) 
            {
                foreach (string lname in CLastName)
                {
                    thisCustomer.FirstName = fname;
                    thisCustomer.LastName = lname;
                    thisCustomer.Email = fname + "." + lname + email_add;
                    _db.Customers.Add(thisCustomer);
                    _db.SaveChanges();
                }
            }
            try
            {
                _db.SaveChanges();
            }
            catch (Exception e) 
            {
                //Do nothing yet
            }
        }

        public void populateManufacturers() 
        {
            CCINVEntities _db = new CCINVEntities();
            Manufacturer thisManufacturer = new Manufacturer();

            List<string> Names = new List<string>();
            Names.Add("America's Cups");
            Names.Add("Charlie's Cup Emporium");
            Names.Add("Greenville Cups Inc");
            Names.Add("Tervis");
            Names.Add("Paper Products Cupers");
            Names.Add("Charleston's Cup Company");
            Names.Add("New York's Cups Inc");
            Names.Add("Chinese Can Cup");
            Names.Add("English Tea Cozies");

            foreach (string name in Names) 
            {
                thisManufacturer.Name = name;
                _db.Manufacturers.Add(thisManufacturer);
                _db.SaveChanges();
            }
            try
            {
                _db.SaveChanges();
            }
            catch (Exception e) 
            {
                //Do nothing yet
            }
        }

        public db_populater()
        {

        }
    }
}