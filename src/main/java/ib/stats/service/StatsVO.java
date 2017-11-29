package ib.stats.service;

import ib.work.service.WorkVO;

@SuppressWarnings("serial")
public class StatsVO  extends WorkVO{
	
	private String sNb = "";
	private String meet = "";
	private String ir = "";
	private String invite = "";
	private String anner = "";
	private String research = "";
	private String nightMeet = "";
	private String proposal = "";
	private String recommend = "";
	private String memberCpnCast = "";//회원사
	private String memberCpnIntroduce = "";//회원사
	private String shareholderCpnCast = "";//주주사
	private String shareholderCpnIntroduce = "";//주주사
	private String memberCpnCastGood = "";//회원사
	private String memberCpnIntroduceGood = "";//회원사
	private String shareholderCpnCastGood = "";//주주사
	private String shareholderCpnIntroduceGood = "";//주주사
	private String dealS = "";
	private String dealSgood = "";
	private String dealSbad = "";
	private String dealR = "";
	private String dealRgood = "";
	private String dealRbad = "";
	private String mediateDealprice = "";
	private String directDealprice = "";
	private String mediateDealpriceGood = "";
	private String directDealpriceGood = "";
	private String resaleDealpriceGood = "";
	private String fundDealpriceGood = "";
	private String sum = "";
	private String insertCst = "";
	private String infoProvider = "";
	private String infoProviderCd = "";
	private String infoProviderSuccess = "";
	private String report = "";
	private String spac = "";
	private String spacGood = "";
	private String ipo = "";
	private String ipoGood = "";
	
	private String choice_year = "";
	private String choice_monthS = "";
	private String choice_month = "";
	private String total = "";
	
	private String comment = "";
	private String note = "";
	
	private String mediateDeal = "";
	private String directDeal = "";
	private String entrust = "";
	private String reSale = "";
	private String entrustGood = "";
	private String reSaleGood = "";
	private String fundGood = "";
	
	private String planMediateDeal = "";
	private String planDirectDeal = "";
	private String planEntrust = "";
	private String planReSale = "";
	private String planMediateDealSuccess = "";
	private String planDirectDealSuccess = "";
	private String planEntrustSuccess = "";
	private String planReSaleSuccess = "";
	
	private String financing = "";
	private String financingSuccess = "";
	private String management = "";
	private String mna = "";
	private String mnaMcpn = "";
	private String mnaGood = "";
	private String etc = "";
	
	private String sort_t = "";
	
	private String CusInviteSabun = "";
	private String staffId = "";
	private String opinion = "";
	private String rcmdOpinion = "";
	
	private String networkCst = "";
	private String networkCpn = "";
	private String introducer = "";
	
	private String supPriceMedi = "";
	private String supPriceDire = "";
	private String supPriceEntr = "";
	private String supPriceResa = "";
	private String supPriceFund = "";
	private String supTotalPriceMedi = "";
	private String supTotalPriceDire = "";
	private String supTotalPriceEntr = "";
	private String supTotalPriceResa = "";
	private String supTotalPriceFund = "";
	private String supPriceCusJoint = "";
	private String supPriceCusJointMine = "";
	
	private String cusRealJointTotal = "";
	private String cusRealJointMine = "";
	
	private String jointMediate = "";
	private String jointDirect = "";
	private String jointEntrust = "";
	private String jointResale = "";
	private String jointFund = "";

	private String jointMediateDealpriceGood = "";
	private String jointDirectDealpriceGood = "";
	private String jointResaleDealpriceGood = "";
	private String jointFundDealpriceGood = "";
	private String jointTotalMediateDealpriceGood = "";
	private String jointTotalDirectDealpriceGood = "";
	private String jointTotalResaleDealpriceGood = "";
	private String jointTotalFundDealpriceGood = "";
	
	private String disposal = "";
	private String disposalSupporter = "";
	private String disposalPrice = "";
	private String disposalMargin = "";
	
	private String ideaCnt = "";
	private String ideaScore = "";
	private String ideaRcmdCnt = "";
	private String ideaRcmdScore = "";

	
	//20151211 추가
	private String achiTotalAmount; 
    private String achiDirectInvest;
	
    
    private String showAll;		//퇴사자 보기
    private String isEmp;		//직원 여부 ('':직원 or 'not:퇴사자)
    
    
    
    
	public String getAchiTotalAmount() {
		return achiTotalAmount;
	}

	public void setAchiTotalAmount(String achiTotalAmount) {
		this.achiTotalAmount = achiTotalAmount;
	}

	public String getAchiDirectInvest() {
		return achiDirectInvest;
	}

	public void setAchiDirectInvest(String achiDirectInvest) {
		this.achiDirectInvest = achiDirectInvest;
	}

	
	public String getShowAll() {
		return showAll;
	}

