package com.solfood.dto;
import java.sql.Date;

public class BuyVO {
	private int buy_id;
	private int buy_price;
	private Date buy_date;
	private String buy_address;
	private int buy_tel;
	private String buy_delivery;
	private String account_user;
	private int product_id;
	private int product_count;
	
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_address() {
		return buy_address;
	}
	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}
	public int getBuy_tel() {
		return buy_tel;
	}
	public void setBuy_tel(int buy_tel) {
		this.buy_tel = buy_tel;
	}
	public String getBuy_delivery() {
		return buy_delivery;
	}
	public void setBuy_delivery(String buy_delivery) {
		this.buy_delivery = buy_delivery;
	}
	public String getAccount_user() {
		return account_user;
	}
	public void setAccount_user(String account_user) {
		this.account_user = account_user;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
}
