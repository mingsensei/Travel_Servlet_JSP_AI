
import com.servlet.tiasm.repository.HotelDAO;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author macos
 */
public class Test {
    public static void main(String[] args) {
        HotelDAO hd = new HotelDAO();
        if(hd.read(1) == null){
            System.out.println("null");
        }
        
    }
}
