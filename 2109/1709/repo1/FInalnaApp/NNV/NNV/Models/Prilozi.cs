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
    [Table(name: "Prilozi")]
    public class Prilozi
    {
        [Key]
        public int Redni_broj { get; set; }
        public int ID_Dokumenta { get; set; }
        public int ID_Sednice { get; set; }
        public string Putanja { get; set; }
        public bool Poslato{ get; set; }
        public DateTime Datum_slanja { get; set; }
        public virtual Sednice Sednice { get; set; }
        public virtual Dokumentacija Dokumentacijas{ get; set; }
        public virtual Sednice Sednices { get; set; }


    }
   
}