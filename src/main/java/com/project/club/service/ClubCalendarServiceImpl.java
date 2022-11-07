package com.project.club.service;

import com.project.club.dao.ClubCalendarDao;
import com.project.club.dao.ClubDao;
import com.project.common.Search;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.Cluber;
import com.project.domain.Deal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("clubCalenderServiceImpl")
public class ClubCalendarServiceImpl implements ClubCalendarService {

    @Autowired
    @Qualifier("clubCalenderDaoImpl")
    private ClubCalendarDao clubCalendarDao;

    @Autowired
    @Qualifier("clubDaoImpl")
    private ClubDao clubDao;

    @Override
    public void addCalender(ClubCalendar calender) {
        clubCalendarDao.addCalender(calender);
    }

    @Override
    public ClubCalendar getCalender(int clubCalenderNum) {

        ClubCalendar clubCalender = clubCalendarDao.getCalender(clubCalenderNum);


        clubCalender.setFile(clubCalendarDao.getListFile(clubCalender.getClubCalenderNum(),5));

        return clubCalender;
    }

    @Override
    public void addCalenderReview(ClubCalendarReview calenderReview) {
        clubCalendarDao.addCalenderReview(calenderReview);
    }
    @Override
    public void updateCalenderReview(ClubCalendarReview calenderReview) {
        clubCalendarDao.updateCalenderReview(calenderReview);
    }


    @Override
    public void deleteCalenderReview(int calenderNum) {
        clubCalendarDao.deleteCalenderReview(calenderNum);
    }

    @Override
    public Map<String, Object> listCalenderReview(int boardCategory,Search search, int reviewRange) {

        Map<String, Object> map2 = new HashMap<>();

        map2.put("boardCategory", boardCategory);
        map2.put("search", search);
        map2.put("reviewRange", reviewRange);

        System.out.println("========================="+ map2.get("search"));

        List<ClubCalendarReview> list =  clubCalendarDao.listCalenderReview(map2);

        Map<String, Object> map = new HashMap<String, Object>();;


        //파일 리스트 가져오기
        int i = 0;
        for (ClubCalendarReview calenderReview : list){

            calenderReview.setFile(clubCalendarDao.getListFile(list.get(i).getClubCalenderReviewNum(),
                    list.get(i).getBoardCategory()));

            System.out.println("/n 캘린더 넘버의 정보 " + list.get(i).getClubCalenderReviewNum());
            i += 1;
        }

        map.put("list", list);

        return map;
    }

    @Override
    public ClubCalendarReview getCalenderReview(int clubCalenderReviewNum) {

        ClubCalendarReview clubCalendarReview = clubCalendarDao.getCalenderReview(clubCalenderReviewNum);

        clubCalendarReview.setFile(clubCalendarDao.getListFile(clubCalendarReview.getClubCalenderReviewNum(),
                                                                 clubCalendarReview.getBoardCategory()));

        return clubCalendarReview;
    }

    @Override
    public List<Map<String, Object>> getListCalender(ClubCalendar calender) {

        List<ClubCalendar> list = clubCalendarDao.getListCalender(calender);


        Map<String,Object> map = null;

        List<Map<String, Object>> list2 = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            map = new HashMap<>();

            map.put("id", list.get(i).getClubCalenderNum());
            map.put("start", list.get(i).getClubDate());
            map.put("title", list.get(i).getCalenderTitle());
            map.put("allDay", "ture");
            map.put("groupId", "1");

            list2.add(map);
        }
        System.out.println("map 덮어 쓰기 " + map);
        return list2;
    }


    @Override
    public void deleteFile(int boardNum) {
        clubCalendarDao.deleteFile(boardNum);
    }

    @Override
    public void updateClubCalender(ClubCalendar clubCalendar) {
        clubCalendarDao.updateClubCalender(clubCalendar);
    }

    @Override
    public void deleteClubCalender(int boardNum) {


        clubDao.deleteClubCluber(boardNum);
        clubCalendarDao.deleteFile(boardNum);
        clubCalendarDao.deleteClubCalender(boardNum);

    }

    @Override
    public void dealUpdateCalender(Deal deal) {
        clubCalendarDao.dealUpdateCalender(deal);
    }

    @Override
    public void addFileUpload(Map<String, String> map) {
        clubCalendarDao.addFileUpload(map);
    }

    @Override
    public void addDealCalender(Deal deal) {
        clubCalendarDao.addDealCalender(deal);
    }

    @Override
    public List<Map<String, Object>> getListCluberCalender(int CalenderNum) {
        List<ClubCalendar> list = clubCalendarDao.getListCluberCalender(CalenderNum);


        List<Map<String, Object>> list2 = new ArrayList<>();
        Map<String,Object> map = null;
        for (int i = 0; i < list.size(); i++) {
            map = new HashMap<>();

            map.put("id", list.get(i).getClubCalenderNum());
            map.put("start", list.get(i).getClubDate());
            map.put("title", list.get(i).getCalenderTitle());
            map.put("allDay", "ture");
            map.put("groupId", "1");

            list2.add(map);
        }

        return list2;
    }


    @Override
    public Map<String ,Object> listClubCalendarReview(Search search, int clubNum, int boardCategory) {
        Map<String ,Object> map = new HashMap<>();
        map.put("search",search);
        map.put("clubNum",clubNum);
        map.put("boardCategory",boardCategory);
        int totalCount = clubCalendarDao.getTotalClubCalendarReview(map);
        List<ClubCalendarReview> list = clubCalendarDao.listClubCalendarReview(map);
        for (ClubCalendarReview calenderReview : list){
            calenderReview.setFile(clubCalendarDao.getListFile(calenderReview.getClubCalenderReviewNum(),
                    calenderReview.getBoardCategory()));
        }
        map.put("list",list);
        map.put("totalCount",totalCount);
        return map;
    }
}
