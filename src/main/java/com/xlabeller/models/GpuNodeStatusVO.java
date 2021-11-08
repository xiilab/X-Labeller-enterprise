package com.xlabeller.models;

public class GpuNodeStatusVO {
	
	private String node_ip;
	private String host_name;
	private String available_gpu_index;
	private String unavailable_gpu_index;
	private String gpu_node_id;
	
	
	
	public String getGpu_node_id() {
		return gpu_node_id;
	}
	public void setGpu_node_id(String gpu_node_id) {
		this.gpu_node_id = gpu_node_id;
	}
	public String getNode_ip() {
		return node_ip;
	}
	public void setNode_ip(String node_ip) {
		this.node_ip = node_ip;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getAvailable_gpu_index() {
		return available_gpu_index;
	}
	public void setAvailable_gpu_index(String available_gpu_index) {
		this.available_gpu_index = available_gpu_index;
	}
	public String getUnavailable_gpu_index() {
		return unavailable_gpu_index;
	}
	public void setUnavailable_gpu_index(String unavailable_gpu_index) {
		this.unavailable_gpu_index = unavailable_gpu_index;
	}
	
	
	
	

		
}
	
	

