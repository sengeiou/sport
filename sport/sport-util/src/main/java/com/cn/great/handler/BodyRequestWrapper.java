package com.cn.great.handler;


import com.cn.great.util.HttpHelper;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.Charset;


/**
 * @program: sport
 * @description: POST请求参数处理
 * @author: Stamp.M
 * @create: 2019-03-19 21:48
 **/
public class BodyRequestWrapper extends HttpServletRequestWrapper {

    private String json;
    private final byte[] body;

    public BodyRequestWrapper(HttpServletRequest request) throws IOException {
        super(request);
        json = HttpHelper.getBodyString(request);
        body = json.getBytes(Charset.forName("UTF-8"));

    }

    @Override
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream bais = new ByteArrayInputStream(body);

        return new ServletInputStream() {
            @Override
            public int read() throws IOException {
                return bais.read();
            }

            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {
            }
        };
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
