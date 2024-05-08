package bean;

import java.io.Serializable;

public class GAKUSEIList implements Serializable {
    
    private String NO;
    private String NAME;
    private int ENT_YEAR; // 整数型に変更
    private int CLASS_NUM; // 整数型に変更
    private boolean IS_ATTEND; // 真偽値型に変更
    private String SCHOOL_CD;

    
    // コンストラクタ
    public GAKUSEIList() {
        // デフォルトコンストラクタ
    }
    
    // ゲッターとセッター
    public String getNO() {
        return NO;
    }

    public void setNO(String NO) {
        this.NO = NO;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public int getENT_YEAR() { // ゲッターの戻り値を整数型に変更
        return ENT_YEAR;
    }

    public void setENT_YEAR(int ENT_YEAR) { // 引数を整数型に変更
        this.ENT_YEAR = ENT_YEAR;
    }

    public int getCLASS_NUM() { // ゲッターの戻り値を整数型に変更
        return CLASS_NUM;
    }

    public void setCLASS_NUM(int CLASS_NUM) { // 引数を整数型に変更
        this.CLASS_NUM = CLASS_NUM;
    }

    public boolean isIS_ATTEND() { // ゲッター名を "is" プレフィックスに変更
        return IS_ATTEND;
    }

    public void setIS_ATTEND(boolean IS_ATTEND) { // 引数を真偽値型に変更
        this.IS_ATTEND = IS_ATTEND;
    }

    public String getSCHOOL_CD() {
        return SCHOOL_CD;
    }

    public void setSCHOOL_CD(String SCHOOL_CD) {
        this.SCHOOL_CD = SCHOOL_CD;
    }
}
