package com.project.user.test;

import com.project.common.Search;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class UserServiceTest {
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Test
    public void testAddUser() throws Exception {

        User user = new User();
        user.setUserId("testId09");
        user.setMasterCheck("1");
        user.setUserStatus("1");
        user.setPassword("test09");
        user.setUserName("차은우");
        user.setRrd("9999999999999");
        user.setGender("남자");
        user.setEmail("test08@test.com");
        user.setPhone("11122223333");
        user.setVillCode("강남8동");
        user.setUserImage("이미지8.jpg");
        //new Date(System.currentTimeMillis());

        user.setPsd("2022-10-07");
        user.setPed("2022-10-07");
        user.setPpt(30);
        user.setReviewPt(77);

        userService.addUser(user);

        user = userService.getUser("testId09");

        //==> console 확인
        //System.out.println(user);

        //==> API 확인
        Assert.assertEquals("testId09", user.getUserId());
        Assert.assertEquals("1", user.getMasterCheck());
        Assert.assertEquals("1", user.getUserStatus());
        Assert.assertEquals("test09", user.getPassword());
        Assert.assertEquals("차은우", user.getUserName());
        Assert.assertEquals("9999999999999", user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test08@test.com", user.getEmail());
        Assert.assertEquals("11122223333", user.getPhone());
        Assert.assertEquals("강남8동", user.getVillCode());
        Assert.assertEquals("이미지8.jpg", user.getUserImage());

        Assert.assertEquals("2022-10-07", user.getPsd());
        Assert.assertEquals("2022-10-07", user.getPed());
        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(77, user.getReviewPt());
    }

    @Test
    public void testGetUser() throws Exception{
        User user = new User();

        user = userService.getUser("testId04");

        Assert.assertEquals("testId04", user.getUserId());
        Assert.assertEquals("1", user.getMasterCheck());
        Assert.assertEquals("3", user.getUserStatus());
        Assert.assertEquals("test04", user.getPassword());
        Assert.assertEquals("이몽룡", user.getUserName());
        Assert.assertEquals("111111111", user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test04@test.com", user.getEmail());
        Assert.assertEquals("1112222", user.getPhone());
        Assert.assertEquals("강남4동", user.getVillCode());
        Assert.assertEquals("이미지.jpg", user.getUserImage());

        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(70, user.getReviewPt());
    }

    @Test
    public void testUpdateUser() throws Exception{
        User user = userService.getUser("testId04");
        Assert.assertNotNull(user);

        Assert.assertEquals("testId04", user.getUserId());
        Assert.assertEquals("1", user.getMasterCheck());
        Assert.assertEquals("3", user.getUserStatus());
        Assert.assertEquals("test04", user.getPassword());
        Assert.assertEquals("이몽룡", user.getUserName());
        Assert.assertEquals("111111111", user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test04@test.com", user.getEmail());
        Assert.assertEquals("1112222", user.getPhone());
        Assert.assertEquals("강남4동", user.getVillCode());
        Assert.assertEquals("이미지.jpg", user.getUserImage());

        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(70, user.getReviewPt());

        user.setPassword("test4444");
        user.setEmail("change@change.com");
        user.setPhone("777888");
        user.setVillCode("체인지동");
        user.setUserImage("change.jpg");

        userService.updateUser(user);

        user=userService.getUser("testId04");
        Assert.assertNotNull(user);

        Assert.assertEquals("testId04", user.getUserId());
        Assert.assertEquals("1", user.getMasterCheck());
        Assert.assertEquals("3", user.getUserStatus());
        Assert.assertEquals("test4444", user.getPassword());
        Assert.assertEquals("이몽룡", user.getUserName());
        Assert.assertEquals("111111111", user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("change@change.com", user.getEmail());
        Assert.assertEquals("777888", user.getPhone());
        Assert.assertEquals("체인지동", user.getVillCode());
        Assert.assertEquals("change.jpg", user.getUserImage());

        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(70, user.getReviewPt());
    }

    @Test
    public void testCheckDupId() throws Exception{
        Assert.assertFalse(userService.checkDupId("testId04"));
        Assert.assertTrue(userService.checkDupId("testId04"+System.currentTimeMillis()));
    }

    @Test
    public void testaddInterList() throws Exception{
        UserInterList userInterList = new UserInterList();


        userInterList.setUserId("testId05");
        userInterList.setInterList("8");

      //  userService.addInterList(userInterList);

    }

    @Test
    public void testListUser() throws Exception{
        //User user = new User();
        userService.listUsers(new Search());


    }


}
