package kr.co.hanacard.mypage.vo;

public class MypageVO {

	private long jan;
	private long feb;
	private long mar; 
	private long apr; 
	private long may; 
	private long jun; 
	private long jul; 
	private long aug; 
	private long sept; 
	private long oct; 
	private long nov; 
	private long dec;
	
	private long trans_gas;
	private long Leisure_travel_flight;
	private long mart_shopping;
	private long pet;
	private long health_medical;
	private long life;
	private long food_beverage;
	private long communication;
	//private double etc;
	
	
	public long getJan() {
		return jan;
	}
	public void setJan(long jan) {
		this.jan = jan;
	}
	public long getFeb() {
		return feb;
	}
	public void setFeb(long feb) {
		this.feb = feb;
	}
	public long getMar() {
		return mar;
	}
	public void setMar(long mar) {
		this.mar = mar;
	}
	public long getApr() {
		return apr;
	}
	public void setApr(long apr) {
		this.apr = apr;
	}
	public long getMay() {
		return may;
	}
	public void setMay(long may) {
		this.may = may;
	}
	public long getJun() {
		return jun;
	}
	public void setJun(long jun) {
		this.jun = jun;
	}
	public long getJul() {
		return jul;
	}
	public void setJul(long jul) {
		this.jul = jul;
	}
	public long getAug() {
		return aug;
	}
	public void setAug(long aug) {
		this.aug = aug;
	}
	public long getSept() {
		return sept;
	}
	public void setSept(long sept) {
		this.sept = sept;
	}
	public long getOct() {
		return oct;
	}
	public void setOct(long oct) {
		this.oct = oct;
	}
	public long getNov() {
		return nov;
	}
	public void setNov(long nov) {
		this.nov = nov;
	}
	public long getDec() {
		return dec;
	}
	public void setDec(long dec) {
		this.dec = dec;
	}
	public long getTrans_gas() {
		return trans_gas;
	}
	public void setTrans_gas(long trans_gas) {
		this.trans_gas = trans_gas;
	}
	public long getLeisure_travel_flight() {
		return Leisure_travel_flight;
	}
	public void setLeisure_travel_flight(long leisure_travel_flight) {
		Leisure_travel_flight = leisure_travel_flight;
	}
	public long getMart_shopping() {
		return mart_shopping;
	}
	public void setMart_shopping(long mart_shopping) {
		this.mart_shopping = mart_shopping;
	}
	public long getPet() {
		return pet;
	}
	public void setPet(long pet) {
		this.pet = pet;
	}
	public long getHealth_medical() {
		return health_medical;
	}
	public void setHealth_medical(long health_medical) {
		this.health_medical = health_medical;
	}
	public long getLife() {
		return life;
	}
	public void setLife(long life) {
		this.life = life;
	}
	public long getFood_beverage() {
		return food_beverage;
	}
	public void setFood_beverage(long food_beverage) {
		this.food_beverage = food_beverage;
	}
	public long getCommunication() {
		return communication;
	}
	public void setCommunication(long communication) {
		this.communication = communication;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MypageVO [jan=");
		builder.append(jan);
		builder.append(", feb=");
		builder.append(feb);
		builder.append(", mar=");
		builder.append(mar);
		builder.append(", apr=");
		builder.append(apr);
		builder.append(", may=");
		builder.append(may);
		builder.append(", jun=");
		builder.append(jun);
		builder.append(", jul=");
		builder.append(jul);
		builder.append(", aug=");
		builder.append(aug);
		builder.append(", sept=");
		builder.append(sept);
		builder.append(", oct=");
		builder.append(oct);
		builder.append(", nov=");
		builder.append(nov);
		builder.append(", dec=");
		builder.append(dec);
		builder.append(", trans_gas=");
		builder.append(trans_gas);
		builder.append(", Leisure_travel_flight=");
		builder.append(Leisure_travel_flight);
		builder.append(", mart_shopping=");
		builder.append(mart_shopping);
		builder.append(", pet=");
		builder.append(pet);
		builder.append(", health_medical=");
		builder.append(health_medical);
		builder.append(", life=");
		builder.append(life);
		builder.append(", food_beverage=");
		builder.append(food_beverage);
		builder.append(", communication=");
		builder.append(communication);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
