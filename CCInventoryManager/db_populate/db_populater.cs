using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CCInventoryManager.Models;

namespace CCInventoryManager.db_populate
{
    public class db_populater
    {
        public void populate() 
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
                    _db.Customers.(thisCustomer);
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

        public db_populater()
        {

        }
    }
}