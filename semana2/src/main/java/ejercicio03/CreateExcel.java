package ejercicio03;

import java.io.FileOutputStream;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class CreateExcel {

	public static void main(String[] args) {
		Producto producto1 = new Producto(1,"Laptop",2100.0,10);
		Producto producto2 = new Producto(2,"Impresora",2100.0,10);
		Producto producto3 = new Producto(3,"Mouse",2100.0,10);
		
		ArrayList<Producto> productos = new ArrayList<Producto>();
		productos.add(producto1);
		productos.add(producto2);
		productos.add(producto3);
		
		System.out.println(productos);
		
		String[] HEADERS = {"ID PRODUCTO","Nombre","Precio", "Stock"};
		String SHEET_NAME = "productos";
		 int[] COLUMN_WIDTHS = { 3000, 7000, 3000, 3000 };

	        try {
	            FileOutputStream fileOut = new FileOutputStream("C:/cliente/productos_flores_G2.xlsx");
	            Workbook workbook = new XSSFWorkbook();
	            Sheet sheet = workbook.createSheet(SHEET_NAME);

	            // Establecer el ancho de las columnas
	            for (int i = 0; i < COLUMN_WIDTHS.length; i++) {
	                sheet.setColumnWidth(i, COLUMN_WIDTHS[i]);
	            }

	            // Crear la fila de encabezado
	            Row headerRow = sheet.createRow(0);
	            for (int i = 0; i < HEADERS.length; i++) {
	                headerRow.createCell(i).setCellValue(HEADERS[i]);
	            }

	            // Crear las filas de los productos
	            for (int i = 0; i < productos.size(); i++) {
	                Producto producto = productos.get(i);
	                sheet.createRow(i + 1).createCell(0).setCellValue(producto.getIdProducto());
	                sheet.getRow(i + 1).createCell(1).setCellValue(producto.getNombre());
	                sheet.getRow(i + 1).createCell(2).setCellValue(producto.getPrecio());
	                sheet.getRow(i + 1).createCell(3).setCellValue(producto.getStock());
	            }
	            workbook.write(fileOut);
	            fileOut.close();
	            workbook.close();
	        } catch (Exception e) {
	           e.printStackTrace();
	        } finally {
	         
	        }
		
	}

}
