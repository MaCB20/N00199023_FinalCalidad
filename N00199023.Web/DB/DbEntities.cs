using Microsoft.EntityFrameworkCore;
using N00199023.Web.DB.Mapping;
using N00199023.Web.Models;

namespace N00199023.Web.DB
{
    public class DbEntities : DbContext
    {
        public DbSet<Cuenta> cuentas { get; set; }
        public DbSet<Tipo> tipos { get; set; }
        public DbSet<Transaccion> transaccions { get; set; }
        public DbSet<Categoria> categorias { get; set; }
        public DbEntities() { }
        public DbEntities(DbContextOptions<DbEntities> options) : base(options) { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.ApplyConfiguration(new CuentaMapping());
            modelBuilder.ApplyConfiguration(new TipoMapping());
            modelBuilder.ApplyConfiguration(new TransaccionMapping());
            modelBuilder.ApplyConfiguration(new CategoriaMapping());
        }
    }
}
