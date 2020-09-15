package kr.co.hanacard.member.vo;

public class OwncardVO {
	private String cardProductName;
	private String cardNum;
	private String regDate;
	private String cvc;
	
	
	public String getCardProductName() {
		return cardProductName;
	}
	public void setCardProductName(String cardProductName) {
		this.cardProductName = cardProductName;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OwncardVO [cardProductName=");
		builder.append(cardProductName);
		builder.append(", cardNum=");
		builder.append(cardNum);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append(", cvc=");
		builder.append(cvc);
		builder.append("]");
		return builder.toString();
	}
	
	
	

}
