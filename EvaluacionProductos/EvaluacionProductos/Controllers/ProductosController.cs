using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EvaluacionProductos.Models;

namespace EvaluacionProductos.Controllers
{
    public class ProductosController : Controller
    {
        private readonly EvaluacionGdContext _context;

        public ProductosController(EvaluacionGdContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int? categoriaId)
        {
            // Obtener solo categorías que tuvieron ventas en 2019
            var categoriasConVentas2019 = await _context.Categoria
                .Where(c => c.Productos
                    .Any(p => p.Venta
                        .Any(v => v.Fecha.Year == 2019)))
                .ToListAsync();

            ViewBag.Categorias = new SelectList(categoriasConVentas2019, "CodigoCategoria", "Nombre");

            var productos = new List<Producto>();

            if (categoriaId.HasValue)
            {
                productos = await _context.Productos
                    .Where(p => p.CodigoCategoria == categoriaId)
                    .Where(p => p.Venta.Any(v => v.Fecha.Year == 2019))
                    .ToListAsync();
            }

            return View(productos);
        }
    }
}
