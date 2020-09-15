package kr.co.hanacard.mypage.vo;

public class CardTransactionVO {
	
	private String num;
	private String time;
	private String amount;
	private String content;
	private String code;
	private String means;
	private String payment;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMeans() {
		return means;
	}
	public void setMeans(String means) {
		this.means = means;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CardTransactionVO [num=");
		builder.append(num);
		builder.append(", time=");
		builder.append(time);
		builder.append(", amount=");
		builder.append(amount);
		builder.append(", content=");
		builder.append(content);
		builder.append(", code=");
		builder.append(code);
		builder.append(", means=");
		builder.append(means);
		builder.append(", payment=");
		builder.append(payment);
		builder.append("]");
		return builder.toString();
	}
	
	

}
