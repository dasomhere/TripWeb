package com.webapp.model;

public class Weather {
	String city;
	double nowTemp;
	int nowHumidity;
	int nowWindSpeed;
	int nowConditionCode;
	String nowConditionText;
	int[] code;
	String[] day;
	double[] high;
	double[] low;
	String[] text;
	int woeid;
	

	public int getWoeid() {
		return woeid;
	}
	public void setWoeid(int woeid) {
		this.woeid = woeid;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getNowTemp() {
		return nowTemp;
	}
	public void setNowTemp(double nowTemp) {
		this.nowTemp = nowTemp;
	}
	public int getNowHumidity() {
		return nowHumidity;
	}
	public void setNowHumidity(int nowHumidity) {
		this.nowHumidity = nowHumidity;
	}
	public int getNowWindSpeed() {
		return nowWindSpeed;
	}
	public void setNowWindSpeed(int nowWindSpeed) {
		this.nowWindSpeed = nowWindSpeed;
	}
	public int getNowConditionCode() {
		return nowConditionCode;
	}
	public void setNowConditionCode(int nowConditionCode) {
		this.nowConditionCode = nowConditionCode;
	}
	public String getNowConditionText() {
		return nowConditionText;
	}
	public void setNowConditionText(String nowConditionText) {
		this.nowConditionText = nowConditionText;
	}
	public int[] getCode() {
		return code;
	}
	public void setCode(int[] code) {
		this.code = code;
	}
	public String[] getDay() {
		return day;
	}
	public void setDay(String[] day) {
		this.day = day;
	}
	public double[] getHigh() {
		return high;
	}
	public void setHigh(double[] high) {
		this.high = high;
	}
	public double[] getLow() {
		return low;
	}
	public void setLow(double[] low) {
		this.low = low;
	}
	public String[] getText() {
		return text;
	}
	public void setText(String[] text) {
		this.text = text;
	}
	
}
