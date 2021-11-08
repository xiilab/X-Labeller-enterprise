package com.xlabeller.models;

public class LossMapVO {
	private String id;
	private String epoch;
	private String Batch;
	private String Loss;
	private String map;
	public String getEpoch() {
		return epoch;
	}
	public void setEpoch(String epoch) {
		this.epoch = epoch;
	}
	public String getBatch() {
		return Batch;
	}
	public void setBatch(String batch) {
		Batch = batch;
	}
	public String getLoss() {
		return Loss;
	}
	public void setLoss(String loss) {
		Loss = loss;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