	public void setShowAll(String showAll) {
		this.showAll = showAll;
	}

	public String getIsEmp() {
		return isEmp;
	}

	public void setIsEmp(String isEmp) {
		this.isEmp = isEmp;
	}

	/**
	 * @return the meet
	 */
	public String getMeet() {
		return meet;
	}

	/**
	 * @param meet the meet to set
	 */
	public void setMeet(String meet) {
		this.meet = meet;
	}

	/**
	 * @return the ir
	 */
	public String getIr() {
		return ir;
	}

	/**
	 * @param ir the ir to set
	 */
	public void setIr(String ir) {
		this.ir = ir;
	}

	/**
	 * @return the invite
	 */
	public String getInvite() {
		return invite;
	}

	/**
	 * @param invite the invite to set
	 */
	public void setInvite(String invite) {
		this.invite = invite;
	}

	/**
	 * @return the anner
	 */
	public String getAnner() {
		return anner;
	}

	/**
	 * @param anner the anner to set
	 */
	public void setAnner(String anner) {
		this.anner = anner;
	}

	/**
	 * @return the research
	 */
	public String getResearch() {
		return research;
	}

	/**
	 * @param research the research to set
	 */
	public void setResearch(String research) {
		this.research = research;
	}

	/**
	 * @return the sum
	 */
	public String getSum() {
		return sum;
	}

	/**
	 * @param sum the sum to set
	 */
	public void setSum(String sum) {
		this.sum = sum;
	}

	/**
	 * @return the insertCst
	 */
	public String getInsertCst() {
		return insertCst;
	}

	/**
	 * @param insertCst the insertCst to set
	 */
	public void setInsertCst(String insertCst) {
		this.insertCst = insertCst;
	}

	/**
	 * @return the staffNm
	 */
	public String getStaffNm() {
		return staffNm;
	}

	/**
	 * @param staffNm the staffNm to set
	 */
	public void setStaffNm(String staffNm) {
		this.staffNm = staffNm;
	}

	private String staffNm = "";

	/**
	 * @return the choice_year
	 */
	public String getChoice_year() {
		return choice_year;
	}

	/**
	 * @param choice_year the choice_year to set
	 */
	public void setChoice_year(String choice_year) {
		this.choice_year = choice_year;
	}

	/**
	 * @return the choice_month
	 */
	public String getChoice_month() {
		return choice_month;
	}

	/**
	 * @param choice_month the choice_month to set
	 */
	public void setChoice_month(String choice_month) {
		this.choice_month = choice_month;
	}

	/**
	 * @return the dealS
	 */
	public String getDealS() {
		return dealS;
	}

	/**
	 * @param dealS the dealS to set
	 */
	public void setDealS(String dealS) {
		this.dealS = dealS;
	}

	/**
	 * @return the dealR
	 */
	public String getDealR() {
		return dealR;
	}

	/**
	 * @param dealR the dealR to set
	 */
	public void setDealR(String dealR) {
		this.dealR = dealR;
	}

