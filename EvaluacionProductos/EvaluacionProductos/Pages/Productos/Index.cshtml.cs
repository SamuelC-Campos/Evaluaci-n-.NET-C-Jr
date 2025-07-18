using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EvaluacionProductos.Models;

namespace EvaluacionProductos.Pages.Productos
{
    public class IndexModel : PageModel
    {
        private readonly EvaluacionGdContext _context;

        public IndexModel(EvaluacionGdContext context)
        {
            _context = context;
        }

        [BindProperty(SupportsGet = true)]
        public int? CategoriaSeleccionadaId { get; set; }

        public List<Producto> Productos { get; set; } = new();

        public SelectList CategoriasSelectList { get; set; }

        public async Task OnGetAsync()
        {
            // Obtener las categorías con ventas en 2019
            var categorias = await _context.Categoria
                .Where(c => c.Productos.Any(p => p.Venta.Any(v => v.Fecha.Year == 2019)))
                .ToListAsync();

            CategoriasSelectList = new SelectList(categorias, "CodigoCategoria", "Nombre");

            if (CategoriaSeleccionadaId.HasValue)
            {
                Productos = await _context.Productos
                    .Where(p => p.CodigoCategoria == CategoriaSeleccionadaId)
                    .Where(p => p.Venta.Any(v => v.Fecha.Year == 2019))
                    .ToListAsync();
            }
        }
    }
}
