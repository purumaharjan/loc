package com.project.locksA2Z.server.entities;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class Product extends EntityBase {

	private String productBarCodeId;
	private String productType;
	private String productDescription;
	private String productPrice;
	private String productQuantity;
	private String productImage;
	private CommonsMultipartFile fileData;
	private String productAddedDate;
	private String productLeverDesign;
	private String productFinishColor;
	private String productKeyTypes;
	private String productBackSets;
	private String productGrade;

	private Category category;

	public String getProductBarCodeId() {
		return productBarCodeId;
	}

	public void setProductBarCodeId(String productBarCodeId) {
		this.productBarCodeId = productBarCodeId;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductAddedDate() {
		return productAddedDate;
	}

	public void setProductAddedDate(String productAddedDate) {
		this.productAddedDate = productAddedDate;
	}

	@ManyToOne
	@JoinColumn(name = "categoryId")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductLeverDesign() {
		return productLeverDesign;
	}

	public void setProductLeverDesign(String productLeverDesign) {
		this.productLeverDesign = productLeverDesign;
	}

	public String getProductFinishColor() {
		return productFinishColor;
	}

	public void setProductFinishColor(String productFinishColor) {
		this.productFinishColor = productFinishColor;
	}

	public String getProductKeyTypes() {
		return productKeyTypes;
	}

	public void setProductKeyTypes(String productKeyTypes) {
		this.productKeyTypes = productKeyTypes;
	}

	public String getProductBackSets() {
		return productBackSets;
	}

	public void setProductBackSets(String productBackSets) {
		this.productBackSets = productBackSets;
	}

	public String getProductGrade() {
		return productGrade;
	}

	public void setProductGrade(String productGrade) {
		this.productGrade = productGrade;
	}

	@Transient
	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
}
