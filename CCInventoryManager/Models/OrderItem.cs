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
    
    public partial class OrderItem
    {
        public Nullable<int> Item_ID { get; set; }
        public Nullable<int> Order_ID { get; set; }
        public int ID { get; set; }
        public Nullable<int> Quantity { get; set; }
    
        public virtual Item Item { get; set; }
        public virtual Order Order { get; set; }
    }
}
