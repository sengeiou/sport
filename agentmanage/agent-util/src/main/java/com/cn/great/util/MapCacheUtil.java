package com.cn.great.util;

import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @program: sport
 * @description: Map缓存类
 * @author: Stamp
 * @create: 2019-03-19 11:59
 **/
public class MapCacheUtil {

    /**
     * 线程池对象
     **/
    private static ExecutorService exec = Executors.newCachedThreadPool();

    /**
     * 保存查询结果集的Map(带时效性)
     **/
    private static final HashMap<Integer, Object> cacheMap = new HashMap<>();

    /**
     * 保存查询结果集的Map
     **/
    private static HashMap<String, Object> objChcheMaps;

    /**
     * 当前结果集的标识ID
     **/
    private static int id = 1;

    /**
     * @Description: 设置Map缓存
     * @Param: [cache, cacheObj]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/3/19
     */
    public static void setCacheMaps(String cache, Object cacheObj) {
        if (CollectionUtils.isEmpty(objChcheMaps)) {
            objChcheMaps = new HashMap<>();
        }
        objChcheMaps.put(cache, cacheObj);
    }


    /**
     * @Description: 获取对象缓存
     * @Param: [cache]
     * @return: java.lang.Object
     * @Author: Stamp
     * @Date: 2019/3/19
     */
    public static Object getCacheObject(String cache) {
        return objChcheMaps.get(cache);
    }

    /**
     * 设置要缓存的对象
     *
     * @param <T>
     * @param Object 缓存对象
     * @return 标识ID
     */
    public static synchronized <T> int setCacheObject(T Object) {
        return setCacheObject(Object, 1000);
    }

    /**
     * 设置要缓存的对象
     *
     * @param <T>
     * @param object     缓存对象
     * @param timeToLive 对象生存期(以毫秒数为单位)
     * @return 标识ID
     */
    public static synchronized <T> int setCacheObject(T object, final long timeToLive) {

        if (Integer.MAX_VALUE <= id) {
            id = 1;
        }
        cacheMap.put(id, object);
        id++;
        exec.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(timeToLive);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                cacheMap.remove(id - 1);
            }
        });

        return id - 1;
    }

    /**
     * 获取特定缓存对象
     *
     * @param <T>
     * @param i   标识ID
     * @return
     */
    @SuppressWarnings("unchecked")
    public static <T> T getCacheObject(int i) {
        return (T) cacheMap.get(i);
    }

}
