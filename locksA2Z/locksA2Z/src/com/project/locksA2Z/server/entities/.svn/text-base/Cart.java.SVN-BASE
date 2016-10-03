package com.project.locksA2Z.server.entities;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;

@Entity
public class Cart extends EntityBase{
	private Boolean cartSessionId=true;
	private String cartReservedDate;
	private Set<Product> itemLists;
	
	public Boolean getCartSessionId() {
		return cartSessionId;
	}
	
	public void setCartSessionId(Boolean cartSessionId) {
		this.cartSessionId = cartSessionId;
	}

	public String getCartReservedDate() {
		return cartReservedDate;
	}

	public void setCartReservedDate(String cartReservedDate) {
		this.cartReservedDate = cartReservedDate;
	}

	@OneToMany(fetch=FetchType.EAGER)
	@JoinTable(name="cart_product",joinColumns={@JoinColumn(name="cart_id")},inverseJoinColumns={@JoinColumn(name="[product_id")})
	public Set<Product> getItemLists() {
		return itemLists;
	}

	public void setItemLists(Set<Product> itemLists) {
		this.itemLists = itemLists;
	}	
	
//	public int getCount() {
//	    return itemLists.size();
//	}
//	
//	public double getTotal() {
//        if (itemLists.size() == 0) { return 0.0; }
//
//        double total = 0.0;
//
//        for (Iterator<Product> it = itemLists.iterator(); it.hasNext();) {
//            Product item = (Product) it.next();
//            total += (Double.parseDouble(item.getProductPrice()));
//        }
//
//        return total;
//    }
//	
//	public void clearCart() {
//		   itemLists.clear();
//	}
//	
//	public void removeAt(Long index) {
//		itemLists.remove(index);
//	}
//	
//
//    @SuppressWarnings("rawtypes")
//	public void remove(Long itemID) {
//        // loop through list and look for item
//        for (Iterator it = itemLists.iterator(); it.hasNext();) {
//            Product item = (Product) it.next();
//
//            if (item.getId().equals(itemID)) {
//                // found item, remove it from list
//            	itemLists.remove(item);
//
//                return;
//            }
//        }
//    }
//
//	
//	@SuppressWarnings("rawtypes")
//	public void add(Product item) {
//	        // see if this product is already in the cart
//	        for (Iterator it = itemLists.iterator(); it.hasNext();) {
//	        	Product items = (Product) it.next();
//
//	            if (items.getId().equals(item.getId())) {
//	                return;
//	            }
//	        }
//	        itemLists.add(item);
//	 }



}
