package com.weixin.entity;
/** 
 * @author :yanyonglin 
 * @version 创建时间：2016年2月18日 下午3:36:12 
 * 类说明 
 */
public class Ticket {

	private String action_name;
	
	public Ticket(){
		
	}
	public Ticket(String name,String scene_str){
		this.action_name = name;
		this.setAction_info(new TicketInfo());
		this.getAction_info().setScene(new TicketScene());
		this.getAction_info().getScene().setScene_str(scene_str);
	}
	
	private TicketInfo action_info;
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	public TicketInfo getAction_info() {
		return action_info;
	}
	public void setAction_info(TicketInfo action_info) {
		this.action_info = action_info;
	}
	
	
}
