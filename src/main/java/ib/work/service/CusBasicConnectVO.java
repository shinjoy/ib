package ib.work.service;

import ib.cmm.ComDefaultVO;


/**
 * <pre>
 * package  : ib.work.service
 * filename : CusBasicConnectVO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 3. 12.
 * @version : 1.0.0
 */
@SuppressWarnings("serial")
public class CusBasicConnectVO  extends ComDefaultVO{

	private String CusCd     	= "";
	private String CusNm    	= "";
	private String CusPhone    	= "";
	private int CusType;
	private String CusEmail    	= "";
	private String CusStatus   	= "";
	private String CusEtc    	= "";
	private String CusOfficeNm 	= "";
	private String CusOfficePosition 	= "";
	private String CusOfficeTel    		= "";
	private String CusAddInvestFlag    	= "";
	private String CusManagerNm    		= "";
	private String CusInviteNm    		= "";
	private String RegDate    			= "";
	private String RegPerSabun    		= "";
	private String DelFlag    			= "";
	private String S_Nb    				= "";
	
	private String TradeCd    			= "";
	private String TradeType    		= "";
	private String TradeQuarter    		= "";
	
	private String CusPerCd   			= "";
	private String CusPerNm    			= "";
	private String CusPerPhone   		= "";
	private String CusPerTel    		= "";
	private String CusPerEmail   		= "";
	private String CusMailingFlag   	= "";
	private String CusPerEtc   			= "";
	
