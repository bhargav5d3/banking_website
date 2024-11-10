package dto_layer;

import java.time.LocalDateTime;

public class Transaction {
    private long senderAccoNo;
    private long receiverAccoNo;
    private double amount;
    private String senderType;  // Use "DEBIT" or "CREDIT"
    private String receverType;  // Use "DEBIT" or "CREDIT"
    private LocalDateTime transactionDate;
    
    
	public Transaction(long senderAccoNo, long receiverAccoNo, double amount, String senderType,
			String receverType, LocalDateTime transactionDate) {
		super();
		this.senderAccoNo = senderAccoNo;
		this.receiverAccoNo = receiverAccoNo;
		this.amount = amount;
		this.senderType = senderType;
		this.receverType = receverType;
		this.transactionDate = transactionDate;
	}
	
	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getSenderAccoNo() {
		return senderAccoNo;
	}
	public void setSenderAccoNo(long senderAccoNo) {
		this.senderAccoNo = senderAccoNo;
	}
	public long getReceiverAccoNo() {
		return receiverAccoNo;
	}
	public void setReceiverAccoNo(long receiverAccoNo) {
		this.receiverAccoNo = receiverAccoNo;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getSenderType() {
		return senderType;
	}
	public void setSenderType(String senderType) {
		this.senderType = senderType;
	}
	public String getReceverType() {
		return receverType;
	}
	public void setReceverType(String receverType) {
		this.receverType = receverType;
	}
	public LocalDateTime getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(LocalDateTime transactionDate) {
		this.transactionDate = transactionDate;
	}
    
    

    
	

}
