package com.tr;

public class Model {

	private String name; // 类名
	private String modelName; // 类名首字母小写形式
	private String nameLower; // 类名全小写形式
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	
	public String getNameLower() {
		if (nameLower == null) {
			if (name != null) {
				nameLower = name.toLowerCase();
			}
		}
		return nameLower;
	}
	
	public void setNameLower(String nameLower) {
		this.nameLower = nameLower;
	}

}
