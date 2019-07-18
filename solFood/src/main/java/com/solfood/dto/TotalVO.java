/*
 * 	CART, PRODUCT, ACCOUNT 의 컬럼이 모두 들어있는 VO
 */

package com.solfood.dto;

import java.sql.Date;

public class TotalVO {
	// PRODUCT
	private int 	product_id;
    private String	product_name;
    private String 	product_category1;
    private String 	product_category2;
    private int 	product_price;
    private int 	product_discountrate;
    private int 	product_count;
    private String 	product_image;
    private int 	product_package;
    private int 	product_ea;
    private String 	product_content;
    private Date 	product_date;
    
    // ACCOUNT 
    private String account_user;
	private String account_password;
	private String account_name;
	private Date account_date;
	private String account_tel;
	private String account_address;
	private int account_grade;
	private int account_age;
	private String account_gender;
	private String account_email;
	
	// CART
	private int 	cart_id;
	private String 	cart_date;
	private int		cart_count;
	
	// BUY
	private int 	buy_id;
	private String 	buy_date;
	private int 	buy_count;
	
	
	
	// GETTERS AND SETTERS
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_category1() {
		return product_category1;
	}
	public void setProduct_category1(String product_category1) {
		this.product_category1 = product_category1;
	}
	public String getProduct_category2() {
		return product_category2;
	}
	public void setProduct_category2(String product_category2) {
		this.product_category2 = product_category2;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_discountrate() {
		return product_discountrate;
	}
	public void setProduct_discountrate(int product_discountrate) {
		this.product_discountrate = product_discountrate;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_package() {
		return product_package;
	}
	public void setProduct_package(int product_package) {
		this.product_package = product_package;
	}
	public int getProduct_ea() {
		return product_ea;
	}
	public void setProduct_ea(int product_ea) {
		this.product_ea = product_ea;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public String getAccount_user() {
		return account_user;
	}
	public void setAccount_user(String account_user) {
		this.account_user = account_user;
	}
	public String getAccount_password() {
		return account_password;
	}
	public void setAccount_password(String account_password) {
		this.account_password = account_password;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}
	public String getAccount_tel() {
		return account_tel;
	}
	public void setAccount_tel(String account_tel) {
		this.account_tel = account_tel;
	}
	public String getAccount_address() {
		return account_address;
	}
	public void setAccount_address(String account_address) {
		this.account_address = account_address;
	}
	public int getAccount_grade() {
		return account_grade;
	}
	public void setAccount_grade(int account_grade) {
		this.account_grade = account_grade;
	}
	public int getAccount_age() {
		return account_age;
	}
	public void setAccount_age(int account_age) {
		this.account_age = account_age;
	}
	public String getAccount_gender() {
		return account_gender;
	}
	public void setAccount_gender(String account_gender) {
		this.account_gender = account_gender;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
}
