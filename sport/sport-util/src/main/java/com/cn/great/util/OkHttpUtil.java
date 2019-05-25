package com.cn.great.util;

import lombok.extern.slf4j.Slf4j;
import okhttp3.*;

import java.io.IOException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

@Slf4j
public class OkHttpUtil {

    private static OkHttpClient okHttpClient;

    private static OkHttpClient getOkHttpClient() {

        if (okHttpClient == null) {
            if (okHttpClient == null) {
                okHttpClient = new OkHttpClient.Builder()
                        .connectTimeout(15, TimeUnit.SECONDS)
                        .build();
            }
        }
        return okHttpClient;
    }

    public static String sendGet(String url, String param) {
        OkHttpClient client = getOkHttpClient();
        String urlName = url + "?" + param;
        try {
            URL realUrl = new URL(urlName);
            final Request request = new Request.Builder()
                    .url(realUrl)
                    .build();
            Response response = client.newCall(request).execute();
            return response.body().string();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String sendPost(String url, String param) {
        OkHttpClient client = getOkHttpClient();
        MediaType media = MediaType.parse("application/json; charset=utf-8");
        RequestBody requestBody = RequestBody.create(media, param);
        final Request request = new Request.Builder()
                .url(url)
                .post(requestBody)
                .build();
        try {
            Response response = client.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
