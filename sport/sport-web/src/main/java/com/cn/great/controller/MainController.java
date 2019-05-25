package com.cn.great.controller;

import com.cn.great.exception.GeneralException;
import com.cn.great.model.common.DictConstant;
import com.cn.great.model.common.ResponseEntity;
import com.cn.great.model.system.DictEntity;
import com.cn.great.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * @program: sport
 * @description: 安卓、苹果安装包业务
 * @author: Stamp.M
 * @create: 2019-03-22 22:36
 **/

@RestController
@RequestMapping("/Main")
public class MainController {

    @Autowired
    private DictService dictService;

    @PostMapping("Android")
    public ResponseEntity Android() throws GeneralException {
        List<DictEntity> list = dictService.getAllType(DictConstant.ANDROID);
        HashMap<String, String> map = new HashMap<>();
        for (DictEntity dictEntity : list) {
            switch (dictEntity.getCode()) {
                case DictConstant.ANDROID_URL:
                    map.put("url", dictEntity.getValue());
                    continue;
                case DictConstant.ANDROID_VERSIONS:
                    map.put("versions", dictEntity.getValue());
                    continue;
                case DictConstant.ANDROID_FORCE_UPDATE:
                    map.put("force_update", dictEntity.getValue());
                    continue;
                case DictConstant.ANDROID_UPDATE_CONTENT:
                    map.put("update_content", dictEntity.getValue());
            }
        }
        return ResponseEntity.initGeneralResponseObj("Android 安装包配置", map);
    }


    @PostMapping("Ios")
    public ResponseEntity Ios() throws GeneralException {
        List<DictEntity> list = dictService.getAllType(DictConstant.IOS);
        HashMap<String, String> map = new HashMap<>();
        for (DictEntity dictEntity : list) {
            switch (dictEntity.getCode()) {
                case DictConstant.IOS_URL:
                    map.put("url", dictEntity.getValue());
                    continue;
                case DictConstant.IOS_VERSIONS:
                    map.put("versions", dictEntity.getValue());
                    continue;
                case DictConstant.IOS_FORCE_UPDATE:
                    map.put("force_update", dictEntity.getValue());
                    continue;
                case DictConstant.IOS_UPDATE_CONTENT:
                    map.put("update_content", dictEntity.getValue());
            }
        }
        return ResponseEntity.initGeneralResponseObj("IOS 安装包配置", map);
    }
}
