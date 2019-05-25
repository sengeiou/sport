package com.cn.great.mapper.system;

import com.cn.great.model.system.QuestionData;

public interface QuestionDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QuestionData record);

    int insertSelective(QuestionData record);

    QuestionData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionData record);

    int updateByPrimaryKey(QuestionData record);
}