	/**
	 * @return the comment
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	 * @return the note
	 */
	public String getNote() {
		return note;
	}

	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}

	/**
	 * @return the choice_monthS
	 */
	public String getChoice_monthS() {
		return choice_monthS;
	}

	/**
	 * @param choice_monthS the choice_monthS to set
	 */
	public void setChoice_monthS(String choice_monthS) {
		this.choice_monthS = choice_monthS;
	}

	/**
	 * @return the total
	 */
	public String getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(String total) {
		this.total = total;
	}

	/**
	 * @return the financing
	 */
	public String getFinancing() {
		return financing;
	}

	/**
	 * @param financing the financing to set
	 */
	public void setFinancing(String financing) {
		this.financing = financing;
	}

	/**
	 * @return the management
	 */
	public String getManagement() {
		return management;
	}

	/**
	 * @param management the management to set
	 */
	public void setManagement(String management) {
		this.management = management;
	}

	/**
	 * @return the mna
	 */
	public String getMna() {
		return mna;
	}

	/**
	 * @param mna the mna to set
	 */
	public void setMna(String mna) {
		this.mna = mna;
	}

	/**
	 * @return the etc
	 */
	public String getEtc() {
		return etc;
	}

	/**
	 * @param etc the etc to set
	 */
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	public String getCusInviteSabun() {
		return CusInviteSabun;
	}

	public void setCusInviteSabun(String cusInviteSabun) {
		CusInviteSabun = cusInviteSabun;
	}

	/**
	 * @return the staffId
	 */
	public String getStaffId() {
		return staffId;
	}

	/**
	 * @param staffId the staffId to set
	 */
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	/**
	 * @return the sNb
	 */
	public String getsNb() {
		return sNb;
	}

	/**
	 * @param sNb the sNb to set
	 */
	public void setsNb(String sNb) {
		this.sNb = sNb;
	}

	/**
	 * @return the dealSgood
	 */
	public String getDealSgood() {
		return dealSgood;
	}

	/**
	 * @param dealSgood the dealSgood to set
	 */
	public void setDealSgood(String dealSgood) {
		this.dealSgood = dealSgood;
	}

	/**
	 * @return the dealRgood
	 */
	public String getDealRgood() {
		return dealRgood;
	}

	/**
	 * @param dealRgood the dealRgood to set
	 */
	public void setDealRgood(String dealRgood) {
		this.dealRgood = dealRgood;
	}

	/**
	 * @return the dealSbad
	 */
	public String getDealSbad() {
		return dealSbad;
	}

	/**
	 * @param dealSbad the dealSbad to set
	 */
	public void setDealSbad(String dealSbad) {
		this.dealSbad = dealSbad;
	}

	/**
	 * @return the dealRbad
	 */
	public String getDealRbad() {
		return dealRbad;
	}

	/**
	 * @param dealRbad the dealRbad to set
	 */
	public void setDealRbad(String dealRbad) {
		this.dealRbad = dealRbad;
	}

	/**
	 * @return the sort_t
	 */
	public String getSort_t() {
		return sort_t;
	}

	/**
	 * @param sort_t the sort_t to set
	 */
	public void setSort_t(String sort_t) {
		this.sort_t = sort_t;
	}

	/**
	 * @return the mediateDeal
	 */
	public String getMediateDeal() {
		return mediateDeal;
	}

	/**
	 * @param mediateDeal the mediateDeal to set
	 */
	public void setMediateDeal(String mediateDeal) {
		this.mediateDeal = mediateDeal;
	}

	/**
	 * @return the directDeal
	 */
	public String getDirectDeal() {
		return directDeal;
	}

	/**
	 * @param directDeal the directDeal to set
	 */
	public void setDirectDeal(String directDeal) {
		this.directDeal = directDeal;
	}

	/**
	 * @return the entrust
	 */
	public String getEntrust() {
		return entrust;
	}

	/**
	 * @param entrust the entrust to set
	 */
	public void setEntrust(String entrust) {
		this.entrust = entrust;
	}

	/**
	 * @return the reSale
	 */
	public String getReSale() {
		return reSale;
	}

	/**
	 * @param reSale the reSale to set
	 */
	public void setReSale(String reSale) {
		this.reSale = reSale;
	}

	/**
	 * @return the planMediateDeal
	 */
	public String getPlanMediateDeal() {
		return planMediateDeal;
	}

	/**
	 * @param planMediateDeal the planMediateDeal to set
	 */
	public void setPlanMediateDeal(String planMediateDeal) {
		this.planMediateDeal = planMediateDeal;
	}

	/**
	 * @return the planDirectDeal
	 */
	public String getPlanDirectDeal() {
		return planDirectDeal;
	}

	/**
	 * @param planDirectDeal the planDirectDeal to set
	 */
	public void setPlanDirectDeal(String planDirectDeal) {
		this.planDirectDeal = planDirectDeal;
	}

	/**
	 * @return the planEntrust
	 */
	public String getPlanEntrust() {
		return planEntrust;
	}

	/**
	 * @param planEntrust the planEntrust to set
	 */
	public void setPlanEntrust(String planEntrust) {
		this.planEntrust = planEntrust;
	}

	/**
	 * @return the planReSale
	 */
	public String getPlanReSale() {
		return planReSale;
	}

	/**
	 * @param planReSale the planReSale to set
	 */
	public void setPlanReSale(String planReSale) {
		this.planReSale = planReSale;
	}

	/**
	 * @return the planEntrustSuccess
	 */
	public String getPlanEntrustSuccess() {
		return planEntrustSuccess;
	}

	/**
	 * @param planEntrustSuccess the planEntrustSuccess to set
	 */
	public void setPlanEntrustSuccess(String planEntrustSuccess) {
		this.planEntrustSuccess = planEntrustSuccess;
	}

	/**
	 * @return the planReSaleSuccess
	 */
	public String getPlanReSaleSuccess() {
		return planReSaleSuccess;
	}

	/**
	 * @param planReSaleSuccess the planReSaleSuccess to set
	 */
	public void setPlanReSaleSuccess(String planReSaleSuccess) {
		this.planReSaleSuccess = planReSaleSuccess;
	}

	/**
	 * @return the planDirectDealSuccess
	 */
	public String getPlanDirectDealSuccess() {
		return planDirectDealSuccess;
	}

	/**
	 * @param planDirectDealSuccess the planDirectDealSuccess to set
	 */
	public void setPlanDirectDealSuccess(String planDirectDealSuccess) {
		this.planDirectDealSuccess = planDirectDealSuccess;
	}

	/**
	 * @return the planMediateDealSuccess
	 */
	public String getPlanMediateDealSuccess() {
		return planMediateDealSuccess;
	}

	/**
	 * @param planMediateDealSuccess the planMediateDealSuccess to set
	 */
	public void setPlanMediateDealSuccess(String planMediateDealSuccess) {
		this.planMediateDealSuccess = planMediateDealSuccess;
	}

	/**
	 * @return the entrustGood
	 */
	public String getEntrustGood() {
		return entrustGood;
	}

	/**
	 * @param entrustGood the entrustGood to set
	 */
	public void setEntrustGood(String entrustGood) {
		this.entrustGood = entrustGood;
	}

	/**
	 * @return the reSaleGood
	 */
	public String getReSaleGood() {
		return reSaleGood;
	}

	/**
	 * @param reSaleGood the reSaleGood to set
	 */
	public void setReSaleGood(String reSaleGood) {
		this.reSaleGood = reSaleGood;
	}

	/**
	 * @return the nightMeet
	 */
	public String getNightMeet() {
		return nightMeet;
	}

	/**
	 * @param nightMeet the nightMeet to set
	 */
	public void setNightMeet(String nightMeet) {
		this.nightMeet = nightMeet;
	}

	/**
	 * @return the recommend
	 */
	public String getRecommend() {
		return recommend;
	}

	/**
	 * @param recommend the recommend to set
	 */
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	/**
	 * @return the infoProvider
	 */
	public String getInfoProvider() {
		return infoProvider;
	}

	/**
	 * @param infoProvider the infoProvider to set
	 */
	public void setInfoProvider(String infoProvider) {
		this.infoProvider = infoProvider;
	}

	/**
	 * @return the infoProviderCd
	 */
	public String getInfoProviderCd() {
		return infoProviderCd;
	}

	/**
	 * @param infoProviderCd the infoProviderCd to set
	 */
	public void setInfoProviderCd(String infoProviderCd) {
		this.infoProviderCd = infoProviderCd;
	}

	/**
	 * @return the infoProviderSuccess
	 */
	public String getInfoProviderSuccess() {
		return infoProviderSuccess;
	}

	/**
	 * @param infoProviderSuccess the infoProviderSuccess to set
	 */
	public void setInfoProviderSuccess(String infoProviderSuccess) {
		this.infoProviderSuccess = infoProviderSuccess;
	}

	/**
	 * @return the report
	 */
	public String getReport() {
		return report;
	}

	/**
	 * @param report the report to set
	 */
	public void setReport(String report) {
		this.report = report;
	}

	/**
	 * @return the opinion
	 */
	public String getOpinion() {
		return opinion;
	}

	/**
	 * @param opinion the opinion to set
	 */
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	/**
	 * @return the financingSuccess
	 */
	public String getFinancingSuccess() {
		return financingSuccess;
	}

	/**
	 * @param financingSuccess the financingSuccess to set
	 */
	public void setFinancingSuccess(String financingSuccess) {
		this.financingSuccess = financingSuccess;
	}

	/**
	 * @return the networkCst
	 */
	public String getNetworkCst() {
		return networkCst;
	}

	/**
	 * @param networkCst the networkCst to set
	 */
	public void setNetworkCst(String networkCst) {
		this.networkCst = networkCst;
	}

	/**
	 * @return the networkCpn
	 */
	public String getNetworkCpn() {
		return networkCpn;
	}

	/**
	 * @param networkCpn the networkCpn to set
	 */
	public void setNetworkCpn(String networkCpn) {
		this.networkCpn = networkCpn;
	}

	/**
	 * @return the proposal
	 */
	public String getProposal() {
		return proposal;
	}

	/**
	 * @param proposal the proposal to set
	 */
	public void setProposal(String proposal) {
		this.proposal = proposal;
	}

	/**
	 * @return the mediateDealprice
	 */
	public String getMediateDealprice() {
		return mediateDealprice;
	}

	/**
	 * @param mediateDealprice the mediateDealprice to set
	 */
	public void setMediateDealprice(String mediateDealprice) {
		this.mediateDealprice = mediateDealprice;
	}

	/**
	 * @return the directDealprice
	 */
	public String getDirectDealprice() {
		return directDealprice;
	}

	/**
	 * @param directDealprice the directDealprice to set
	 */
	public void setDirectDealprice(String directDealprice) {
		this.directDealprice = directDealprice;
	}

	/**
	 * @return the mediateDealpriceGood
	 */
	public String getMediateDealpriceGood() {
		return mediateDealpriceGood;
	}

	/**
	 * @param mediateDealpriceGood the mediateDealpriceGood to set
	 */
	public void setMediateDealpriceGood(String mediateDealpriceGood) {
		this.mediateDealpriceGood = mediateDealpriceGood;
	}

	/**
	 * @return the directDealpriceGood
	 */
	public String getDirectDealpriceGood() {
		return directDealpriceGood;
	}

	/**
	 * @param directDealpriceGood the directDealpriceGood to set
	 */
	public void setDirectDealpriceGood(String directDealpriceGood) {
		this.directDealpriceGood = directDealpriceGood;
	}

	/**
	 * @return the supPriceMedi
	 */
	public String getSupPriceMedi() {
		return supPriceMedi;
	}

	/**
	 * @param supPriceMedi the supPriceMedi to set
	 */
	public void setSupPriceMedi(String supPriceMedi) {
		this.supPriceMedi = supPriceMedi;
	}

	/**
	 * @return the supPriceDire
	 */
	public String getSupPriceDire() {
		return supPriceDire;
	}

	/**
	 * @param supPriceDire the supPriceDire to set
	 */
	public void setSupPriceDire(String supPriceDire) {
		this.supPriceDire = supPriceDire;
	}

	/**
	 * @return the supPriceEntr
	 */
	public String getSupPriceEntr() {
		return supPriceEntr;
	}

	/**
	 * @param supPriceEntr the supPriceEntr to set
	 */
	public void setSupPriceEntr(String supPriceEntr) {
		this.supPriceEntr = supPriceEntr;
	}

	/**
	 * @return the supPriceResa
	 */
	public String getSupPriceResa() {
		return supPriceResa;
	}

	/**
	 * @param supPriceResa the supPriceResa to set
	 */
	public void setSupPriceResa(String supPriceResa) {
		this.supPriceResa = supPriceResa;
	}

	/**
	 * @return the jointMediate
	 */
	public String getJointMediate() {
		return jointMediate;
	}

	/**
	 * @param jointMediate the jointMediate to set
	 */
	public void setJointMediate(String jointMediate) {
		this.jointMediate = jointMediate;
	}

	/**
	 * @return the jointDirect
	 */
	public String getJointDirect() {
		return jointDirect;
	}

	/**
	 * @param jointDirect the jointDirect to set
	 */
	public void setJointDirect(String jointDirect) {
		this.jointDirect = jointDirect;
	}

	/**
	 * @return the jointEntrust
	 */
	public String getJointEntrust() {
		return jointEntrust;
	}

	/**
	 * @param jointEntrust the jointEntrust to set
	 */
	public void setJointEntrust(String jointEntrust) {
		this.jointEntrust = jointEntrust;
	}

	/**
	 * @return the jointResale
	 */
	public String getJointResale() {
		return jointResale;
	}

	/**
	 * @param jointResale the jointResale to set
	 */
	public void setJointResale(String jointResale) {
		this.jointResale = jointResale;
	}

	/**
	 * @return the jointFund
	 */
	public String getJointFund() {
		return jointFund;
	}

	/**
	 * @param jointFund the jointFund to set
	 */
	public void setJointFund(String jointFund) {
		this.jointFund = jointFund;
	}

	/**
	 * @return the supPriceFund
	 */
	public String getSupPriceFund() {
		return supPriceFund;
	}

	/**
	 * @param supPriceFund the supPriceFund to set
	 */
	public void setSupPriceFund(String supPriceFund) {
		this.supPriceFund = supPriceFund;
	}

	/**
	 * @return the supTotalPriceMedi
	 */
	public String getSupTotalPriceMedi() {
		return supTotalPriceMedi;
	}

	/**
	 * @param supTotalPriceMedi the supTotalPriceMedi to set
	 */
	public void setSupTotalPriceMedi(String supTotalPriceMedi) {
		this.supTotalPriceMedi = supTotalPriceMedi;
	}

	/**
	 * @return the supTotalPriceDire
	 */
	public String getSupTotalPriceDire() {
		return supTotalPriceDire;
	}

	/**
	 * @param supTotalPriceDire the supTotalPriceDire to set
	 */
	public void setSupTotalPriceDire(String supTotalPriceDire) {
		this.supTotalPriceDire = supTotalPriceDire;
	}

	/**
	 * @return the supTotalPriceEntr
	 */
	public String getSupTotalPriceEntr() {
		return supTotalPriceEntr;
	}

	/**
	 * @param supTotalPriceEntr the supTotalPriceEntr to set
	 */
	public void setSupTotalPriceEntr(String supTotalPriceEntr) {
		this.supTotalPriceEntr = supTotalPriceEntr;
	}

	/**
	 * @return the supTotalPriceResa
	 */
	public String getSupTotalPriceResa() {
		return supTotalPriceResa;
	}

	/**
	 * @param supTotalPriceResa the supTotalPriceResa to set
	 */
	public void setSupTotalPriceResa(String supTotalPriceResa) {
		this.supTotalPriceResa = supTotalPriceResa;
	}

	/**
	 * @return the supTotalPriceFund
	 */
	public String getSupTotalPriceFund() {
		return supTotalPriceFund;
	}

	/**
	 * @param supTotalPriceFund the supTotalPriceFund to set
	 */
	public void setSupTotalPriceFund(String supTotalPriceFund) {
		this.supTotalPriceFund = supTotalPriceFund;
	}

	/**
	 * @return the jointMediateDealpriceGood
	 */
	public String getJointMediateDealpriceGood() {
		return jointMediateDealpriceGood;
	}

	/**
	 * @param jointMediateDealpriceGood the jointMediateDealpriceGood to set
	 */
	public void setJointMediateDealpriceGood(String jointMediateDealpriceGood) {
		this.jointMediateDealpriceGood = jointMediateDealpriceGood;
	}

	/**
	 * @return the jointDirectDealpriceGood
	 */
	public String getJointDirectDealpriceGood() {
		return jointDirectDealpriceGood;
	}

	/**
	 * @param jointDirectDealpriceGood the jointDirectDealpriceGood to set
	 */
	public void setJointDirectDealpriceGood(String jointDirectDealpriceGood) {
		this.jointDirectDealpriceGood = jointDirectDealpriceGood;
	}

	/**
	 * @return the jointTotalMediateDealpriceGood
	 */
	public String getJointTotalMediateDealpriceGood() {
		return jointTotalMediateDealpriceGood;
	}

	/**
	 * @param jointTotalMediateDealpriceGood the jointTotalMediateDealpriceGood to set
	 */
	public void setJointTotalMediateDealpriceGood(
			String jointTotalMediateDealpriceGood) {
		this.jointTotalMediateDealpriceGood = jointTotalMediateDealpriceGood;
	}

	/**
	 * @return the jointTotalDirectDealpriceGood
	 */
	public String getJointTotalDirectDealpriceGood() {
		return jointTotalDirectDealpriceGood;
	}

	/**
	 * @param jointTotalDirectDealpriceGood the jointTotalDirectDealpriceGood to set
	 */
	public void setJointTotalDirectDealpriceGood(
			String jointTotalDirectDealpriceGood) {
		this.jointTotalDirectDealpriceGood = jointTotalDirectDealpriceGood;
	}

	/**
	 * @return the jointResaleDealpriceGood
	 */
	public String getJointResaleDealpriceGood() {
		return jointResaleDealpriceGood;
	}

	/**
	 * @param jointResaleDealpriceGood the jointResaleDealpriceGood to set
	 */
	public void setJointResaleDealpriceGood(String jointResaleDealpriceGood) {
		this.jointResaleDealpriceGood = jointResaleDealpriceGood;
	}

	/**
	 * @return the jointFundDealpriceGood
	 */
	public String getJointFundDealpriceGood() {
		return jointFundDealpriceGood;
	}

	/**
	 * @param jointFundDealpriceGood the jointFundDealpriceGood to set
	 */
	public void setJointFundDealpriceGood(String jointFundDealpriceGood) {
		this.jointFundDealpriceGood = jointFundDealpriceGood;
	}

	/**
	 * @return the jointTotalResaleDealpriceGood
	 */
	public String getJointTotalResaleDealpriceGood() {
		return jointTotalResaleDealpriceGood;
	}

	/**
	 * @param jointTotalResaleDealpriceGood the jointTotalResaleDealpriceGood to set
	 */
	public void setJointTotalResaleDealpriceGood(
			String jointTotalResaleDealpriceGood) {
		this.jointTotalResaleDealpriceGood = jointTotalResaleDealpriceGood;
	}

	/**
	 * @return the jointTotalFundDealpriceGood
	 */
	public String getJointTotalFundDealpriceGood() {
		return jointTotalFundDealpriceGood;
	}

	/**
	 * @param jointTotalFundDealpriceGood the jointTotalFundDealpriceGood to set
	 */
	public void setJointTotalFundDealpriceGood(String jointTotalFundDealpriceGood) {
		this.jointTotalFundDealpriceGood = jointTotalFundDealpriceGood;
	}

	/**
	 * @return the resaleDealpriceGood
	 */
	public String getResaleDealpriceGood() {
		return resaleDealpriceGood;
	}

	/**
	 * @param resaleDealpriceGood the resaleDealpriceGood to set
	 */
	public void setResaleDealpriceGood(String resaleDealpriceGood) {
		this.resaleDealpriceGood = resaleDealpriceGood;
	}

	/**
	 * @return the fundDealpriceGood
	 */
	public String getFundDealpriceGood() {
		return fundDealpriceGood;
	}

	/**
	 * @param fundDealpriceGood the fundDealpriceGood to set
	 */
	public void setFundDealpriceGood(String fundDealpriceGood) {
		this.fundDealpriceGood = fundDealpriceGood;
	}

	/**
	 * @return the fundGood
	 */
	public String getFundGood() {
		return fundGood;
	}

	/**
	 * @param fundGood the fundGood to set
	 */
	public void setFundGood(String fundGood) {
		this.fundGood = fundGood;
	}

	/**
	 * @return the introducer
	 */
	public String getIntroducer() {
		return introducer;
	}

	/**
	 * @param introducer the introducer to set
	 */
	public void setIntroducer(String introducer) {
		this.introducer = introducer;
	}

	/**
	 * @return the supPriceCusJoint
	 */
	public String getSupPriceCusJoint() {
		return supPriceCusJoint;
	}

	/**
	 * @param supPriceCusJoint the supPriceCusJoint to set
	 */
	public void setSupPriceCusJoint(String supPriceCusJoint) {
		this.supPriceCusJoint = supPriceCusJoint;
	}

	/**
	 * @return the cusRealJointTotal
	 */
	public String getCusRealJointTotal() {
		return cusRealJointTotal;
	}

	/**
	 * @param cusRealJointTotal the cusRealJointTotal to set
	 */
	public void setCusRealJointTotal(String cusRealJointTotal) {
		this.cusRealJointTotal = cusRealJointTotal;
	}

	/**
	 * @return the cusRealJointMine
	 */
	public String getCusRealJointMine() {
		return cusRealJointMine;
	}

	/**
	 * @param cusRealJointMine the cusRealJointMine to set
	 */
	public void setCusRealJointMine(String cusRealJointMine) {
		this.cusRealJointMine = cusRealJointMine;
	}

	/**
	 * @return the supPriceCusJointMine
	 */
	public String getSupPriceCusJointMine() {
		return supPriceCusJointMine;
	}

	/**
	 * @param supPriceCusJointMine the supPriceCusJointMine to set
	 */
	public void setSupPriceCusJointMine(String supPriceCusJointMine) {
		this.supPriceCusJointMine = supPriceCusJointMine;
	}

	/**
	 * @return the ideaCnt
	 */
	public String getIdeaCnt() {
		return ideaCnt;
	}

	/**
	 * @param ideaCnt the ideaCnt to set
	 */
	public void setIdeaCnt(String ideaCnt) {
		this.ideaCnt = ideaCnt;
	}

	/**
	 * @return the ideaScore
	 */
	public String getIdeaScore() {
		return ideaScore;
	}

	/**
	 * @param ideaScore the ideaScore to set
	 */
	public void setIdeaScore(String ideaScore) {
		this.ideaScore = ideaScore;
	}

	/**
	 * @return the ideaRcmdCnt
	 */
	public String getIdeaRcmdCnt() {
		return ideaRcmdCnt;
	}

	/**
	 * @param ideaRcmdCnt the ideaRcmdCnt to set
	 */
	public void setIdeaRcmdCnt(String ideaRcmdCnt) {
		this.ideaRcmdCnt = ideaRcmdCnt;
	}

	/**
	 * @return the ideaRcmdScore
	 */
	public String getIdeaRcmdScore() {
		return ideaRcmdScore;
	}

	/**
	 * @param ideaRcmdScore the ideaRcmdScore to set
	 */
	public void setIdeaRcmdScore(String ideaRcmdScore) {
		this.ideaRcmdScore = ideaRcmdScore;
	}

	/**
	 * @return the memberCpnCast
	 */
	public String getMemberCpnCast() {
		return memberCpnCast;
	}

	/**
	 * @param memberCpnCast the memberCpnCast to set
	 */
	public void setMemberCpnCast(String memberCpnCast) {
		this.memberCpnCast = memberCpnCast;
	}

	/**
	 * @return the memberCpnIntroduce
	 */
	public String getMemberCpnIntroduce() {
		return memberCpnIntroduce;
	}

	/**
	 * @param memberCpnIntroduce the memberCpnIntroduce to set
	 */
	public void setMemberCpnIntroduce(String memberCpnIntroduce) {
		this.memberCpnIntroduce = memberCpnIntroduce;
	}

	/**
	 * @return the shareholderCpnCast
	 */
	public String getShareholderCpnCast() {
		return shareholderCpnCast;
	}

	/**
	 * @param shareholderCpnCast the shareholderCpnCast to set
	 */
	public void setShareholderCpnCast(String shareholderCpnCast) {
		this.shareholderCpnCast = shareholderCpnCast;
	}

	/**
	 * @return the shareholderCpnIntroduce
	 */
	public String getShareholderCpnIntroduce() {
		return shareholderCpnIntroduce;
	}

	/**
	 * @param shareholderCpnIntroduce the shareholderCpnIntroduce to set
	 */
	public void setShareholderCpnIntroduce(String shareholderCpnIntroduce) {
		this.shareholderCpnIntroduce = shareholderCpnIntroduce;
	}

	/**
	 * @return the spac
	 */
	public String getSpac() {
		return spac;
	}

	/**
	 * @param spac the spac to set
	 */
	public void setSpac(String spac) {
		this.spac = spac;
	}

	/**
	 * @return the ipo
	 */
	public String getIpo() {
		return ipo;
	}

	/**
	 * @param ipo the ipo to set
	 */
	public void setIpo(String ipo) {
		this.ipo = ipo;
	}

	/**
	 * @return the spacGood
	 */
	public String getSpacGood() {
		return spacGood;
	}

	/**
	 * @param spacGood the spacGood to set
	 */
	public void setSpacGood(String spacGood) {
		this.spacGood = spacGood;
	}

	/**
	 * @return the ipoGood
	 */
	public String getIpoGood() {
		return ipoGood;
	}

	/**
	 * @param ipoGood the ipoGood to set
	 */
	public void setIpoGood(String ipoGood) {
		this.ipoGood = ipoGood;
	}

	/**
	 * @return the mnaGood
	 */
	public String getMnaGood() {
		return mnaGood;
	}

	/**
	 * @param mnaGood the mnaGood to set
	 */
	public void setMnaGood(String mnaGood) {
		this.mnaGood = mnaGood;
	}

	/**
	 * @return the rcmdOpinion
	 */
	public String getRcmdOpinion() {
		return rcmdOpinion;
	}

	/**
	 * @param rcmdOpinion the rcmdOpinion to set
	 */
	public void setRcmdOpinion(String rcmdOpinion) {
		this.rcmdOpinion = rcmdOpinion;
	}

	/**
	 * @return the memberCpnCastGood
	 */
	public String getMemberCpnCastGood() {
		return memberCpnCastGood;
	}

	/**
	 * @param memberCpnCastGood the memberCpnCastGood to set
	 */
	public void setMemberCpnCastGood(String memberCpnCastGood) {
		this.memberCpnCastGood = memberCpnCastGood;
	}

	/**
	 * @return the memberCpnIntroduceGood
	 */
	public String getMemberCpnIntroduceGood() {
		return memberCpnIntroduceGood;
	}

	/**
	 * @param memberCpnIntroduceGood the memberCpnIntroduceGood to set
	 */
	public void setMemberCpnIntroduceGood(String memberCpnIntroduceGood) {
		this.memberCpnIntroduceGood = memberCpnIntroduceGood;
	}

	/**
	 * @return the shareholderCpnCastGood
	 */
	public String getShareholderCpnCastGood() {
		return shareholderCpnCastGood;
	}

	/**
	 * @param shareholderCpnCastGood the shareholderCpnCastGood to set
	 */
	public void setShareholderCpnCastGood(String shareholderCpnCastGood) {
		this.shareholderCpnCastGood = shareholderCpnCastGood;
	}

	/**
	 * @return the shareholderCpnIntroduceGood
	 */
	public String getShareholderCpnIntroduceGood() {
		return shareholderCpnIntroduceGood;
	}

	/**
	 * @param shareholderCpnIntroduceGood the shareholderCpnIntroduceGood to set
	 */
	public void setShareholderCpnIntroduceGood(String shareholderCpnIntroduceGood) {
		this.shareholderCpnIntroduceGood = shareholderCpnIntroduceGood;
	}

	/**
	 * @return the disposalPrice
	 */
	public String getDisposalPrice() {
		return disposalPrice;
	}

	/**
	 * @param disposalPrice the disposalPrice to set
	 */
	public void setDisposalPrice(String disposalPrice) {
		this.disposalPrice = disposalPrice;
	}

	
	
	public String getDisposalMargin() {
		return disposalMargin;
	}

	public void setDisposalMargin(String disposalMargin) {
		this.disposalMargin = disposalMargin;
	}

	/**
	 * @return the disposal
	 */
	public String getDisposal() {
		return disposal;
	}

	/**
	 * @param disposal the disposal to set
	 */
	public void setDisposal(String disposal) {
		this.disposal = disposal;
	}

	/**
	 * @return the disposalSupporter
	 */
	public String getDisposalSupporter() {
		return disposalSupporter;
	}

	/**
	 * @param disposalSupporter the disposalSupporter to set
	 */
	public void setDisposalSupporter(String disposalSupporter) {
		this.disposalSupporter = disposalSupporter;
	}

	/**
	 * @return the mnaMcpn
	 */
	public String getMnaMcpn() {
		return mnaMcpn;
	}

	/**
	 * @param mnaMcpn the mnaMcpn to set
	 */
	public void setMnaMcpn(String mnaMcpn) {
		this.mnaMcpn = mnaMcpn;
	}
 
}