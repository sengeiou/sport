package com.cn.great.controller;


import com.cn.great.enums.ResponseCodeEnum;
import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.BaseEntity;
import com.cn.great.model.common.DictConstant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.model.system.EnumType;
import com.cn.great.req.system.EnumOpeReq;
import com.cn.great.req.system.EnumReq;
import com.cn.great.service.DictService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: sport
 * @description: 用户管理类
 * @author: Stamp.M
 * @create: 2019-03-06 19:20
 **/
@Controller
@RequestMapping("dict")
@Slf4j
public class DictController {
    @Autowired
    private DictService dictService;

    /**
     * @Description: 管理员列表跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/4/12
     */
    @RequestMapping("maintainPage")
    public String userPage() {
        return "dict/maintain";
    }

    @RequestMapping("lotterySettingPage")
    public String lotteryPage() {
        return "dict/lotterysetting";
    }

    @RequestMapping("agSettingPage")
    public String agSettingPage() {
        return "dict/agsetting";
    }

    @RequestMapping("mgSettingPage")
    public String mgSettingPage() {
        return "dict/mgsetting";
    }

    @RequestMapping("appSettingPage")
    public String appSettingPage() {
        return "dict/appsetting";
    }

    /**
     * 获取所有的系统维护的数据
     *
     * @return
     */
    @ResponseBody
    @GetMapping("list/{methodName}")
    public ResponseEntity listMaintain(@PathVariable("methodName") String methodName) {
        String dictType = "";
        switch (methodName) {
            case "maintain":
                dictType = DictConstant.SYSTEM_MAIN_TAIN;
                break;
            case "mgSetting":
                dictType = DictConstant.SYSTEM_MG_SERVICE;
                break;
            case "agSetting":
                dictType = DictConstant.SYSTEM_AG_SERVICE;
                break;
            case "lotterySetting":
                dictType = DictConstant.SYSTEM_LOTTERY_SERVICE;
                break;
            case "appSetting":
                dictType = DictConstant.SYSTEM_APP_INSTALLATION;
                break;
        }
        List<DictEntity> list = dictService.getAllType(dictType);
        return ResponseEntity.initGeneralResponseObj("", list);
    }

    /**
     * 获取所有的系统维护的数据
     *
     * @return
     */
    @ResponseBody
    @PostMapping(value = "updateDictValue", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity updateDictValue(@RequestBody List<DictEntity> data) {
        dictService.updateDictObj(data);
        return ResponseEntity.initGeneralResponseMsg("修改成功");
    }

    /**
     * @Description: 参数配置页面跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @RequestMapping("enumPage")
    public String enumPage(Model model, HttpServletRequest request) {
        List<EnumType> types = dictService.fetchAllEnumTypes();
        model.addAttribute("types", types);
        return "system/enum";
    }


    /**
     * @Description: 参数查询
     * @Param: [enumReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "enumList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity enumList(@RequestBody EnumReq enumReq, HttpServletRequest request) throws GeneralException {

        List<DictEntity> dictEntities = dictService.fetchEnums(enumReq);
        Integer recordsTotal = dictService.countEnums(enumReq);
        return ResponseEntity.initGeneralResponseRes(dictEntities, recordsTotal);
    }


    /**
     * @Description: 新增参数
     * @Param: [enumOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "add", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity add(@RequestBody EnumOpeReq enumOpeReq, HttpServletRequest request) throws GeneralException {

        //校验参数是否重复
        if (!dictService.checkEnumExist(enumOpeReq)) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ENUM_REPEAT_ERROR);
        }
        dictService.addEnum(enumOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 修改参数
     * @Param: [enumOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "/update", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity update(@RequestBody EnumOpeReq enumOpeReq, HttpServletRequest request) throws GeneralException {

        //校验参数是否重复
        if (!dictService.checkEnumExist(enumOpeReq)) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ENUM_REPEAT_ERROR);
        }
        dictService.updateEnum(enumOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }


    /**
     * @Description: 删除参数
     * @Param: [baseEntity, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "remove", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity remove(@RequestBody BaseEntity baseEntity, HttpServletRequest request) throws GeneralException {
        if (baseEntity.getId() == null)
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.FIELD_NOT_STANDARD_ERROR);
        dictService.deleteEnum(baseEntity.getId());
        return ResponseEntity.initGeneralSuccessResponse();
    }


    /**
     * @Description: 参数类型页面跳转
     * @Param: [model, request]
     * @return: java.lang.String
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @RequestMapping("enumTypePage")
    public String enumTypePage(Model model, HttpServletRequest request) {
        return "system/enumtype";
    }

    /**
     * @Description: 参数类型查询
     * @Param: [enumReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "enumTypeList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity enumTypeList(@RequestBody EnumReq enumReq, HttpServletRequest request) throws GeneralException {

        List<EnumType> dictEntities = dictService.fetchEnumTypes(enumReq);
        Integer recordsTotal = dictService.countEnumTypes(enumReq);
        return ResponseEntity.initGeneralResponseRes(dictEntities, recordsTotal);
    }

    /**
     * @Description: 新增参数类型
     * @Param: [enumOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "addType", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity addType(@RequestBody EnumOpeReq enumOpeReq, HttpServletRequest request) throws GeneralException {

        //校验参数是否重复
        if (!dictService.checkEnumTypeExist(enumOpeReq, 0)) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ENUM_REPEAT_ERROR);
        }
        dictService.addEnumType(enumOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 修改参数类型
     * @Param: [enumOpeReq, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "/updateType", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity updateType(@RequestBody EnumOpeReq enumOpeReq, HttpServletRequest request) throws GeneralException {

        //校验参数是否重复
        if (!dictService.checkEnumTypeExist(enumOpeReq, 1)) {
            throw GeneralException.initEnumGeneralException(ResponseCodeEnum.ENUM_REPEAT_ERROR);
        }
        dictService.updateEnumType(enumOpeReq);
        return ResponseEntity.initGeneralSuccessResponse();
    }

    /**
     * @Description: 删除参数类型
     * @Param: [baseEntity, request]
     * @return: com.cn.great.model.common.ResponseEntity
     * @Author: Stamp
     * @Date: 2019/5/22
     */
    @PostMapping(value = "removeType", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity removeType(@RequestBody EnumOpeReq enumOpeReq, HttpServletRequest request) throws GeneralException {
        dictService.deleteEnumType(enumOpeReq.getCode());
        return ResponseEntity.initGeneralSuccessResponse();
    }

}
