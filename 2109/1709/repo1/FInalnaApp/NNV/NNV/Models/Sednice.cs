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
    [Table(name: "Sednice")]
    public class Sednice
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID_Sednice { get; set; }
        public DateTime Datum { get; set; }
        public bool Vrsta_redovna { get; set; }
        public string Ucionica { get; set; }
        [DataType(DataType.MultilineText)]
        public string Zapisnik { get; set; }
        public string Poziv { get; set; }
        public virtual ICollection<Prisustvo>Prisustvos { get; set; }
        public virtual ICollection<Prilozi> Prilozis{ get; set; }
    }


}