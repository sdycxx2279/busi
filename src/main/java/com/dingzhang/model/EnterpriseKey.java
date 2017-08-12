package com.dingzhang.model;

public class EnterpriseKey {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column enterprise.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column enterprise.lng
     *
     * @mbggenerated
     */
    private Double lng;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    public EnterpriseKey(Integer id, Double lng) {
        this.id = id;
        this.lng = lng;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    public EnterpriseKey() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column enterprise.id
     *
     * @return the value of enterprise.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column enterprise.id
     *
     * @param id the value for enterprise.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column enterprise.lng
     *
     * @return the value of enterprise.lng
     *
     * @mbggenerated
     */
    public Double getLng() {
        return lng;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column enterprise.lng
     *
     * @param lng the value for enterprise.lng
     *
     * @mbggenerated
     */
    public void setLng(Double lng) {
        this.lng = lng;
    }

    @Override
    public String toString() {
        return "EnterpriseKey{" +
                "id=" + id +
                ", lng=" + lng +
                '}';
    }
}