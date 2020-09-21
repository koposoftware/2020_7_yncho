package kr.co.hanacard.chart.vo;

public class ChartVO {
	
	private String cardName;
	private String num;
	
	
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ChartVO [cardName=");
		builder.append(cardName);
		builder.append(", num=");
		builder.append(num);
		builder.append("]");
		return builder.toString();
	}
	
	
	

}
