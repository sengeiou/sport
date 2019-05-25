package com.cn.great.mapper.system;


import com.cn.great.model.system.DictEntity;
import com.cn.great.model.system.EnumType;
import com.cn.great.req.system.EnumOpeReq;
import com.cn.great.req.system.EnumReq;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DictMapper {

    List<DictEntity> listByObj(@Param("dict") DictEntity dict);

    /**
     * 根据code修改value
     *
     * @param dict
     */
    void updateValue(@Param("dict") DictEntity dict);

    List<EnumType> fetchAllEnumTypes();

    List<DictEntity> fetchEnums(EnumReq enumReq);

    List<DictEntity> fetchEnumList(EnumOpeReq enumOpeReq);

    Integer countEnums(EnumReq enumReq);

    void addEnum(EnumOpeReq enumOpeReq);

    void updateEnum(EnumOpeReq enumOpeReq);

    void deleteEnum(Integer id);

    List<EnumType> fetchEnumTypes(EnumReq enumReq);

    Integer countEnumTypes(EnumReq enumReq);

    void addEnumType(EnumOpeReq enumOpeReq);

    void updateEnumType(EnumOpeReq enumOpeReq);

    void deleteEnumType(@Param("code")String code);

    List<EnumType> fetchTypes(EnumOpeReq enumOpeReq);
}
