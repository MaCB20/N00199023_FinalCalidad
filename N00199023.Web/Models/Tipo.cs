using N00199023.Web.Models;

namespace N00199023.Web.Models
{
    public class Tipo
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int IdCategoria { get; set; }
        public Categoria Categoria { get; set; }
    }
}
