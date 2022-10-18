package com.project.myPage.service;

import com.project.domain.ClubMasterBoard;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.domain.VilBoard;
import com.project.myPage.dao.MyPageDao;
import com.project.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service ("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    @Qualifier("myPageDaoImpl")
    private MyPageDao myPageDao;
    public void setMyPageDao(MyPageDao myPageDao){
        this.myPageDao = myPageDao;
    }
    public MyPageServiceImpl() {
        System.out.println(this.getClass());
    }

    public User getMyPage(String userId)throws Exception{
        return myPageDao.getMyPage(userId);
    }

    public Map<String, Object> getMyInfor(String userId)throws Exception{

        Map<String, Object> map = new HashMap<String, Object>();
        User user = myPageDao.getMyInfor(userId);
        List<UserInterList> interList =myPageDao.getMyInforInterList(userId);

        map.put("user", user);
        map.put("interList", interList);
        return map;
    }

    public Map<String, Object> getMyBoard(String userId)throws Exception{

        Map<String, Object> map = new HashMap<String, Object>();
        List<VilBoard> villBoard = myPageDao.getMyVillBoard(userId);
        List<ClubMasterBoard> clubBoard = myPageDao.getMyClubBoard(userId);

        System.out.println("villBoard 값??"+villBoard);
        System.out.println("clubBoard 값??"+clubBoard);

        map.put("myVillBoard", villBoard);
        map.put("myclubBoard", clubBoard);
        return map;
    }


}
