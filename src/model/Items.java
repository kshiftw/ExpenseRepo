package model;

import java.time.LocalDate;

public class Items {
	private int itemId;
	private LocalDate date;
	private double amount;
	private String description;
	private String category;
	private String itemType;
	private String user;
	
	public Items (int id, LocalDate date, double amount, String description, String category, String itemType, String user) {
		this.itemId = id;
		this.date = date;
		this.amount = amount;
		this.description = description;
		this.category = category;
		this.itemType = itemType;
		this.user = user;
	}

	public Items (int id, LocalDate date, double amount, String description, String category, String itemType) {
		this.itemId = id;
		this.date = date;
		this.amount = amount;
		this.description = description;
		this.category = category;
		this.itemType = itemType;
	}
	
	public int getID() {
		return itemId;
	}
	
	public LocalDate getDate() {
		return date;
	}
	
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getItemType() {
		return itemType;
	}
	
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	
}
