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
    [Table(name: "Clanovi")]
    public class Clanovi
    {
        [Key]
        public int ID_Clana { get; set; }
        public string Ime_i_prezime { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }
        public string Korisnicko_ime { get; set; }
        public string Lozinka { get; set; }
        public virtual ICollection<Prisustvo> Prisustvos { get; set; }
    }
}