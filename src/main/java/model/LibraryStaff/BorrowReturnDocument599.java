package model.LibraryStaff;

import model.Reader.ReaderCard599;

public class BorrowReturnDocument599 {
    private int id;
    private ReaderCard599 readerCard599;


    public BorrowReturnDocument599() {
    }

    public BorrowReturnDocument599(int id, ReaderCard599 readerCard599) {
        this.id = id;
        this.readerCard599 = readerCard599;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ReaderCard599 getReaderCard599() {
        return readerCard599;
    }

    public void setReaderCard599(ReaderCard599 readerCard599) {
        this.readerCard599 = readerCard599;
    }



}
