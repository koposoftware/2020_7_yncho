package kr.co.hanacard.board.vo;

public class BoardVO {

	private int no;
	private int originid;
	private int groupid;
	private String title;
	private String writer;
	private String content;
	private String viewCnt;
	private String regDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOriginid() {
		return originid;
	}
	public void setOriginid(int originid) {
		this.originid = originid;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override //객체명만 쓰면 toString 메소드가 호출되어서 string 값이 반환된다.
	public String toString() {
		return "BoardVO [no=" + no + ", originid=" + originid + ", groupid=" + groupid + ", title=" + title
				+ ", writer=" + writer + ", content=" + content + "]";
	}
	
	
}
