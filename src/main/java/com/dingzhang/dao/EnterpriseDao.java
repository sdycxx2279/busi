package com.dingzhang.dao;

import com.dingzhang.model.Enterprise;
import com.dingzhang.model.EnterpriseExample;
import com.dingzhang.model.EnterpriseKey;
import com.dingzhang.model.EnterpriseWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EnterpriseDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int countByExample(EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int deleteByExample(EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(EnterpriseKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int insert(EnterpriseWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int insertSelective(EnterpriseWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    List<EnterpriseWithBLOBs> selectByExampleWithBLOBs(EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    List<Enterprise> selectByExample(EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    EnterpriseWithBLOBs selectByPrimaryKey(EnterpriseKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") EnterpriseWithBLOBs record, @Param("example") EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByExampleWithBLOBs(@Param("record") EnterpriseWithBLOBs record, @Param("example") EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Enterprise record, @Param("example") EnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(EnterpriseWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByPrimaryKeyWithBLOBs(EnterpriseWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table enterprise
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Enterprise record);

    int updateType(int type);

    int deleteById(int id);

    EnterpriseWithBLOBs selectById(int id);
}