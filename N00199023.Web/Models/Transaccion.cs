using N00199023.Web.Models;

namespace N00199023.Web.Models
{
    public class Transaccion
    {
        public int Id { get; set; }
        public int IdCuenta { get; set; }
        public Cuenta Cuenta { get; set; }
        public DateTime Fecha { get; set; }
        public string Descripcion { get; set; }
        public decimal Monto { get; set; }
        public string Tipo { get; set; }
    }
}
