package model.LibraryStaff;

import java.sql.Date;

public class ReturnDetails599 {
    private int id;
    private int borrow_return_id;
    private Document599 document599;
    private ReturnBill599 returnBill599;
    private Date borrow_date;
    private Date return_date;
    private Date actual_return_date;
    private int fine_amount;
    private String fine_reason;
    private int quantity_borrowed;
    private int status;
    public ReturnDetails599() {
    }

    public ReturnDetails599(int id, int borrow_return_id, Document599 document599, ReturnBill599 returnBill599, Date borrow_date, Date return_date, Date actual_return_date, int fine_amount, String fine_reason, int quantity_borrowed, int status) {
        this.id = id;
        this.borrow_return_id = borrow_return_id;
        this.document599 = document599;
        this.returnBill599 = returnBill599;
        this.borrow_date = borrow_date;
        this.return_date = return_date;
        this.actual_return_date = actual_return_date;
        this.fine_amount = fine_amount;
        this.fine_reason = fine_reason;
        this.quantity_borrowed = quantity_borrowed;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBorrow_return_id() {
        return borrow_return_id;
    }

    public void setBorrow_return_id(int borrow_return_id) {
        this.borrow_return_id = borrow_return_id;
    }

    public Document599 getDocument599() {
        return document599;
    }

    public void setDocument599(Document599 document599) {
        this.document599 = document599;
    }

    public ReturnBill599 getReturnBill599() {
        return returnBill599;
    }

    public void setReturnBill599(ReturnBill599 returnBill599) {
        this.returnBill599 = returnBill599;
    }

    public Date getBorrow_date() {
        return borrow_date;
    }

    public void setBorrow_date(Date borrow_date) {
        this.borrow_date = borrow_date;
    }

    public Date getReturn_date() {
        return return_date;
    }

    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }

    public Date getActual_return_date() {
        return actual_return_date;
    }

    public void setActual_return_date(Date actual_return_date) {
        this.actual_return_date = actual_return_date;
    }

    public int getFine_amount() {
        return fine_amount;
    }

    public void setFine_amount(int fine_amount) {
        this.fine_amount = fine_amount;
    }

    public String getFine_reason() {
        return fine_reason;
    }

    public void setFine_reason(String fine_reason) {
        this.fine_reason = fine_reason;
    }

    public int getQuantity_borrowed() {
        return quantity_borrowed;
    }

    public void setQuantity_borrowed(int quantity_borrowed) {
        this.quantity_borrowed = quantity_borrowed;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
