package com.rm.roaming.dto;

public class ItemImageDto {
	
	private int id;
	private int item_id;
	private String image;
	
	public ItemImageDto() {
		super();
	}

	public ItemImageDto(int id, int item_id, String image) {
		super();
		this.id = id;
		this.item_id = item_id;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

}
