package model.LibraryStaff;

import java.time.LocalDateTime;


public class ReturnBill599 {
    private int id;

    private LocalDateTime regis_date;
    private int total_amount;
    private String process_staff;
    public ReturnBill599() {
    }

    public ReturnBill599(int id,  LocalDateTime regis_date, int total_amount,String process_staff) {
        this.id = id;
        this.regis_date = regis_date;
        this.total_amount = total_amount;
        this.process_staff = process_staff;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public LocalDateTime getRegis_date() {
        return regis_date;
    }

    public void setRegis_date(LocalDateTime regis_date) {
        this.regis_date = regis_date;
    }

    public int getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(int total_amount) {
        this.total_amount = total_amount;
    }

    public String getProcess_staff() {
        return process_staff;
    }

    public void setProcess_staff(String process_staff) {
        this.process_staff = process_staff;
    }
}
