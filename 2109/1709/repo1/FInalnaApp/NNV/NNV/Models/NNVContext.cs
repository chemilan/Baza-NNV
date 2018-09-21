using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Reflection;
using System.Data;
using System.Data.Linq.Mapping;
using System.Linq.Expressions;
using System.ComponentModel;


namespace NNV.Models

     

   
{
    [Table(Name = "Clanovi")]
    public class Login
    {
        [Column(IsPrimaryKey = false, IsDbGenerated = false)]
        public int Id { get; set; }
        [Column]
        public string Korisnicko_ime { get; set; }
        [Column]
        public string Lozinka { get; set; }
    }













    [Database]
    public class NNVContext : DbContext
    

    {
        public NNVContext() : base("NNV.Properties.Settings.Setting1") { }
        public DbSet<Clanovi>Clanovis {get; set; }
        public DbSet<Prisustvo> Prisustvos { get; set; }
        public DbSet<Sednice> Sednices { get; set; }
        public DbSet<Prilozi> Prilozis { get; set; }
        public DbSet<Dokumentacija> Dokumentacijas { get; set; }

    }
}