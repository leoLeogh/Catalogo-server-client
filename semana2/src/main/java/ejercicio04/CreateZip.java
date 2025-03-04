package ejercicio04;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class CreateZip {

	public static void main(String[] args) {
		String[] files = {"C:/cliente/autos_flores_G2.json","C:/cliente/clientes_flores_G2.xml"};
		
		try {
			ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream("C:/cliente/comprimido.zip"));
			for(String ruta : files) {
				System.out.println("agregando archivo" + ruta);
				
				File file = new File(ruta);				
				FileInputStream fis = new FileInputStream(file);
                
                //Crear un archivo en el zip
                ZipEntry zipEntry = new ZipEntry(file.getName());
                zipOut.putNextEntry(zipEntry);

                //Escribir el contenido del archivo
                int byteLeidos = 0;
                while( (byteLeidos = fis.read()) != -1){
                    zipOut.write(byteLeidos);
                }
                
                fis.close();
                zipOut.closeEntry();
            }
            zipOut.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
