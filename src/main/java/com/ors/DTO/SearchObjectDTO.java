package com.ors.DTO;

public class SearchObjectDTO {

    private String objectPlace;
    private String date;
    private String startTime;
    private String endTime;

    public String getObjectPlace() {
        return objectPlace;
    }

    public void setObjectPlace(String objectPlace) {
        this.objectPlace = objectPlace;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "SearchObjectDTO{" +
                "objectPlace='" + objectPlace + '\'' +
                ", date='" + date + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }
}
