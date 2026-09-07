-- Consulta 1
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- Consulta 2
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

-- Consulta 3
SELECT 
    id_cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1
ORDER BY total_gastado DESC;

-- Consulta 4
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) >= 3103.00 THEN 'Por encima'
        ELSE 'Por debajo'
    END AS rendimiento_mensual
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- ANALIS DE DATOS:

-- 1. El producto Laptop Pro 15 es el que genera más dinero en total ($3,600.00), 
--  principalmente porque tiene el precio más alto ($1,200.00).

-- 2. Todos los clientes registrados del id 1 al 5 realizó exactamente 2 pedidos
--  y tienen potencial para aumentar la frecuencia de compra.

-- 3. En el mes marzo se concentran todas las ventas registradas, alcanzando una 
-- facturación total de $3,103.00. Este dato se podra utilizar para comparar el creciomiento o no de los próximos meses.