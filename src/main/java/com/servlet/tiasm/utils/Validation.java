package utils;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Scanner;
    // Tien 3/3/2025
// test thoi e khoa
public class Validation {
    
    private static Scanner scanner = new Scanner(System.in);
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    public static String getString(String prompt) {
        System.out.print(prompt);
        return scanner.nextLine();
    }

    public static LocalTime getTime(String prompt) {
        System.out.print(prompt);
        String timeStr = scanner.nextLine();
        return LocalTime.parse(timeStr);
    }

    public static LocalDate parseDate(String dateString) {
        return LocalDate.parse(dateString, DATE_FORMATTER);
    }

    public static String localDateToString(LocalDate date) {
        return date.format(DATE_FORMATTER);
    }

    public static boolean validateString(String input, String errorMsg) {
        if (input.isEmpty()) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validateInteger(int number, String errorMsg, int minValue) {
        if (number < minValue) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validateDouble(double number, String errorMsg, double minValue) {
        if (number < minValue) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validateEmail(String email, String errorMsg) {
        if (!email.contains("@") || !email.contains(".")) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validatePhoneNumber(String phone, String errorMsg) {
        if (phone.length() != 10) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validateOpeningClosingHours(LocalTime openingTime, LocalTime closingTime, String errorMsg) {
        if (closingTime.isBefore(openingTime)) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static LocalDate validateStartDate(LocalDate bookingDate, String prompt, String errorMsg) {
        if (bookingDate == null) {
            printErrorMessage(errorMsg);
        }
        return bookingDate;
    }

    public static LocalDate validateEndDate(LocalDate startDate, String prompt, String errorMsg) {
        if (startDate == null) {
            printErrorMessage(errorMsg);
        }
        return startDate;
    }

    public static LocalDate validateBookingDate(String prompt, String errorMsg) {
        String dateStr = getString(prompt);
        LocalDate date = parseDate(dateStr);
        if (date == null) {
            printErrorMessage(errorMsg);
        }
        return date;
    }

    public static boolean validateList(List<String> list, String errorMsg) {
        if (list == null || list.isEmpty()) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    public static boolean validateAddress(String city, String district, String street, String streetNumber, List<String> moreDetail, String errorMsg) {
        if (city.isEmpty() || district.isEmpty() || street.isEmpty() || streetNumber.isEmpty()) {
            printErrorMessage(errorMsg);
            return false;
        }
        return true;
    }

    private static void printErrorMessage(String message) {
        System.out.println("Lỗi: " + message);
    }
    
    public static int checkInteger(String inputMsg, String errorMsg, int lower){
        int n;
        while(true){
            try {
                System.out.print(inputMsg);
                n = Integer.parseInt(scanner.nextLine());
 
                if(n > lower){
                    return n;
                }else{
                    System.out.println("Value must be greater or equal than : "+ lower);
                }
            } catch (Exception e){
                System.out.println(errorMsg);
            }
        }
    }
    public static int checkIntergerMinMax(String inputMsg,String errorMsg, int lower, int maxer){
        int n;
        while(true){
            try{
                System.out.print(inputMsg);
                n = Integer.parseInt(scanner.nextLine());
                
                if(n>lower && n<maxer){
                    return n;
                }else{
                    System.out.println("Value must be in "+lower+"and "+maxer);
                }
            } catch(Exception e){
                System.out.println(errorMsg);
            }
        }
    }
    
    public static double checkDouble(String inputMsg, String errorMsg, double lower){
        double n;
        while(true){
            try{
                System.out.print(inputMsg);
                n= Double.parseDouble(scanner.nextLine());
                if (n > lower){
                    return n;
                }else {
                    System.out.println("Value must be greater or equal than : "+ lower);
                }
            } catch(Exception e){
                System.out.println(errorMsg);
            }
        }
    }
    
    public static String checkString(String inputMsg, String errorMsg){
        String n;
        while( true){
            System.out.print(inputMsg);
            n= scanner.nextLine().trim().toUpperCase();
            if(n.length()== 0 || n.isEmpty()){
                System.out.println(errorMsg);
            }else {
                return n;
            }
        }
    }
    
    public static String checkStringCondition(String inputMsg, String errorMsg, String condition){
        String n;
        while(true){
            System.out.print(inputMsg);
            n = scanner.nextLine().trim(); 
            if(n.length() ==0 || n.isEmpty() || !n.matches(condition)){
                System.out.println(errorMsg);
            }else{
                return n;
            }
        }
    }
}
