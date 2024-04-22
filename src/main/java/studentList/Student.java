package studentList;

public class Student {
    private int id;
    private String name;
    private int entranceYear;
    private int classNumber;
    private boolean isAttend;
    private String schoolCode;

    public Student(int id, String name, int entranceYear, int classNumber, boolean isAttend, String schoolCode) {
        this.id = id;
        this.name = name;
        this.entranceYear = entranceYear;
        this.classNumber = classNumber;
        this.isAttend = isAttend;
        this.schoolCode = schoolCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEntranceYear() {
        return entranceYear;
    }

    public void setEntranceYear(int entranceYear) {
        this.entranceYear = entranceYear;
    }

    public int getClassNumber() {
        return classNumber;
    }

    public void setClassNumber(int classNumber) {
        this.classNumber = classNumber;
    }

    public boolean isAttend() {
        return isAttend;
    }

    public void setAttend(boolean attend) {
        isAttend = attend;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }
}
