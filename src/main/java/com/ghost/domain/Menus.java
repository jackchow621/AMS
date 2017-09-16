package com.ghost.domain;

public class Menus {
	private int menu_id; 
	private String menu_name;
	private int menu_pid;
	private String menu_url;
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_pid() {
		return menu_pid;
	}
	public void setMenu_pid(int menu_pid) {
		this.menu_pid = menu_pid;
	}
	public Menus() {
		super();
	}
}
