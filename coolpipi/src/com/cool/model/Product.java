package com.cool.model;

import java.io.File;

/**
 * @author zorro
 * 首页上展示的product对象
 */
public class Product {
    int uid;             //主键
    String name;         //物品名称
    String summary;      //物品描述
    String defaultPic;   //图片路径
    File file;           //图片文件

    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setDefaultPic(String defaultPic) {
        this.defaultPic = defaultPic;
    }

    public void setFile(File file){
        this.file = file;
    }

    public int getUid() {
        return uid;
    }

    public String getName() {
        return name;
    }

    public String getSummary() {
        return summary;
    }

    public String getDefaultPic() {
        return defaultPic;
    }

    public File getFile(){
        return file;
    }
}
