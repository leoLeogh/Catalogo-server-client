package ejercicio02;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

public class CreateXML {

    public static void main(String[] args) {
        
        Cliente cliente1 = new Cliente(1, "Leonardo", "Flores", "12345678");
        Cliente cliente2 = new Cliente(2, "Luis", "Rojas", "87654321");
        Cliente cliente3 = new Cliente(3, "Melqui", "davila", "45678912");
        Cliente cliente4 = new Cliente(3, "Jefferson", "rivera", "45678912");
        Cliente cliente5 = new Cliente(3, "Dulce", "Toledo", "45678912");
        Cliente cliente6 = new Cliente(3, "Giampere", "escriba", "45678912");
        Cliente cliente7 = new Cliente(3, "Hearly", "Perez", "45678912");
        Cliente cliente8 = new Cliente(3, "Jose", "meza", "45678912");

        ArrayList<Cliente> clientes = new ArrayList<Cliente>();
        clientes.add(cliente1);
        clientes.add(cliente2);
        clientes.add(cliente3);
        clientes.add(cliente4);
        clientes.add(cliente5);
        clientes.add(cliente6);
        clientes.add(cliente7);
        clientes.add(cliente8);

        System.out.println(clientes);

        FileWriter fileWriter  = null;
        try {
            File file = new File("C:/cliente/clientes_flores_G2.xml");
            fileWriter = new FileWriter(file);

            XmlMapper xmlMapper = new XmlMapper();
            xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
            xmlMapper.writeValue(fileWriter, clientes);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fileWriter.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }
}
