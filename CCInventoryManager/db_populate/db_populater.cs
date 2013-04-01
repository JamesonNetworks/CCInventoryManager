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

        public void populateItems() 
        {
            CCINVEntities _db = new CCINVEntities();
            Item thisItem = new Item();

            List<string> FirstWord = new List<string>();
            List<string> SecondWord = new List<string>();

            FirstWord.Add("Small");
            FirstWord.Add("Medium");
            FirstWord.Add("Large");

            SecondWord.Add("Coffee");
            SecondWord.Add("Styrofoam");
            SecondWord.Add("Insulated");

            for (int i = 1; i < 10; i++)
            {
                foreach (string fword in FirstWord)
                {
                    foreach (string sword in SecondWord)
                    {
                        thisItem.Manufacturer_ID = i;
                        thisItem.Name = fword + " " + sword + " cup";
                        _db.Items.Add(thisItem);
                        _db.SaveChanges();
                    }
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