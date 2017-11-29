package ib.personnel.service;

import ib.cmm.ComDefaultVO;
import ib.work.service.WorkVO;


/**
 * <pre>
 * package  : ib.personnel.service
 * filename : ManagementVO.java
 * </pre>
 * 
 * @author  : ChanWoo Lee
 * @since   : 2013. 1. 10.
 * @version : 1.0.0
 */
@SuppressWarnings("serial")
public class ManagementVO  extends WorkVO{
	
	private String sNb = "";
	private String rgId = "";
	private String usrNm = "";
	private String usrId = "";
	private String phn1 = "";
	private String phn2 = "";
	private String phn3 = "";
	private String email = "";
	private String engNm = "";
	private String office = "";
	private String position = "";
	private String joinDt = "";
	private String fulltimeDt = "";
	private String resignDt = "";
	private String birthDt = "";
	private String marriedDt = "";
	private String emergencyCall = "";
	private String emergencyRelation = "";
	private String passport = "";
	private String hobby = "";
	private String abillity = "";
	private String address = "";
	private String religion = "";
	private String blood = "";
	
	private String rtnVal = "";
	
	/* common */
	private int listLeng = 0;
	private String staffSNb = "";
	private String[] sNbUP;
	
	/* family */
	private String familyNm = "";
	private String familyBirthDt = "";
	private String relation = "";
	private String job = "";
	private String live = "";
	private String[] familyNmUP;
	private String[] familyBirthDtUP;
	private String[] relationUP;
	private String[] jobUP;
	private String[] liveUP;
	
	/* academic */
	private String academicNm = "";
	private String academicGd = "";
	private String major = "";
	private String joinSchoolDt = "";
	private String graduate = "";
	private String[] ARacademicNm;
	private String[] ARacademicGd;
	private String[] ARmajor;
	private String[] ARjoinSchoolDt;
	private String[] ARgraduate;
	
	/* career */
	private String joinCpnDt = "";
	private String resignCpnDt = "";
	private String companyNm = "";
	private String[] ARjoinCpnDt;
	private String[] ARresignCpnDt;
	private String[] ARcompanyNm;
	private String[] ARjob;
	
	/* license */
	private String licenseNm = "";
	private String issue = "";
	private String obtainDt = "";
	private String[] ARlicenseNm;
	private String[] ARissue;
	private String[] ARobtainDt;
	
	/* insideCareer */
	private String promotionDt = "";
	private String division = "";
	private String[] ARpromotionDt;
	private String[] ARdivision;
	private String[] ARposition;
	
	/* justice */
	private String justiceDt = "";
	private String reason = "";
	private String comment = "";
	private String[] ARjusticeDt;
	private String[] ARreason;
	private String[] ARcomment;
	
	/* salary */
	private String variableDt = "";
	private String pay = "";
	private String[] ARvariableDt;
	private String[] ARpay;
	
	/* assessment */
	private String assessmentDt = "";
	private String assessmentScore = "";
	private String[] ARassessmentDt;
	private String[] ARassessmentScore;
	
	/*  */
	private String contents = "";
	private String[] ARcontents;
	
