package com.ssm.pet.pojo;

public class LabelTO {
    private Integer labelId;//专题ID
    private String labelName;//专题名称
    //////////////////////////////

    public LabelTO(Integer labelId, String labelName) {
        this.labelId = labelId;
        this.labelName = labelName;
    }

    public LabelTO() {
    }
    ///////////////////////////////

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }
}
