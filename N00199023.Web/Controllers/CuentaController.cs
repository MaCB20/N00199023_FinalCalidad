using Microsoft.AspNetCore.Mvc;
using N00199023.Web.Models;
using N00199023.Web.DB;

namespace N00199023.Web.Controllers
{
    public class CuentaController : Controller
    {
        private readonly DbEntities _dbEntities;
        public CuentaController(DbEntities dbEntities)
        {
            _dbEntities = dbEntities;
        }
        public ActionResult Index()
        {
            ViewBag.ListaCuentas = _dbEntities.cuentas.ToList();
            ViewBag.MontoSoles = CalcularTotalSoles();
            ViewBag.MontoDolares = CalcularTotalDolares();
            ViewBag.Conversion = CalcularTotalDolares() * 3.88m;

            return View();
        }
        [HttpGet]
        public IActionResult Crear()
        {
            ViewBag.Tipos = _dbEntities.tipos.ToList();
            return View(new Cuenta());
        }
        [HttpPost]
        public IActionResult Crear(Cuenta cuenta)
        {
            if (cuenta.Tipo == "Efectivo" || cuenta.Tipo == "Tarjeta de Debito") cuenta.Categoria = "Propio";
            else cuenta.Categoria = "Credito";
            _dbEntities.cuentas.Add(cuenta);
            _dbEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Gasto(int IdCuenta)
        {
            ViewBag.CuentaId = IdCuenta;
            ViewBag.Saldo = _dbEntities.cuentas.FirstOrDefault(o => o.Id == IdCuenta).SaldoInicial;

            return View(new Transaccion());
        }
        [HttpPost]
        public IActionResult Gasto(int IdCuenta, Transaccion transaccion)
        {
            Cuenta cuenta = _dbEntities.cuentas.FirstOrDefault(o => o.Id == IdCuenta);
            
            if (cuenta.Tipo != "Tarjeta de Crédito")
            {
                if (cuenta.SaldoInicial >= transaccion.Monto)
                {
                    transaccion.IdCuenta = IdCuenta;
                    transaccion.Tipo = "Gasto";
                    transaccion.Fecha = DateTime.Now;
                    cuenta.SaldoInicial -= transaccion.Monto;
                    _dbEntities.transaccions.Add(transaccion);
                    _dbEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
                else ModelState.AddModelError("Mensaje", "Saldo Insuficiente");
                ViewBag.CuentaId = IdCuenta;
                ViewBag.Saldo = _dbEntities.cuentas.FirstOrDefault(o => o.Id == IdCuenta).SaldoInicial;
                return View("Gasto", transaccion);
            }
            else 
            {
                transaccion.IdCuenta = IdCuenta;
                transaccion.Tipo = "Gasto";
                transaccion.Fecha = DateTime.Now;
                cuenta.SaldoInicial -= transaccion.Monto;
                _dbEntities.transaccions.Add(transaccion);
                _dbEntities.SaveChanges();
                return RedirectToAction("Index");
            } 
        }
        [HttpGet]
        public IActionResult Ingreso(int IdCuenta)
        {
            ViewBag.CuentaId = IdCuenta;

            return View(new Transaccion());
        }

        [HttpPost]
        public IActionResult Ingreso(int IdCuenta, Transaccion transaccion)
        {
            transaccion.IdCuenta = IdCuenta;
            transaccion.Tipo = "Ingreso";
            transaccion.Fecha = DateTime.Now;

            _dbEntities.transaccions.Add(transaccion);
            _dbEntities.SaveChanges();

            Cuenta cuenta = _dbEntities.cuentas.FirstOrDefault(o => o.Id == IdCuenta);
            cuenta.SaldoInicial += transaccion.Monto;
            _dbEntities.SaveChanges();

            return RedirectToAction("Index");
        }
        public IActionResult Movimientos(int IdCuenta)
        {
            return View();

        }
        public IActionResult VerGastos(int IdCuenta)
        {
            ViewBag.Gastos = _dbEntities.transaccions
                .Where(o => o.IdCuenta == IdCuenta &&  o.Tipo == "Gasto")
                .ToList();

            return View();
        }
        public IActionResult VerIngresos(int IdCuenta)
        {
            ViewBag.Ingresos = _dbEntities.transaccions
                .Where(o => o.IdCuenta == IdCuenta && o.Tipo == "Ingreso")
                .ToList();

            return View();
        }
        public decimal CalcularTotalSoles()
        {
            List<Cuenta> cuentas = _dbEntities.cuentas
                .Where(o => o.Moneda == "Soles" && o.Tipo != "Tarjeta de Credito")
                .ToList();

            decimal monto = 0.0m;
            foreach (var montos in cuentas)
            {
                monto += montos.SaldoInicial;
            }
            return monto;
        }
        public decimal CalcularTotalDolares()
        {
            List<Cuenta> cuentas = _dbEntities.cuentas
                .Where(o => o.Moneda == "Dolares" && o.Tipo != "Tarjeta de Credito")
                .ToList();

            decimal monto = 0.0m;
            foreach (var montos in cuentas)
            {
                monto += montos.SaldoInicial;
            }
            return monto;
        }
    }   
}
