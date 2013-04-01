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
    
    public partial class Item
    {
        public Item()
        {
            this.Inventories = new HashSet<Inventory>();
        }
    
        public int ID { get; set; }
        public Nullable<int> Order_ID { get; set; }
        public Nullable<int> Manufacturer_ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Inventory> Inventories { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
    }
}
