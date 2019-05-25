package tk.mybatis.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;
import tk.mybatis.springboot.model.User;

import java.util.Date;
import java.util.List;

/**
 * @program: xxl-job-sport
 * @description: mongodb测试
 * @author: Stamp
 * @create: 2019-04-15 14:36
 **/
@Component
public class MongoTest {

    @Autowired
    private MongoTemplate mongoTemplate;

    /**表名*/
    private static final String collectionName = "user";

    public String execute(String param) throws Exception {
        //insert
        User user = buildUser();
        this.mongoTemplate.insert(user);

        //query
        Query query1 = Query.query(Criteria.where("dataStatus").is(1));
        List<User> users = this.mongoTemplate.find(query1, User.class);

        //update
        Query queryUpdate = Query.query(Criteria.where("userId").is(user.getUserId()));
        Update update = new Update();
        update.set("age", 20);
        update.set("name", "zhangshan");
        update.set("email", "10235566@qq.com");
        this.mongoTemplate.updateFirst(queryUpdate, update, collectionName);

        //query
        Query query2 = Query.query(Criteria.where("userId").is("1"));
        List<User> user2 = this.mongoTemplate.find(query2, User.class);

        //delete
        Query queryDel = Query.query(Criteria.where("userId").is(user.getUserId()));
        this.mongoTemplate.remove(queryDel, collectionName);

        //query
        Query query3 = Query.query(Criteria.where("userId").is("1"));
        List<User> users3 = this.mongoTemplate.find(query3, User.class);

        return "";
    }


    private User buildUser(){
        User user = new User();
        user.setUserId("1");
        user.setAge(18);
        user.setBirthday(new Date());
        user.setDataStatus(1);
        user.setEmail("***@163.com");
        user.setName("test");
        user.setUclass("user");
        return user;
    }
}