	private String tmpId   			= "";     
	
	
	/**
	 * @return the cusCd
	 */
	public String getCusCd() {
		return CusCd;
	}
	/**
	 * @param cusCd the cusCd to set
	 */
	public void setCusCd(String cusCd) {
		CusCd = cusCd;
	}
	/**
	 * @return the cusNm
	 */
	public String getCusNm() {
		return CusNm;
	}
	/**
	 * @param cusNm the cusNm to set
	 */
	public void setCusNm(String cusNm) {
		CusNm = cusNm;
	}
	/**
	 * @return the cusPhone
	 */
	public String getCusPhone() {
		return CusPhone;
	}
	/**
	 * @param cusPhone the cusPhone to set
	 */
	public void setCusPhone(String cusPhone) {
		CusPhone = cusPhone;
	}
	/**
	 * @return the cusEmail
	 */
	public String getCusEmail() {
		return CusEmail;
	}
	/**
	 * @param cusEmail the cusEmail to set
	 */
	public void setCusEmail(String cusEmail) {
		CusEmail = cusEmail;
	}
	/**
	 * @return the cusStatus
	 */
	public String getCusStatus() {
		return CusStatus;
	}
	/**
	 * @param cusStatus the cusStatus to set
	 */
	public void setCusStatus(String cusStatus) {
		CusStatus = cusStatus;
	}
	/**
	 * @return the cusEtc
	 */
	public String getCusEtc() {
		return CusEtc;
	}
	/**
	 * @param cusEtc the cusEtc to set
	 */
	public void setCusEtc(String cusEtc) {
		CusEtc = cusEtc;
	}
	/**
	 * @return the cusOfficeNm
	 */
	public String getCusOfficeNm() {
		return CusOfficeNm;
	}
	/**
	 * @param cusOfficeNm the cusOfficeNm to set
	 */
	public void setCusOfficeNm(String cusOfficeNm) {
		CusOfficeNm = cusOfficeNm;
	}
	/**
	 * @return the cusOfficePosition
	 */
	public String getCusOfficePosition() {
		return CusOfficePosition;
	}
	/**
	 * @param cusOfficePosition the cusOfficePosition to set
	 */
	public void setCusOfficePosition(String cusOfficePosition) {
		CusOfficePosition = cusOfficePosition;
	}
	/**
	 * @return the cusOfficeTel
	 */
	public String getCusOfficeTel() {
		return CusOfficeTel;
	}
	/**
	 * @param cusOfficeTel the cusOfficeTel to set
	 */
	public void setCusOfficeTel(String cusOfficeTel) {
		CusOfficeTel = cusOfficeTel;
	}
	/**
	 * @return the regDate
	 */
	public String getRegDate() {
		return RegDate;
	}
	/**
	 * @param regDate the regDate to set
	 */
	public void setRegDate(String regDate) {
		RegDate = regDate;
	}
	/**
	 * @return the regPerSabun
	 */
	public String getRegPerSabun() {
		return RegPerSabun;
	}
	/**
	 * @param regPerSabun the regPerSabun to set
	 */
	public void setRegPerSabun(String regPerSabun) {
		RegPerSabun = regPerSabun;
	}
	/**
	 * @return the delFlag
	 */
	public String getDelFlag() {
		return DelFlag;
	}
	/**
	 * @param delFlag the delFlag to set
	 */
	public void setDelFlag(String delFlag) {
		DelFlag = delFlag;
	}
	/**
	 * @return the s_Nb
	 */
	public String getS_Nb() {
		return S_Nb;
	}
	/**
	 * @return the cusAddInvestFlag
	 */
	public String getCusAddInvestFlag() {
		return CusAddInvestFlag;
	}
	/**
	 * @param cusAddInvestFlag the cusAddInvestFlag to set
	 */
	public void setCusAddInvestFlag(String cusAddInvestFlag) {
		CusAddInvestFlag = cusAddInvestFlag;
	}
	/**
	 * @return the cusManagerNm
	 */
	public String getCusManagerNm() {
		return CusManagerNm;
	}
	/**
	 * @param cusManagerNm the cusManagerNm to set
	 */
	public void setCusManagerNm(String cusManagerNm) {
		CusManagerNm = cusManagerNm;
	}
	/**
	 * @return the cusInviteNm
	 */
	public String getCusInviteNm() {
		return CusInviteNm;
	}
	/**
	 * @param cusInviteNm the cusInviteNm to set
	 */
	public void setCusInviteNm(String cusInviteNm) {
		CusInviteNm = cusInviteNm;
	}
	/**
	 * @param s_Nb the s_Nb to set
	 */
	public void setS_Nb(String s_Nb) {
		S_Nb = s_Nb;
	}
	/**
	 * @return the tradeCd
	 */
	public String getTradeCd() {
		return TradeCd;
	}
	/**
	 * @param tradeCd the tradeCd to set
	 */
	public void setTradeCd(String tradeCd) {
		TradeCd = tradeCd;
	}
	/**
	 * @return the tradeType
	 */
	public String getTradeType() {
		return TradeType;
	}
	/**
	 * @param tradeType the tradeType to set
	 */
	public void setTradeType(String tradeType) {
		TradeType = tradeType;
	}
	/**
	 * @return the tradeQuerter
	 */
	public String getTradeQuerter() {
		return TradeQuarter;
	}
	/**
	 * @param tradeQuerter the tradeQuerter to set
	 */
	public void setTradeQuerter(String tradeQuarter) {
		TradeQuarter = tradeQuarter;
	}
	/**
	 * @return the cusPerCd
	 */
	public String getCusPerCd() {
		return CusPerCd;
	}
	/**
	 * @param cusPerCd the cusPerCd to set
	 */
	public void setCusPerCd(String cusPerCd) {
		CusPerCd = cusPerCd;
	}
	/**
	 * @return the cusPerNm
	 */
	public String getCusPerNm() {
		return CusPerNm;
	}
	/**
	 * @param cusPerNm the cusPerNm to set
	 */
	public void setCusPerNm(String cusPerNm) {
		CusPerNm = cusPerNm;
	}
	/**
	 * @return the cusPerPhone
	 */
	public String getCusPerPhone() {
		return CusPerPhone;
	}
	/**
	 * @param cusPerPhone the cusPerPhone to set
	 */
	public void setCusPerPhone(String cusPerPhone) {
		CusPerPhone = cusPerPhone;
	}
	/**
	 * @return the cusPerTel
	 */
	public String getCusPerTel() {
		return CusPerTel;
	}
	/**
	 * @param cusPerTel the cusPerTel to set
	 */
	public void setCusPerTel(String cusPerTel) {
		CusPerTel = cusPerTel;
	}
	/**
	 * @return the cusPerEmail
	 */
	public String getCusPerEmail() {
		return CusPerEmail;
	}
	/**
	 * @param cusPerEmail the cusPerEmail to set
	 */
	public void setCusPerEmail(String cusPerEmail) {
		CusPerEmail = cusPerEmail;
	}
	/**
	 * @return the cusMailingFlag
	 */
	public String getCusMailingFlag() {
		return CusMailingFlag;
	}
	/**
	 * @param cusMailingFlag the cusMailingFlag to set
	 */
	public void setCusMailingFlag(String cusMailingFlag) {
		CusMailingFlag = cusMailingFlag;
	}
	/**
	 * @return the cusPerEtc
	 */
	public String getCusPerEtc() {
		return CusPerEtc;
	}
	/**
	 * @param cusPerEtc the cusPerEtc to set
	 */
	public void setCusPerEtc(String cusPerEtc) {
		CusPerEtc = cusPerEtc;
	}
	/**
	 * @return the cusType
	 */
	public int getCusType() {
		return CusType;
	}
	/**
	 * @param cusType the cusType to set
	 */
	public void setCusType(int cusType) {
		CusType = cusType;
	}
	/**
	 * @return the tmpId
	 */
	public String getTmpId() {
		return tmpId;
	}
	/**
	 * @param tmpId the tmpId to set
	 */
	public void setTmpId(String tmpId) {
		this.tmpId = tmpId;
	}


	
}