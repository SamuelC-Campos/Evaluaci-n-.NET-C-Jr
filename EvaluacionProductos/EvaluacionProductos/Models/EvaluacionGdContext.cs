using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EvaluacionProductos.Models;

public partial class EvaluacionGdContext : DbContext
{
    public EvaluacionGdContext()
    {
    }

    public EvaluacionGdContext(DbContextOptions<EvaluacionGdContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Categorium> Categoria { get; set; }

    public virtual DbSet<Producto> Productos { get; set; }

    public virtual DbSet<Ventum> Venta { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer("Data Source=localhost;Database=EvaluacionGD;Trusted_Connection=True;TrustServerCertificate=True;");
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Categorium>(entity =>
        {
            entity.HasKey(e => e.CodigoCategoria).HasName("PK__Categori__3CEE2F4CAEFE2791");

            entity.Property(e => e.CodigoCategoria).ValueGeneratedNever();
            entity.Property(e => e.Nombre).HasMaxLength(100);
        });

        modelBuilder.Entity<Producto>(entity =>
        {
            entity.HasKey(e => e.CodigoProducto).HasName("PK__Producto__785B009EF8FF00EE");

            entity.ToTable("Producto");

            entity.Property(e => e.CodigoProducto).ValueGeneratedNever();
            entity.Property(e => e.Nombre).HasMaxLength(100);

            entity.HasOne(d => d.CodigoCategoriaNavigation).WithMany(p => p.Productos)
                .HasForeignKey(d => d.CodigoCategoria)
                .HasConstraintName("FK__Producto__Codigo__398D8EEE");
        });

        modelBuilder.Entity<Ventum>(entity =>
        {
            entity.HasKey(e => e.CodigoVenta).HasName("PK__Venta__F2421464469CD844");

            entity.Property(e => e.CodigoVenta).ValueGeneratedNever();

            entity.HasOne(d => d.CodigoProductoNavigation).WithMany(p => p.Venta)
                .HasForeignKey(d => d.CodigoProducto)
                .HasConstraintName("FK__Venta__CodigoPro__3C69FB99");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
