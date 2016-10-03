package com.project.locksA2Z.server.entities;



import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;


@Entity
public class Orders extends EntityBase{
	@Transient
	private String name;
	private String orderDate;
	private String orderLastUpdate;
	private String orderStatus;
	private String orderMemo;
	private String orderDeliveryFirstname;
	private String orderDeliveryLastName;
	private String orderDeliveryAddress;
	private String orderDeliveryCost;
	private User user;
	private Set<Product> orderProducts;
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderLastUpdate() {
		return orderLastUpdate;
	}
	public void setOrderLastUpdate(String orderLastUpdate) {
		this.orderLastUpdate = orderLastUpdate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public String getOrderDeliveryFirstname() {
		return orderDeliveryFirstname;
	}
	public void setOrderDeliveryFirstname(String orderDeliveryFirstname) {
		this.orderDeliveryFirstname = orderDeliveryFirstname;
	}
	public String getOrderDeliveryLastName() {
		return orderDeliveryLastName;
	}
	public void setOrderDeliveryLastName(String orderDeliveryLastName) {
		this.orderDeliveryLastName = orderDeliveryLastName;
	}
	public String getOrderDeliveryAddress() {
		return orderDeliveryAddress;
	}
	public void setOrderDeliveryAddress(String orderDeliveryAddress) {
		this.orderDeliveryAddress = orderDeliveryAddress;
	}
	public String getOrderDeliveryCost() {
		return orderDeliveryCost;
	}
	public void setOrderDeliveryCost(String orderDeliveryCost) {
		this.orderDeliveryCost = orderDeliveryCost;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="orders_product",joinColumns={@JoinColumn(name="orders_id")},inverseJoinColumns={@JoinColumn(name="[product_id")})
	public Set<Product> getOrderProducts() {
		return orderProducts;
	}
	public void setOrderProducts(Set<Product> orderProducts) {
		this.orderProducts = orderProducts;
	}
	
	@Override
	@Transient
	public String getName(){
		return name;
	}
	
	@Override
	public void setName(String name){
		this.name=name;
	}
}
