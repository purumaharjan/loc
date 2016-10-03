package com.project.locksA2Z.server.entities;

import javax.persistence.Entity;

@Entity
public class ShopDetails extends EntityBase{
	private String shopAddress;
	private String shopPhone;
	private String shopEmail;
	private String shopDescription;
	private String shopDeliveryCost;
	
	public String getShopAddress() {
		return shopAddress;
	}
	
	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}
	
	public String getShopPhone() {
		return shopPhone;
	}
	
	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}
	
	public String getShopEmail() {
		return shopEmail;
	}
	
	public void setShopEmail(String shopEmail) {
		this.shopEmail = shopEmail;
	}
	
	public String getShopDescription() {
		return shopDescription;
	}
	
	public void setShopDescription(String shopDescription) {
		this.shopDescription = shopDescription;
	}
	
	public String getShopDeliveryCost() {
		return shopDeliveryCost;
	}
	
	public void setShopDeliveryCost(String shopDeliveryCost) {
		this.shopDeliveryCost = shopDeliveryCost;
	}
}
