package ejercicio06;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.Socket;

import ejercicio05.GenerateZipPais;

public class ClienteZipCatalogo {

	public static void main(String[] args) {
		new ClienteZipCatalogo();

	}
	
	private final int PORT = 13;
	private final String HOST = "localhost";
	
	public ClienteZipCatalogo(){
		System.out.println("1 Generando archivos JSON, XML y ZIP");
        GenerateZipCatalogo generateZipCatalogo = new GenerateZipCatalogo();
        generateZipCatalogo.procesar();
        

        //PASO 2 Crear el Socket CLiente
        try {
            System.out.println("2 Client started");
            Socket socket = new Socket(HOST, PORT);
            System.out.println("3 Connected to server");

            //PASO 3 Enviar el archivo ZIP
            //Fllujos para enviar y recibir archivos
            File file = new File("C:/cliente/CatalogoComprimido.zip");
            FileInputStream fis = new FileInputStream(file);
            DataOutputStream salida = new DataOutputStream(socket.getOutputStream());
            
            //enviar archivo
            int byteLeidos = 0;
            while ((byteLeidos = fis.read()) != -1) {
                salida.write(byteLeidos);
            }
            System.out.println("3 File sent");
            fis.close();
            salida.close();
            System.out.println("4 Client finished");
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }    
	}

}
