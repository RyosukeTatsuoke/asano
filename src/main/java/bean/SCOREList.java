package bean;

import java.io.Serializable;

public class SCOREList implements Serializable {
    
    private String studentNo;
    private String subjectCd;
    private String schoolCd;
    private int point;
    private int classNum;

    // コンストラクタ
    public SCOREList() {
        // デフォルトコンストラクタ
    }

    // ゲッターとセッター
    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getSubjectCd() {
        return subjectCd;
    }

    public void setSubjectCd(String subjectCd) {
        this.subjectCd = subjectCd;
    }

    public String getSchoolCd() {
        return schoolCd;
    }

    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getClassNum() {
        return classNum;
    }

    public void setClassNum(int classNum) {
        this.classNum = classNum;
    }
}
