/**
 * 
 */
/**
 * 
 * @author  : ChanWoo Lee
 * @since   : 2015. 2. 5.
 * @filename : ReplyVO.java
 * @version : 1.0.0
 * @see
 *
 * <pre>
 * package  : ib.reply.service
 * </pre>
 */
package ib.reply.service;

import ib.work.service.WorkVO;

@SuppressWarnings("serial")
public class ReplyVO extends WorkVO {

	private String brokerSnb = "";
	private String investSnb = "";
	private String margin = "";
	private String category = "";
	private String cate = "";
	
	private String marginNum = "";
	private String priceNum = "";
	
	
	/**
	 * @return the brokerSnb
	 */
	public String getBrokerSnb() {
		return brokerSnb;
	}
	/**
	 * @param brokerSnb the brokerSnb to set
	 */
	public void setBrokerSnb(String brokerSnb) {
		this.brokerSnb = brokerSnb;
	}
	/**
	 * @return the investSnb
	 */
	public String getInvestSnb() {
		return investSnb;
	}
	/**
	 * @param investSnb the investSnb to set
	 */
	public void setInvestSnb(String investSnb) {
		this.investSnb = investSnb;
	}
	/**
	 * @return the margin
	 */
	public String getMargin() {
		return margin;
	}
	/**
	 * @param margin the margin to set
	 */
	public void setMargin(String margin) {
		this.margin = margin;
	}
	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	/**
	 * @return the cate
	 */
	public String getCate() {
		return cate;
	}
	/**
	 * @param cate the cate to set
	 */
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getMarginNum() {
		return marginNum;
	}
	public void setMarginNum(String marginNum) {
		this.marginNum = marginNum;
	}
	public String getPriceNum() {
		return priceNum;
	}
	public void setPriceNum(String priceNum) {
		this.priceNum = priceNum;
	}

}