package bean;

public class GAKUSEIList implements java.io.Serializable{
	
	private String NO;
	private String NAME;
	private String ENT_YEAR;
	private String CLASS_NUM;
	private String IS_ATTEND;
	private String SCHOOL_CD;
	
	public String getNO() {
		return NO;
	}
	public String getNAME() {
		return NAME;
	}
	public String getENT_YEAR() {
		return ENT_YEAR;
	}
	public String getCLASS_NUM() {
		return CLASS_NUM;
	}
	public String getIS_ATTEND() {
		return IS_ATTEND;
	}
	public String getSCHOOL_CD() {
		return SCHOOL_CD;
	}
	
	public void setNO(String NO) {
		this.NO=NO;
	}
	public void setNAME(String NAME) {
		this.NAME=NAME;
	}
	public void setENT_YEAR(String ENT_YEAR) {
		this.ENT_YEAR=ENT_YEAR;
	}
	public void setCLASS_NUM(String CLASS_NUM) {
		this.CLASS_NUM=CLASS_NUM;
	}
	public void setIS_ATTEND(String IS_ATTEND) {
		this.IS_ATTEND=IS_ATTEND;
	}
	public void setSCHOOL_CD(String SCHOOL_CD) {
		this.SCHOOL_CD=SCHOOL_CD;
	}
}