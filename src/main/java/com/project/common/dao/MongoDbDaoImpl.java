package com.project.common.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository("mongoDbDaoImpl")
public class MongoDbDaoImpl implements MongoDbDao{

    @Autowired
    @Qualifier(value = "mongoTemplate")
    private MongoTemplate mongoTemplate;

    public MongoDbDaoImpl() {
    }

    @Override
    public void addClub(int clubNum, String clubName, String userId) {
        Map<String, Object> room = new HashMap<>();
        List<Map<String, Object>> users = new ArrayList<>();
        Map<String, Object> user = new HashMap<>();
        user.put("userId",userId);
        user.put("regDate",String.valueOf(new Date().getTime()));
        users.add(user);
        room.put("users",users);
        room.put("roomId", UUID.randomUUID().toString());
        room.put("chatCategory","clubChat");
        room.put("roomName",clubName);
        room.put("boardNum",clubNum);
        System.out.println(room);

        mongoTemplate.insert(room,"rooms");
    }

    @Override
    public void addCluber(int clubNum, String userId) {
        Query query = new Query(new Criteria().andOperator(
                Criteria.where("chatCategory").is("clubChat"),
                Criteria.where("boardNum").is(clubNum)
        ));

//        System.out.println(mongoTemplate.find(query, Map.class, "rooms"));

        Map<String, Object> map = mongoTemplate.find(query, Map.class, "rooms").get(0);
//        System.out.println(map);

        Map<String, Object> user = new HashMap<>();
        user.put("userId",userId);
        user.put("regDate",String.valueOf(new Date().getTime()));

        List<Map<String, Object>> users = (List<Map<String, Object>>) map.get("users");
        users.add(user);
        map.put("users",users);

        mongoTemplate.save(map, "rooms");
    }

    @Override
    public void deleteCluber(int clubNum, String userId) {
        Query query = new Query(new Criteria().andOperator(
                Criteria.where("chatCategory").is("clubChat"),
                Criteria.where("boardNum").is(clubNum)
        ));
        Map<String, Object> map = mongoTemplate.find(query, Map.class, "rooms").get(0);
//        System.out.println(map);
        List<Map<String, Object>> users = (List<Map<String, Object>>) map.get("users");
//        System.out.println(users);
        for (int i = 0; i < users.size(); i++) {
            Map<String, Object> user = users.get(i);
//            System.out.println(user);
//            System.out.println(user.get("userId") + " : " + user.get("userId").equals(userId));
            if (user.get("userId").equals(userId)) {
//                System.out.println(i);
                users.remove(i);
                break;
            }
        }
//        System.out.println(users);
        map.put("users",users);
//        System.out.println(map);
        mongoTemplate.save(map, "rooms");
    }

    @Override
    public void deleteClub(int clubNum) {
        Query query = new Query(new Criteria().andOperator(
                Criteria.where("chatCategory").is("clubChat"),
                Criteria.where("boardNum").is(clubNum)
        ));
        mongoTemplate.remove(query,"rooms");
    }
}
