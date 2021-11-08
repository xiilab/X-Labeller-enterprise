package com.xlabeller.models;

public class PageVO {

	private String id;
	private int current_page; // 현재페이지
	private int total_count; // 총 레코드수
	private int block_count = 10; // 한 페이지에 보여줄 레코드수
	private int block_page = 3; // 한 블록에 보여줄 페이지수
	private int total_page; // 총 페이지수
	private int start_row; // 시작 레코드 번호
	private int end_row; // 끝 레코드번호
	private int start_page; // 한 블록의 시작 페이지 번호
	private int end_page; // 한 블록의 끝페이지 번호
	private int number;
	private String search_type;
	private String search_keyword;

	public void setPage(int total_count) {
		this.total_count = total_count;
		this.id = String.valueOf(current_page * 10);

		// 시작레코드
		start_row = (current_page - 1) * block_count + 1;

		// 끝레코드
		end_row = start_row + block_count - 1;

		// 총페이지수
		total_page = total_count / block_count + (total_count % block_count == 0 ? 0 : 1);

		// 시작페이지
		start_page = (int) ((current_page - 1) / block_page) * block_page + 1;

		// 끝페이지
		end_page = start_page + block_page - 1;
		if (total_page < end_page)
			end_page = total_page;

		// 리스트페이지에 출력번호
		number = total_count - (current_page - 1) * block_count;
	}

	public int getCurrent_page() {
		return current_page;
	}

	public void setCurrent_page(int current_page) {
		this.current_page = current_page;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public int getBlock_count() {
		return block_count;
	}

	public void setBlock_count(int block_count) {
		this.block_count = block_count;
	}

	public int getBlock_page() {
		return block_page;
	}

	public void setBlock_page(int block_page) {
		this.block_page = block_page;
	}

	public int getTotal_page() {
		return total_page;
	}

	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}

	public int getStart_row() {
		return start_row;
	}

	public void setStart_row(int start_row) {
		this.start_row = start_row;
	}

	public int getEnd_row() {
		return end_row;
	}

	public void setEnd_row(int end_row) {
		this.end_row = end_row;
	}

	public int getStart_page() {
		return start_page;
	}

	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}

	public int getEnd_page() {
		return end_page;
	}

	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	@Override
	public String toString() {
		return "PageVO [current_page=" + current_page + ", total_count=" + total_count + ", block_count=" + block_count
				+ ", block_page=" + block_page + ", total_page=" + total_page + ", start_row=" + start_row
				+ ", end_row=" + end_row + ", start_page=" + start_page + ", end_page=" + end_page + ", number="
				+ number + ", search_type=" + search_type + ", search_keyword=" + search_keyword + "]";
	}

}