	/* stockOption */
	private String GsNb = "";
	private String turn = "";
	private String flag = "";
	private String stockDt = "";
	private String quantity = "";
	private String[] ARGsNb;
	private String[] ARturn;
	private String[] ARGturn;
	private String[] ARflag;
	private String[] ARstockDt;
	private String[] ARGstockDt;
	private String[] ARquantity;
	private String[] ARGquantity;
	
	
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
	 * @return the usrNm
	 */
	public String getUsrNm() {
		return usrNm;
	}
	/**
	 * @param usrNm the usrNm to set
	 */
	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}
	/**
	 * @return the usrId
	 */
	public String getUsrId() {
		return usrId;
	}
	/**
	 * @param usrId the usrId to set
	 */
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	/**
	 * @return the phn1
	 */
	public String getPhn1() {
		return phn1;
	}
	/**
	 * @param phn1 the phn1 to set
	 */
	public void setPhn1(String phn1) {
		this.phn1 = phn1;
	}
	/**
	 * @return the phn2
	 */
	public String getPhn2() {
		return phn2;
	}
	/**
	 * @param phn2 the phn2 to set
	 */
	public void setPhn2(String phn2) {
		this.phn2 = phn2;
	}
	/**
	 * @return the phn3
	 */
	public String getPhn3() {
		return phn3;
	}
	/**
	 * @param phn3 the phn3 to set
	 */
	public void setPhn3(String phn3) {
		this.phn3 = phn3;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the engNm
	 */
	public String getEngNm() {
		return engNm;
	}
	/**
	 * @param engNm the engNm to set
	 */
	public void setEngNm(String engNm) {
		this.engNm = engNm;
	}
	/**
	 * @return the office
	 */
	public String getOffice() {
		return office;
	}
	/**
	 * @param office the office to set
	 */
	public void setOffice(String office) {
		this.office = office;
	}
	/**
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}
	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}
	/**
	 * @return the joinDt
	 */
	public String getJoinDt() {
		return joinDt;
	}
	/**
	 * @param joinDt the joinDt to set
	 */
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}
	/**
	 * @return the fulltimeDt
	 */
	public String getFulltimeDt() {
		return fulltimeDt;
	}
	/**
	 * @param fulltimeDt the fulltimeDt to set
	 */
	public void setFulltimeDt(String fulltimeDt) {
		this.fulltimeDt = fulltimeDt;
	}
	/**
	 * @return the resignDt
	 */
	public String getResignDt() {
		return resignDt;
	}
	/**
	 * @param resignDt the resignDt to set
	 */
	public void setResignDt(String resignDt) {
		this.resignDt = resignDt;
	}
	/**
	 * @return the marriedDt
	 */
	public String getMarriedDt() {
		return marriedDt;
	}
	/**
	 * @param marriedDt the marriedDt to set
	 */
	public void setMarriedDt(String marriedDt) {
		this.marriedDt = marriedDt;
	}
	/**
	 * @return the emergencyCall
	 */
	public String getEmergencyCall() {
		return emergencyCall;
	}
	/**
	 * @param emergencyCall the emergencyCall to set
	 */
	public void setEmergencyCall(String emergencyCall) {
		this.emergencyCall = emergencyCall;
	}
	/**
	 * @return the emergencyRelation
	 */
	public String getEmergencyRelation() {
		return emergencyRelation;
	}
	/**
	 * @param emergencyRelation the emergencyRelation to set
	 */
	public void setEmergencyRelation(String emergencyRelation) {
		this.emergencyRelation = emergencyRelation;
	}
	/**
	 * @return the hobby
	 */
	public String getHobby() {
		return hobby;
	}
	/**
	 * @param hobby the hobby to set
	 */
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	/**
	 * @return the abillity
	 */
	public String getAbillity() {
		return abillity;
	}
	/**
	 * @param abillity the abillity to set
	 */
	public void setAbillity(String abillity) {
		this.abillity = abillity;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the religion
	 */
	public String getReligion() {
		return religion;
	}
	/**
	 * @param religion the religion to set
	 */
	public void setReligion(String religion) {
		this.religion = religion;
	}
	/**
	 * @return the blood
	 */
	public String getBlood() {
		return blood;
	}
	/**
	 * @param blood the blood to set
	 */
	public void setBlood(String blood) {
		this.blood = blood;
	}
	/**
	 * @return the birthDt
	 */
	public String getBirthDt() {
		return birthDt;
	}
	/**
	 * @param birthDt the birthDt to set
	 */
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	/**
	 * @return the passport
	 */
	public String getPassport() {
		return passport;
	}
	/**
	 * @param passport the passport to set
	 */
	public void setPassport(String passport) {
		this.passport = passport;
	}
	/**
	 * @return the staffSNb
	 */
	public String getStaffSNb() {
		return staffSNb;
	}
	/**
	 * @param staffSNb the staffSNb to set
	 */
	public void setStaffSNb(String staffSNb) {
		this.staffSNb = staffSNb;
	}
	/**
	 * @return the familyNm
	 */
	public String getFamilyNm() {
		return familyNm;
	}
	/**
	 * @param familyNm the familyNm to set
	 */
	public void setFamilyNm(String familyNm) {
		this.familyNm = familyNm;
	}
	/**
	 * @return the relation
	 */
	public String getRelation() {
		return relation;
	}
	/**
	 * @param relation the relation to set
	 */
	public void setRelation(String relation) {
		this.relation = relation;
	}
	/**
	 * @return the job
	 */
	public String getJob() {
		return job;
	}
	/**
	 * @param job the job to set
	 */
	public void setJob(String job) {
		this.job = job;
	}
	/**
	 * @return the live
	 */
	public String getLive() {
		return live;
	}
	/**
	 * @param live the live to set
	 */
	public void setLive(String live) {
		this.live = live;
	}
	/**
	 * @return the sNbUP
	 */
	public String[] getSNbUP() {
		return sNbUP;
	}
	/**
	 * @param sNbUP the sNbUP to set
	 */
	public void setSNbUP(String[] sNbUP) {
		this.sNbUP = sNbUP;
	}
	/**
	 * @return the familyNmUP
	 */
	public String[] getFamilyNmUP() {
		return familyNmUP;
	}
	/**
	 * @param familyNmUP the familyNmUP to set
	 */
	public void setFamilyNmUP(String[] familyNmUP) {
		this.familyNmUP = familyNmUP;
	}
	/**
	 * @return the relationUP
	 */
	public String[] getRelationUP() {
		return relationUP;
	}
	/**
	 * @param relationUP the relationUP to set
	 */
	public void setRelationUP(String[] relationUP) {
		this.relationUP = relationUP;
	}
	/**
	 * @return the jobUP
	 */
	public String[] getJobUP() {
		return jobUP;
	}
	/**
	 * @param jobUP the jobUP to set
	 */
	public void setJobUP(String[] jobUP) {
		this.jobUP = jobUP;
	}
	/**
	 * @return the liveUP
	 */
	public String[] getLiveUP() {
		return liveUP;
	}
	/**
	 * @param liveUP the liveUP to set
	 */
	public void setLiveUP(String[] liveUP) {
		this.liveUP = liveUP;
	}
	/**
	 * @return the familyBirthDt
	 */
	public String getFamilyBirthDt() {
		return familyBirthDt;
	}
	/**
	 * @param familyBirthDt the familyBirthDt to set
	 */
	public void setFamilyBirthDt(String familyBirthDt) {
		this.familyBirthDt = familyBirthDt;
	}
	/**
	 * @return the familyBirthDtUP
	 */
	public String[] getFamilyBirthDtUP() {
		return familyBirthDtUP;
	}
	/**
	 * @param familyBirthDtUP the familyBirthDtUP to set
	 */
	public void setFamilyBirthDtUP(String[] familyBirthDtUP) {
		this.familyBirthDtUP = familyBirthDtUP;
	}
	/**
	 * @return the listLeng
	 */
	public int getListLeng() {
		return listLeng;
	}
	/**
	 * @param listLeng the listLeng to set
	 */
	public void setListLeng(int listLeng) {
		this.listLeng = listLeng;
	}
	/**
	 * @return the sNbUP
	 */
	public String[] getsNbUP() {
		return sNbUP;
	}
	/**
	 * @param sNbUP the sNbUP to set
	 */
	public void setsNbUP(String[] sNbUP) {
		this.sNbUP = sNbUP;
	}
	/**
	 * @return the academicNm
	 */
	public String getAcademicNm() {
		return academicNm;
	}
	/**
	 * @param academicNm the academicNm to set
	 */
	public void setAcademicNm(String academicNm) {
		this.academicNm = academicNm;
	}
	/**
	 * @return the major
	 */
	public String getMajor() {
		return major;
	}
	/**
	 * @param major the major to set
	 */
	public void setMajor(String major) {
		this.major = major;
	}
	/**
	 * @return the joinSchoolDt
	 */
	public String getJoinSchoolDt() {
		return joinSchoolDt;
	}
	/**
	 * @param joinSchoolDt the joinSchoolDt to set
	 */
	public void setJoinSchoolDt(String joinSchoolDt) {
		this.joinSchoolDt = joinSchoolDt;
	}
	/**
	 * @return the graduate
	 */
	public String getGraduate() {
		return graduate;
	}
	/**
	 * @param graduate the graduate to set
	 */
	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}
	/**
	 * @return the academicGd
	 */
	public String getAcademicGd() {
		return academicGd;
	}
	/**
	 * @param academicGd the academicGd to set
	 */
	public void setAcademicGd(String academicGd) {
		this.academicGd = academicGd;
	}
	/**
	 * @return the aRacademicNm
	 */
	public String[] getARacademicNm() {
		return ARacademicNm;
	}
	/**
	 * @param aRacademicNm the aRacademicNm to set
	 */
	public void setARacademicNm(String[] aRacademicNm) {
		ARacademicNm = aRacademicNm;
	}
	/**
	 * @return the aRacademicGd
	 */
	public String[] getARacademicGd() {
		return ARacademicGd;
	}
	/**
	 * @param aRacademicGd the aRacademicGd to set
	 */
	public void setARacademicGd(String[] aRacademicGd) {
		ARacademicGd = aRacademicGd;
	}
	/**
	 * @return the aRmajor
	 */
	public String[] getARmajor() {
		return ARmajor;
	}
	/**
	 * @param aRmajor the aRmajor to set
	 */
	public void setARmajor(String[] aRmajor) {
		ARmajor = aRmajor;
	}
	/**
	 * @return the aRjoinSchoolDt
	 */
	public String[] getARjoinSchoolDt() {
		return ARjoinSchoolDt;
	}
	/**
	 * @param aRjoinSchoolDt the aRjoinSchoolDt to set
	 */
	public void setARjoinSchoolDt(String[] aRjoinSchoolDt) {
		ARjoinSchoolDt = aRjoinSchoolDt;
	}
	/**
	 * @return the aRgraduate
	 */
	public String[] getARgraduate() {
		return ARgraduate;
	}
	/**
	 * @param aRgraduate the aRgraduate to set
	 */
	public void setARgraduate(String[] aRgraduate) {
		ARgraduate = aRgraduate;
	}
	/**
	 * @return the rtnVal
	 */
	public String getRtnVal() {
		return rtnVal;
	}
	/**
	 * @param rtnVal the rtnVal to set
	 */
	public void setRtnVal(String rtnVal) {
		this.rtnVal = rtnVal;
	}
	/**
	 * @return the joinCpnDt
	 */
	public String getJoinCpnDt() {
		return joinCpnDt;
	}
	/**
	 * @param joinCpnDt the joinCpnDt to set
	 */
	public void setJoinCpnDt(String joinCpnDt) {
		this.joinCpnDt = joinCpnDt;
	}
	/**
	 * @return the resignCpnDt
	 */
	public String getResignCpnDt() {
		return resignCpnDt;
	}
	/**
	 * @param resignCpnDt the resignCpnDt to set
	 */
	public void setResignCpnDt(String resignCpnDt) {
		this.resignCpnDt = resignCpnDt;
	}
	/**
	 * @return the companyNm
	 */
	public String getCompanyNm() {
		return companyNm;
	}
	/**
	 * @param companyNm the companyNm to set
	 */
	public void setCompanyNm(String companyNm) {
		this.companyNm = companyNm;
	}
	/**
	 * @return the aRjoinCpnDt
	 */
	public String[] getARjoinCpnDt() {
		return ARjoinCpnDt;
	}
	/**
	 * @param aRjoinCpnDt the aRjoinCpnDt to set
	 */
	public void setARjoinCpnDt(String[] aRjoinCpnDt) {
		ARjoinCpnDt = aRjoinCpnDt;
	}
	/**
	 * @return the aRresignCpnDt
	 */
	public String[] getARresignCpnDt() {
		return ARresignCpnDt;
	}
	/**
	 * @param aRresignCpnDt the aRresignCpnDt to set
	 */
	public void setARresignCpnDt(String[] aRresignCpnDt) {
		ARresignCpnDt = aRresignCpnDt;
	}
	/**
	 * @return the aRcompanyNm
	 */
	public String[] getARcompanyNm() {
		return ARcompanyNm;
	}
	/**
	 * @param aRcompanyNm the aRcompanyNm to set
	 */
	public void setARcompanyNm(String[] aRcompanyNm) {
		ARcompanyNm = aRcompanyNm;
	}
	/**
	 * @return the licenseNm
	 */
	public String getLicenseNm() {
		return licenseNm;
	}
	/**
	 * @param licenseNm the licenseNm to set
	 */
	public void setLicenseNm(String licenseNm) {
		this.licenseNm = licenseNm;
	}
	/**
	 * @return the issue
	 */
	public String getIssue() {
		return issue;
	}
	/**
	 * @param issue the issue to set
	 */
	public void setIssue(String issue) {
		this.issue = issue;
	}
	/**
	 * @return the obtainDt
	 */
	public String getObtainDt() {
		return obtainDt;
	}
	/**
	 * @param obtainDt the obtainDt to set
	 */
	public void setObtainDt(String obtainDt) {
		this.obtainDt = obtainDt;
	}
	/**
	 * @return the aRlicenseNm
	 */
	public String[] getARlicenseNm() {
		return ARlicenseNm;
	}
	/**
	 * @param aRlicenseNm the aRlicenseNm to set
	 */
	public void setARlicenseNm(String[] aRlicenseNm) {
		ARlicenseNm = aRlicenseNm;
	}
	/**
	 * @return the aRissue
	 */
	public String[] getARissue() {
		return ARissue;
	}
	/**
	 * @param aRissue the aRissue to set
	 */
	public void setARissue(String[] aRissue) {
		ARissue = aRissue;
	}
	/**
	 * @return the aRobtainDt
	 */
	public String[] getARobtainDt() {
		return ARobtainDt;
	}
	/**
	 * @param aRobtainDt the aRobtainDt to set
	 */
	public void setARobtainDt(String[] aRobtainDt) {
		ARobtainDt = aRobtainDt;
	}
	/**
	 * @return the promotionDt
	 */
	public String getPromotionDt() {
		return promotionDt;
	}
	/**
	 * @param promotionDt the promotionDt to set
	 */
	public void setPromotionDt(String promotionDt) {
		this.promotionDt = promotionDt;
	}
	/**
	 * @return the division
	 */
	public String getDivision() {
		return division;
	}
	/**
	 * @param division the division to set
	 */
	public void setDivision(String division) {
		this.division = division;
	}
	/**
	 * @return the aRpromotionDt
	 */
	public String[] getARpromotionDt() {
		return ARpromotionDt;
	}
	/**
	 * @param aRpromotionDt the aRpromotionDt to set
	 */
	public void setARpromotionDt(String[] aRpromotionDt) {
		ARpromotionDt = aRpromotionDt;
	}
	/**
	 * @return the aRdivision
	 */
	public String[] getARdivision() {
		return ARdivision;
	}
	/**
	 * @param aRdivision the aRdivision to set
	 */
	public void setARdivision(String[] aRdivision) {
		ARdivision = aRdivision;
	}
	/**
	 * @return the aRposition
	 */
	public String[] getARposition() {
		return ARposition;
	}
	/**
	 * @param aRposition the aRposition to set
	 */
	public void setARposition(String[] aRposition) {
		ARposition = aRposition;
	}
	/**
	 * @return the justiceDt
	 */
	public String getJusticeDt() {
		return justiceDt;
	}
	/**
	 * @param justiceDt the justiceDt to set
	 */
	public void setJusticeDt(String justiceDt) {
		this.justiceDt = justiceDt;
	}
	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}
	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
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
	 * @return the aRjusticeDt
	 */
	public String[] getARjusticeDt() {
		return ARjusticeDt;
	}
	/**
	 * @param aRjusticeDt the aRjusticeDt to set
	 */
	public void setARjusticeDt(String[] aRjusticeDt) {
		ARjusticeDt = aRjusticeDt;
	}
	/**
	 * @return the aRreason
	 */
	public String[] getARreason() {
		return ARreason;
	}
	/**
	 * @param aRreason the aRreason to set
	 */
	public void setARreason(String[] aRreason) {
		ARreason = aRreason;
	}
	/**
	 * @return the aRcomment
	 */
	public String[] getARcomment() {
		return ARcomment;
	}
	/**
	 * @param aRcomment the aRcomment to set
	 */
	public void setARcomment(String[] aRcomment) {
		ARcomment = aRcomment;
	}
	/**
	 * @return the variableDt
	 */
	public String getVariableDt() {
		return variableDt;
	}
	/**
	 * @param variableDt the variableDt to set
	 */
	public void setVariableDt(String variableDt) {
		this.variableDt = variableDt;
	}
	/**
	 * @return the pay
	 */
	public String getPay() {
		return pay;
	}
	/**
	 * @param pay the pay to set
	 */
	public void setPay(String pay) {
		this.pay = pay;
	}
	/**
	 * @return the aRvariableDt
	 */
	public String[] getARvariableDt() {
		return ARvariableDt;
	}
	/**
	 * @param aRvariableDt the aRvariableDt to set
	 */
	public void setARvariableDt(String[] aRvariableDt) {
		ARvariableDt = aRvariableDt;
	}
	/**
	 * @return the aRpay
	 */
	public String[] getARpay() {
		return ARpay;
	}
	/**
	 * @param aRpay the aRpay to set
	 */
	public void setARpay(String[] aRpay) {
		ARpay = aRpay;
	}
	/**
	 * @return the assessmentDt
	 */
	public String getAssessmentDt() {
		return assessmentDt;
	}
	/**
	 * @param assessmentDt the assessmentDt to set
	 */
	public void setAssessmentDt(String assessmentDt) {
		this.assessmentDt = assessmentDt;
	}
	/**
	 * @return the assessmentScore
	 */
	public String getAssessmentScore() {
		return assessmentScore;
	}
	/**
	 * @param assessmentScore the assessmentScore to set
	 */
	public void setAssessmentScore(String assessmentScore) {
		this.assessmentScore = assessmentScore;
	}
	/**
	 * @return the aRassessmentDt
	 */
	public String[] getARassessmentDt() {
		return ARassessmentDt;
	}
	/**
	 * @param aRassessmentDt the aRassessmentDt to set
	 */
	public void setARassessmentDt(String[] aRassessmentDt) {
		ARassessmentDt = aRassessmentDt;
	}
	/**
	 * @return the aRassessmentScore
	 */
	public String[] getARassessmentScore() {
		return ARassessmentScore;
	}
	/**
	 * @param aRassessmentScore the aRassessmentScore to set
	 */
	public void setARassessmentScore(String[] aRassessmentScore) {
		ARassessmentScore = aRassessmentScore;
	}
	/**
	 * @return the contents
	 */
	public String getContents() {
		return contents;
	}
	/**
	 * @param contents the contents to set
	 */
	public void setContents(String contents) {
		this.contents = contents;
	}
	/**
	 * @return the aRcontents
	 */
	public String[] getARcontents() {
		return ARcontents;
	}
	/**
	 * @param aRcontents the aRcontents to set
	 */
	public void setARcontents(String[] aRcontents) {
		ARcontents = aRcontents;
	}
	/**
	 * @return the aRjob
	 */
	public String[] getARjob() {
		return ARjob;
	}
	/**
	 * @param aRjob the aRjob to set
	 */
	public void setARjob(String[] aRjob) {
		ARjob = aRjob;
	}
	/**
	 * @return the rgId
	 */
	public String getRgId() {
		return rgId;
	}
	/**
	 * @param rgId the rgId to set
	 */
	public void setRgId(String rgId) {
		this.rgId = rgId;
	}
	/**
	 * @return the turn
	 */
	public String getTurn() {
		return turn;
	}
	/**
	 * @param turn the turn to set
	 */
	public void setTurn(String turn) {
		this.turn = turn;
	}
	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	/**
	 * @return the quantity
	 */
	public String getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the stockDt
	 */
	public String getStockDt() {
		return stockDt;
	}
	/**
	 * @param stockDt the stockDt to set
	 */
	public void setStockDt(String stockDt) {
		this.stockDt = stockDt;
	}
	/**
	 * @return the gsNb
	 */
	public String getGsNb() {
		return GsNb;
	}
	/**
	 * @param gsNb the gsNb to set
	 */
	public void setGsNb(String gsNb) {
		GsNb = gsNb;
	}
	/**
	 * @return the aRturn
	 */
	public String[] getARturn() {
		return ARturn;
	}
	/**
	 * @param aRturn the aRturn to set
	 */
	public void setARturn(String[] aRturn) {
		ARturn = aRturn;
	}
	/**
	 * @return the aRflag
	 */
	public String[] getARflag() {
		return ARflag;
	}
	/**
	 * @param aRflag the aRflag to set
	 */
	public void setARflag(String[] aRflag) {
		ARflag = aRflag;
	}
	/**
	 * @return the aRstockDt
	 */
	public String[] getARstockDt() {
		return ARstockDt;
	}
	/**
	 * @param aRstockDt the aRstockDt to set
	 */
	public void setARstockDt(String[] aRstockDt) {
		ARstockDt = aRstockDt;
	}
	/**
	 * @return the aRGstockDt
	 */
	public String[] getARGstockDt() {
		return ARGstockDt;
	}
	/**
	 * @param aRGstockDt the aRGstockDt to set
	 */
	public void setARGstockDt(String[] aRGstockDt) {
		ARGstockDt = aRGstockDt;
	}
	/**
	 * @return the aRquantity
	 */
	public String[] getARquantity() {
		return ARquantity;
	}
	/**
	 * @param aRquantity the aRquantity to set
	 */
	public void setARquantity(String[] aRquantity) {
		ARquantity = aRquantity;
	}
	/**
	 * @return the aRGquantity
	 */
	public String[] getARGquantity() {
		return ARGquantity;
	}
	/**
	 * @param aRGquantity the aRGquantity to set
	 */
	public void setARGquantity(String[] aRGquantity) {
		ARGquantity = aRGquantity;
	}
	/**
	 * @return the aRGsNb
	 */
	public String[] getARGsNb() {
		return ARGsNb;
	}
	/**
	 * @param aRGsNb the aRGsNb to set
	 */
	public void setARGsNb(String[] aRGsNb) {
		ARGsNb = aRGsNb;
	}
	/**
	 * @return the aRGturn
	 */
	public String[] getARGturn() {
		return ARGturn;
	}
	/**
	 * @param aRGturn the aRGturn to set
	 */
	public void setARGturn(String[] aRGturn) {
		ARGturn = aRGturn;
	}


 
}