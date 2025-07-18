# Proyecto ASP.NET - Evaluación Técnica Jr (.NET / C#)

Este repositorio contiene una aplicación web desarrollada en ASP.NET Core Razor Pages para mostrar productos vendidos en el año 2019, filtrados por categoría.

---

## 📁 Estructura del Proyecto

├── EvaluacionGD.bak # Respaldo (.bak) de la base de datos SQL Server
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

## 💾 Restaurar la base de datos `EvaluacionGD`

1. **Abrir SQL Server Management Studio (SSMS)**.
2. Conectarse al servidor local (ej. `localhost` o `.\SQLEXPRESS`).
3. Hacer clic derecho sobre "Bases de datos" y seleccionar:  
   **Tareas > Restaurar base de datos...**
4. En "Origen", seleccionar:
   - **Dispositivo**
   - Cargar el archivo `EvaluacionGD.bak`
5. Asignar nombre a la base: `EvaluacionGD` (o el nombre original si lo deseas igual).
6. Confirmar y restaurar.

✅ ¡La base de datos estará lista para usarse!

---

## ⚙️ Configuración del Proyecto ASP.NET (`EvaluacionProductos/`)

1. Abre Visual Studio.
2. Haz clic en **"Abrir un proyecto o solución"**.
3. Selecciona la carpeta `EvaluacionProductos/` y abre la solución.
4. Abre el archivo `appsettings.json` y asegúrate que la cadena de conexión apunte al servidor y base de datos restaurada:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=EvaluacionGD;Trusted_Connection=True;TrustServerCertificate=True;"
}

▶️ Ejecutar el Proyecto
Presiona F5 O en ejecutar (como recomendacion para evitar errores del navegador asegurarse que sea en http: y no https:)

Se abrirá el navegador en http://localhost:XXXX.

Navega a la ruta:

http://localhost:XXXX/Productos


