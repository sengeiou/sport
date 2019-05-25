package com.cn.great.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: sport
 * @description: Get请求处理
 * @author: Stamp
 * @create: 2019-03-31 08:52
 **/
public class GetRequestWrapper extends HttpServletRequestWrapper {
    private Map<String, String[]> params = new HashMap<String, String[]>();

    @SuppressWarnings("unchecked")
    public GetRequestWrapper(HttpServletRequest request) {
        super(request);
        this.params.putAll(request.getParameterMap());
    }


    public GetRequestWrapper(HttpServletRequest request, Map<String, Object> extendParams) {
        this(request);
        addAllParameters(extendParams);
    }

    @Override
    public String getParameter(String name) {
        String[] values = params.get(name);
        if (values == null || values.length == 0) {
            return null;
        }
        return values[0];
    }


    public String[] getParameterValues(String name) {
        return params.get(name);
    }

    public void addAllParameters(Map<String, Object> otherParams) {
        for (Map.Entry<String, Object> entry : otherParams.entrySet()) {
            addParameter(entry.getKey(), entry.getValue());
        }
    }

    public void addParameter(String name, Object value) {
        if (value != null) {
            if (value instanceof String[]) {
                params.put(name, (String[]) value);
            } else if (value instanceof String) {
                params.put(name, new String[]{(String) value});
            } else {
                params.put(name, new String[]{String.valueOf(value)});
            }
        }
    }

}
