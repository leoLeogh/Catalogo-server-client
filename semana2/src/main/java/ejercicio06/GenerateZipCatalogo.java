package ejercicio06;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ejercicio05.MySqlDBConexion;
import ejercicio05.Pais;

public class GenerateZipCatalogo {

	public static void main(String[] args) {
		GenerateZipCatalogo generateZipCatalogo = new GenerateZipCatalogo();
		generateZipCatalogo.procesar();

	}
	public void procesar() {
		ArrayList<Catalogo> catalogos = new ArrayList<Catalogo>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		 try {
	            connection = MySqlDBConexion.getConexion();
	            String query = "SELECT * FROM catalogo";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                int idCatalogo = resultSet.getInt("idCatalogo");
	                String descripcion = resultSet.getString("descripcion");
	                Catalogo catalogo = new Catalogo(idCatalogo, descripcion);
	                catalogos.add(catalogo);
	            }
	           
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                resultSet.close();
	                preparedStatement.close();
	                connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
		 FileWriter fileWriter  = null;
	        try {
	            //Leer el archivo
	            File file = new File("C:/cliente/catalogo.json");
	            fileWriter = new FileWriter(file);

	            // Convertir el objeto a JSON
	            Gson gson = new GsonBuilder().setPrettyPrinting().create();
	            gson.toJson(catalogos, fileWriter);

	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                fileWriter.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        FileWriter fileWriterXML = null;
	        try {
	            fileWriterXML = new FileWriter("C:/cliente/catalogo.xml");
	            XmlMapper xmlMapper = new XmlMapper();
	            xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
	            xmlMapper.writeValue(fileWriterXML, catalogos);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                fileWriterXML.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        String[] files = {"C:/cliente/catalogo.json","C:/cliente/catalogo.xml"};
			
			try {
				ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream("C:/cliente/CatalogoComprimido.zip"));
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
	        System.out.println(catalogos);
	}
}
