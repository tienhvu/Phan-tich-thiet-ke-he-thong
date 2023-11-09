package model.Reader;

import java.sql.Date;

public class ReaderCard599 {
    private int id;
    private int reader_id;
    private String student_class;
    private String student_code;
    private Date regis_date;
    private String gender;


    public ReaderCard599() {
    }

    public ReaderCard599(int reader_id, String student_class, String student_code, Date regis_date, String gender) {

        this.reader_id = reader_id;
        this.student_class = student_class;
        this.student_code = student_code;
        this.regis_date = regis_date;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReader_id() {
        return reader_id;
    }

    public void setReader_id(int reader_id) {
        this.reader_id = reader_id;
    }

    public String getStudent_class() {
        return student_class;
    }

    public void setStudent_class(String student_class) {
        this.student_class = student_class;
    }

    public String getStudent_code() {
        return student_code;
    }

    public void setStudent_code(String student_code) {
        this.student_code = student_code;
    }

    public Date getRegis_date() {
        return regis_date;
    }

    public void setRegis_date(Date regis_date) {
        this.regis_date = regis_date;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
