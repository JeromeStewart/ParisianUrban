//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ParisianUrban.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class PropertyManager
    {
        [Display(Name = "ID")]
        public int PmID { get; set; }

        [Display(Name = "Name")]
        public string PmName { get; set; }

        [Display(Name = "Email")]
        public string PmEmail { get; set; }

        [Display(Name = "Password")]
        public string PmPassword { get; set; }
    }
}
