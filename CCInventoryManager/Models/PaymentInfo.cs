//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CCInventoryManager.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PaymentInfo
    {
        public PaymentInfo()
        {
            this.Orders = new HashSet<Order>();
        }
    
        public int ID { get; set; }
        public string Method { get; set; }
        public string CC { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Customer_ID { get; set; }
    
        public virtual ICollection<Order> Orders { get; set; }
    }
}
