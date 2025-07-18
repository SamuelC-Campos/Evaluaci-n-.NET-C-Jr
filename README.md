# Proyecto ASP.NET - Evaluación Técnica Jr (.NET / C#)

Este repositorio contiene una aplicación web desarrollada en ASP.NET Core Razor Pages para mostrar productos vendidos en el año 2019, filtrados por categoría.

---

## 📁 Estructura del Proyecto

├── scriptsSQL (.sql) de la base de datos SQL Server

└── EvaluacionProductos/ # Proyecto ASP.NET Razor Pages

---

## 🧰 Requisitos

### Software necesario:

- Visual Studio 2022 o superior ✅
- .NET 8 SDK o compatible ✅
- SQL Server (Express o Developer Edition) ✅
- SQL Server Management Studio (SSMS) ✅
- Sistema operativo: Windows

---

## 🛠️ Configuración de la base de datos con `scripsSQL.sql`

1. Abre **SQL Server Management Studio (SSMS)**.
2. Conéctate a tu servidor local (por ejemplo, `localhost`).
3. Crea una nueva consulta (Ctrl + N).
4. Abre y ejecuta el archivo `scriptsSQL.sql` (incluido en este repositorio).
5. Verifica que se haya creado la base de datos con el nombre `EvaluacionGD2`.

✅ ¡Base de datos lista para usar!

---

## ⚙️ Configuración del Proyecto ASP.NET (`EvaluacionProductos/`)

1. Abre Visual Studio.
2. Haz clic en **"Abrir un proyecto o solución"**.
3. Selecciona la carpeta `EvaluacionProductos/` y abre la solución.
4. Abre el archivo `appsettings.json` y asegúrate que la cadena de conexión apunte al servidor y base de datos restaurada:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=EvaluacionGD2;Trusted_Connection=True;TrustServerCertificate=True;"
}

▶️ Ejecutar el Proyecto
Presiona F5 O en ejecutar (como recomendacion para evitar errores del navegador asegurarse que sea en http: y no https:)

Se abrirá el navegador en http://localhost:XXXX.

Navega a la ruta:

http://localhost:XXXX/Productos


