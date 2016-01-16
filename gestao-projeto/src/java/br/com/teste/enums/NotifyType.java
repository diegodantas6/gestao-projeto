package br.com.teste.enums;

public enum NotifyType {

	SUCCESS("success"), INFO("info"), WARN("warn"), ERROR("error");

	private NotifyType(String type) {
		this.type = type;
	}

	private String type;

	public String getType() {
		return type;
	}

}
