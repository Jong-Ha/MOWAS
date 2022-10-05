package com.project.user.test;

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
        user.setUserId("testId06");
        user.setMasterCheck("1");
        user.setUserStatus("3");
        user.setPassword("test04");
        user.setUserName("이몽룡");
        user.setRrd(3333);
        user.setGender("남자");
        user.setEmail("test04@test.com");
        user.setPhone(333444455);
        user.setVillCode("강남4동");
        user.setUserImage("이미지.jpg");
        //new Date(System.currentTimeMillis());
        user.setLcd("2022-10-05");
        user.setLoginCheck("1");
        user.setPsd("2022-10-05");
        user.setPed("2022-10-05");
        user.setPpt(30);
        user.setReviewPt(70);

        userService.addUser(user);

        user = userService.getUser("testId06");

        //==> console 확인
        //System.out.println(user);

        //==> API 확인
        Assert.assertEquals("testId06", user.getUserId());
        Assert.assertEquals("1", user.getMasterCheck());
        Assert.assertEquals("3", user.getUserStatus());
        Assert.assertEquals("test04", user.getPassword());
        Assert.assertEquals("이몽룡", user.getUserName());
        Assert.assertEquals(3333, user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test04@test.com", user.getEmail());
        Assert.assertEquals(333444455, user.getPhone());
        Assert.assertEquals("강남4동", user.getVillCode());
        Assert.assertEquals("이미지.jpg", user.getUserImage());
        Assert.assertEquals("2022-10-05", user.getLcd());
        Assert.assertEquals("1", user.getLoginCheck());
        Assert.assertEquals("2022-10-05", user.getPsd());
        Assert.assertEquals("2022-10-05", user.getPed());
        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(70, user.getReviewPt());
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
        Assert.assertEquals(111111111, user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test04@test.com", user.getEmail());
        Assert.assertEquals(1112222, user.getPhone());
        Assert.assertEquals("강남4동", user.getVillCode());
        Assert.assertEquals("이미지.jpg", user.getUserImage());
        Assert.assertEquals("1", user.getLoginCheck());
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
        Assert.assertEquals(111111111, user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("test04@test.com", user.getEmail());
        Assert.assertEquals(1112222, user.getPhone());
        Assert.assertEquals("강남4동", user.getVillCode());
        Assert.assertEquals("이미지.jpg", user.getUserImage());
        Assert.assertEquals("1", user.getLoginCheck());
        Assert.assertEquals(30, user.getPpt());
        Assert.assertEquals(70, user.getReviewPt());

        user.setPassword("test4444");
        user.setEmail("change@change.com");
        user.setPhone(777888);
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
        Assert.assertEquals(111111111, user.getRrd());
        Assert.assertEquals("남자", user.getGender());
        Assert.assertEquals("change@change.com", user.getEmail());
        Assert.assertEquals(777888, user.getPhone());
        Assert.assertEquals("체인지동", user.getVillCode());
        Assert.assertEquals("change.jpg", user.getUserImage());
        Assert.assertEquals("1", user.getLoginCheck());
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

        userService.addInterList(userInterList);

    }



}
