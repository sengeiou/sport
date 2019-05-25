package com.cn.great.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @program: agentmanage
 * @description: Redis工具类
 * @author: Stamp
 * @create: 2019-04-20 08:49
 **/
@Slf4j
@Component
public class RedisUtil {

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    //=============================common============================

    /**
     * 指定缓存失效时间
     *
     * @param key  键
     * @param time 时间(秒)
     * @return
     */
    public boolean expire(Object key, long time) {
        try {
            if (time > 0) {
                redisTemplate.expire(key, time, TimeUnit.SECONDS);
            }
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 根据key 获取过期时间
     *
     * @param key 键 不能为null
     * @return 时间(秒) 返回0代表为永久有效
     */
    public long getExpire(Object key) {
        long expired = 0;
        try {
            expired = redisTemplate.getExpire(key, TimeUnit.SECONDS);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return expired;
    }

    /**
     * 判断key是否存在
     *
     * @param key 键
     * @return true 存在 false不存在
     */
    public boolean hasKey(Object key) {
        try {
            return redisTemplate.hasKey(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * @Description: 删除缓存
     * @Param: [key]
     * @return: void
     * @Author: Stamp
     * @Date: 2019/4/20
     */
    public void delObj(Object key) {
        try {
            redisTemplate.delete(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
    }

    /**
     * 删除缓存
     *
     * @param key 可以传一个值 或多个
     */
    @SuppressWarnings("unchecked")
    public void del(String... key) {
        try {
            if (key != null && key.length > 0) {
                if (key.length == 1) {
                    redisTemplate.delete(key[0]);
                } else {
                    redisTemplate.delete(CollectionUtils.arrayToList(key));
                }
            }
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
    }

    /**
     * 批量删除<br>
     * （该操作会执行模糊查询，请尽量不要使用，以免影响性能或误删）
     *
     * @param pattern
     */
    public void batchDel(String... pattern) {

        try {
            for (String kp : pattern) {
                redisTemplate.delete(redisTemplate.keys(kp + "*"));
            }
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
    }

    //============================String=============================

    /**
     * 普通缓存获取
     *
     * @param key 键
     * @return 值
     */
    public Object get(Object key) {

        Object obj = null;
        try {
            obj = key == null ? null : redisTemplate.opsForValue().get(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return obj;
    }

    /**
     * 取得缓存（int型）
     *
     * @param key
     * @return
     */
    public Integer getInt(String key) {

        String value = "";
        try {
            value = stringRedisTemplate.boundValueOps(key).get();
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        if (!StringUtils.isEmpty(value)) {
            return Integer.valueOf(value);
        }
        return null;
    }

    /**
     * 取得缓存（字符串类型）
     *
     * @param key
     * @return
     */
    public String getStr(String key) {

        String value = "";
        try {
            value = stringRedisTemplate.boundValueOps(key).get();
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return value;
    }

    /**
     * 取得缓存（字符串类型）
     *
     * @param key
     * @return
     */
    public String getStr(String key, boolean retain) {

        String value = "";
        try {
            value = stringRedisTemplate.boundValueOps(key).get();
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        if (!retain) {
            redisTemplate.delete(key);
        }
        return value;
    }

    /**
     * 获取缓存<br>
     * 注：基本数据类型(Character除外)，请直接使用get(String key, Class<T> clazz)取值
     *
     * @param key
     * @return
     */
    public Object getObj(Object key) {

        Object obj = null;
        try {
            obj = redisTemplate.boundValueOps(key).get();
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return obj;
    }

    /**
     * 获取缓存<br>
     * 注：java 8种基本类型的数据请直接使用get(String key, Class<T> clazz)取值
     *
     * @param key
     * @param retain 是否保留
     * @return
     */
    public Object getObj(Object key, boolean retain) {

        Object obj = null;
        try {
            obj = redisTemplate.boundValueOps(key).get();
            if (!retain) {
                redisTemplate.delete(key);
            }
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return obj;
    }

    /**
     * 获取缓存<br>
     * 注：该方法暂不支持Character数据类型
     *
     * @param key   key
     * @param clazz 类型
     * @return
     */
    @SuppressWarnings("unchecked")
    public <T> T get(Object key, Class<T> clazz) {

        try {
            return (T) redisTemplate.boundValueOps(key).get();
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return null;
        }
    }


    /**
     * 普通缓存放入
     *
     * @param key   键
     * @param value 值
     * @return true成功 false失败
     */
    public boolean set(Object key, Object value) {

        try {
            redisTemplate.opsForValue().set(key, value);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 将value对象写入缓存
     *
     * @param key
     * @param value
     * @param time  失效时间(秒)
     */
    public void push(String key, Object value, long time) {

        try {
            if (value.getClass().equals(String.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Integer.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Double.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Float.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Short.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Long.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else if (value.getClass().equals(Boolean.class)) {
                stringRedisTemplate.opsForValue().set(key, value.toString());
            } else {
                redisTemplate.opsForValue().set(key, value);
            }
            if (time > 0) {
                redisTemplate.expire(key, time, TimeUnit.SECONDS);
            }
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }

    }

    /**
     * 普通缓存放入并设置时间
     *
     * @param key   键
     * @param value 值
     * @param time  时间(秒) time要大于0 如果time小于等于0 将设置无限期
     * @return true成功 false 失败
     */
    public boolean set(Object key, Object value, long time) {
        try {
            if (time > 0) {
                redisTemplate.opsForValue().set(key, value, time, TimeUnit.SECONDS);
            } else {
                set(key, value);
            }
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 递增
     *
     * @param key 键
     * @param by  要增加几(大于0)
     * @return
     */
    public long incr(Object key, long delta) {
        if (delta < 0) {
            throw new RuntimeException("递增因子必须大于0");
        }
        long res = 0;
        try {
            res = redisTemplate.opsForValue().increment(key, delta);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return res;
    }

    /**
     * 递减
     *
     * @param key 键
     * @param by  要减少几(小于0)
     * @return
     */
    public long decr(Object key, long delta) {
        if (delta < 0) {
            throw new RuntimeException("递减因子必须大于0");
        }
        long res = 0;
        try {
            res = redisTemplate.opsForValue().increment(key, -delta);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return res;
    }

    //================================Map=================================

    /**
     * HashGet
     *
     * @param key  键 不能为null
     * @param item 项 不能为null
     * @return 值
     */
    public Object hget(Object key, String item) {

        Object obj = null;
        try {
            obj = redisTemplate.opsForHash().get(key, item);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
        return obj;
    }

    /**
     * 获取hashKey对应的所有键值
     *
     * @param key 键
     * @return 对应的多个键值
     */
    public Map<Object, Object> hmget(Object key) {

        try {
            return redisTemplate.opsForHash().entries(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return null;
        }
    }

    /**
     * HashSet
     *
     * @param key 键
     * @param map 对应多个键值
     * @return true 成功 false 失败
     */
    public boolean hmset(Object key, Map<String, Object> map) {
        try {
            redisTemplate.opsForHash().putAll(key, map);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * HashSet 并设置时间
     *
     * @param key  键
     * @param map  对应多个键值
     * @param time 时间(秒)
     * @return true成功 false失败
     */
    public boolean hmset(Object key, Map<String, Object> map, long time) {
        try {
            redisTemplate.opsForHash().putAll(key, map);
            if (time > 0) {
                expire(key, time);
            }
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 向一张hash表中放入数据,如果不存在将创建
     *
     * @param key   键
     * @param item  项
     * @param value 值
     * @return true 成功 false失败
     */
    public boolean hset(Object key, String item, Object value) {
        try {
            redisTemplate.opsForHash().put(key, item, value);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 向一张hash表中放入数据,如果不存在将创建
     *
     * @param key   键
     * @param item  项
     * @param value 值
     * @param time  时间(秒)  注意:如果已存在的hash表有时间,这里将会替换原有的时间
     * @return true 成功 false失败
     */
    public boolean hset(Object key, String item, Object value, long time) {
        try {
            redisTemplate.opsForHash().put(key, item, value);
            if (time > 0) {
                expire(key, time);
            }
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 删除hash表中的值
     *
     * @param key  键 不能为null
     * @param item 项 可以使多个 不能为null
     */
    public void hdel(Object key, Object... item) {

        try {
            redisTemplate.opsForHash().delete(key, item);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
        }
    }

    /**
     * 判断hash表中是否有该项的值
     *
     * @param key  键 不能为null
     * @param item 项 不能为null
     * @return true 存在 false不存在
     */
    public boolean hHasKey(Object key, String item) {

        try {
            return redisTemplate.opsForHash().hasKey(key, item);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * hash递增 如果不存在,就会创建一个 并把新增后的值返回
     *
     * @param key  键
     * @param item 项
     * @param by   要增加几(大于0)
     * @return
     */
    public double hincr(Object key, String item, double by) {

        try {
            return redisTemplate.opsForHash().increment(key, item, by);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0.00;
        }
    }

    /**
     * hash递减
     *
     * @param key  键
     * @param item 项
     * @param by   要减少记(小于0)
     * @return
     */
    public double hdecr(Object key, String item, double by) {

        try {
            return redisTemplate.opsForHash().increment(key, item, -by);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0.00;
        }
    }

    //============================set=============================

    /**
     * 根据key获取Set中的所有值
     *
     * @param key 键
     * @return
     */
    public Set<Object> sGet(Object key) {
        try {
            return redisTemplate.opsForSet().members(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return null;
        }
    }

    /**
     * 根据value从一个set中查询,是否存在
     *
     * @param key   键
     * @param value 值
     * @return true 存在 false不存在
     */
    public boolean sHasKey(Object key, Object value) {
        try {
            return redisTemplate.opsForSet().isMember(key, value);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 将数据放入set缓存
     *
     * @param key    键
     * @param values 值 可以是多个
     * @return 成功个数
     */
    public long sSet(Object key, Object... values) {
        try {
            return redisTemplate.opsForSet().add(key, values);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }

    /**
     * 将set数据放入缓存
     *
     * @param key    键
     * @param time   时间(秒)
     * @param values 值 可以是多个
     * @return 成功个数
     */
    public long sSetAndTime(Object key, long time, Object... values) {
        try {
            Long count = redisTemplate.opsForSet().add(key, values);
            if (time > 0) expire(key, time);
            return count;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }

    /**
     * 获取set缓存的长度
     *
     * @param key 键
     * @return
     */
    public long sGetSetSize(Object key) {
        try {
            return redisTemplate.opsForSet().size(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }

    /**
     * 移除值为value的
     *
     * @param key    键
     * @param values 值 可以是多个
     * @return 移除的个数
     */
    public long setRemove(Object key, Object... values) {
        try {
            Long count = redisTemplate.opsForSet().remove(key, values);
            return count;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }
    //===============================list=================================

    /**
     * 获取list缓存的内容
     *
     * @param key   键
     * @param start 开始
     * @param end   结束  0 到 -1代表所有值
     * @return
     */
    public List<Object> lGet(Object key, long start, long end) {
        try {
            return redisTemplate.opsForList().range(key, start, end);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return null;
        }
    }

    /**
     * 获取list缓存的长度
     *
     * @param key 键
     * @return
     */
    public long lGetListSize(Object key) {
        try {
            return redisTemplate.opsForList().size(key);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }

    /**
     * 通过索引 获取list中的值
     *
     * @param key   键
     * @param index 索引  index>=0时， 0 表头，1 第二个元素，依次类推；index<0时，-1，表尾，-2倒数第二个元素，依次类推
     * @return
     */
    public Object lGetIndex(Object key, long index) {
        try {
            return redisTemplate.opsForList().index(key, index);
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return null;
        }
    }

    /**
     * 将list放入缓存
     *
     * @param key   键
     * @param value 值
     * @param time  时间(秒)
     * @return
     */
    public boolean lSet(Object key, Object value) {
        try {
            redisTemplate.opsForList().rightPush(key, value);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 将list放入缓存
     *
     * @param key   键
     * @param value 值
     * @param time  时间(秒)
     * @return
     */
    public boolean lSet(Object key, Object value, long time) {
        try {
            redisTemplate.opsForList().rightPush(key, value);
            if (time > 0) expire(key, time);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 将list放入缓存
     *
     * @param key   键
     * @param value 值
     * @param time  时间(秒)
     * @return
     */
    public boolean lSet(Object key, List<Object> value) {
        try {
            redisTemplate.opsForList().rightPushAll(key, value);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 将list放入缓存
     *
     * @param key   键
     * @param value 值
     * @param time  时间(秒)
     * @return
     */
    public boolean lSet(Object key, List<Object> value, long time) {
        try {
            redisTemplate.opsForList().rightPushAll(key, value);
            if (time > 0) expire(key, time);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 根据索引修改list中的某条数据
     *
     * @param key   键
     * @param index 索引
     * @param value 值
     * @return
     */
    public boolean lUpdateIndex(Object key, long index, Object value) {
        try {
            redisTemplate.opsForList().set(key, index, value);
            return true;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return false;
        }
    }

    /**
     * 移除N个值为value
     *
     * @param key   键
     * @param count 移除多少个
     * @param value 值
     * @return 移除的个数
     */
    public long lRemove(Object key, long count, Object value) {
        try {
            Long remove = redisTemplate.opsForList().remove(key, count, value);
            return remove;
        } catch (Exception e) {
            log.error("redis 异常...... {}", e.getMessage());
            return 0;
        }
    }
}
