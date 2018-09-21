using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace NNV.Models
{
    [Table(name: "Dokumentacija")]
    public class Dokumentacija
    {

        [Key]
        public int ID_Dokumenta { get; set; }
        public string Naziv_Dokumenta { get; set; }
        public virtual ICollection<Prilozi> Prilozis { get; set; }
    }
}