package com.cn.great.service;

import com.cn.great.model.system.DictEntity;
import com.cn.great.model.system.EnumType;
import com.cn.great.req.system.EnumOpeReq;
import com.cn.great.req.system.EnumReq;

import java.util.List;

/**
 * @Description: 会员管理Service接口
 * @Author: Stamp.M
 * @Date: 2019/3/21
 */

public interface DictService {

    /**
     * @Description: 查询所有的数据字典类型
     * @Param: []
     * @return: java.util.List<com.cn.great.model.system.EnumType>
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    List<EnumType> fetchAllEnumTypes();

    /**
     * @Description: 数据字典查询
     * @Param: [enumReq]
     * @return: java.util.List<com.cn.great.model.system.DictEntity>
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    List<DictEntity> fetchEnums(EnumReq enumReq);

    /**
     * @Description: 参数数汇总
     * @Param: [enumReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    Integer countEnums(EnumReq enumReq);

    /**
     * @Description: 新增参数
     * @Param: [enumOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void addEnum(EnumOpeReq enumOpeReq);

    /**
     * @Description: 修改参数
     * @Param: [enumOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void updateEnum(EnumOpeReq enumOpeReq);

    /**
     * @Description: 删除参数
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void deleteEnum(Integer id);

    /**
     * @Description: 校验参数是否已经存在
     * @Param: [enumOpeReq]
     * @return: boolean
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    boolean checkEnumExist(EnumOpeReq enumOpeReq);

    /**
    * @Description: 检验参数类型是否存在
    * @Param: [enumOpeReq]
    * @return: boolean
    * @Author: Stamp
    * @Date: 2019/5/22
    */
    boolean checkEnumTypeExist(EnumOpeReq enumOpeReq, Integer type);

    /**
     * 获取所有维护相关的i洗脑洗
     *
     * @param typeCode
     * @return
     */
    List<DictEntity> getAllType(String typeCode);

    /**
     * 根据code获取对象
     *
     * @param code
     * @return
     */
    DictEntity getByCode(String code);

    /**
     * @param key
     * @return
     */
    String getDictValue(String key);

    /**
     * 批量修改字典表的值
     *
     * @param data
     */
    void updateDictObj(List<DictEntity> data);

    /**
     * @Description: 参数类型查询
     * @Param: [enumReq]
     * @return: java.util.List<com.cn.great.model.system.EnumType>
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    List<EnumType> fetchEnumTypes(EnumReq enumReq);

    /**
     * @Description: 参数类型汇总
     * @Param: [enumReq]
     * @return: java.lang.Integer
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    Integer countEnumTypes(EnumReq enumReq);

    /**
     * @Description: 新增参数类型
     * @Param: [enumOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void addEnumType(EnumOpeReq enumOpeReq);

    /**
     * @Description: 修改参数类型
     * @Param: [enumOpeReq]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void updateEnumType(EnumOpeReq enumOpeReq);

    /**
     * @Description: 删除参数类型
     * @Param: [id]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    void deleteEnumType(String code);

}
