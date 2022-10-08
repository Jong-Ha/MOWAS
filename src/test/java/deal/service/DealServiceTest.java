package deal.service;

import com.project.common.Page;
import com.project.common.Search;
import com.project.deal.service.DealService;
import com.project.domain.Deal;
import com.project.domain.MasterBoard;
import com.project.domain.User;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml",
        "classpath:config/context-aspect.xml",
        "classpath:config/context-mybatis.xml",
        "classpath:config/context-transaction.xml"})
public class DealServiceTest {
    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;


    @Test
    public void AddDeal()throws Exception{
        Deal deal =new Deal();
        User user=new User();
        deal.setDealBoardNum(10020);
        deal.setBoardCategory(8);
        user.setUserId("user01");
        deal.setUser(user);
       // deal.setUserId("user10");
        deal.setDealTitle("바보");
        deal.setDealText("는");
        deal.setProductName("는");
        deal.setPrice(100);
        deal.setTag("hi");
        deal.setViewCount(1);
        deal.setVillCode("봉천동");


        dealService.addDeal(deal);
      //  Assert.assertEquals("hi",deal.getDealTitle());

    }

    @Test
    public void updateDeal()throws Exception{

        Deal deal =new Deal();
        User user = new User();
        user.setUserId("user20");
        deal.setDealTitle("111");
        deal.setDealStatus(2);
        deal.setDealText("111");
        deal.setProductName("111");
        deal.setPrice(111);
        deal.setTag("111");
        deal.setDealBoardNum(10001);

    dealService.updateDeal(deal);

    }
    @Test
    public void deleteDeal()throws Exception{
        Deal deal = new Deal();
        deal.setDealBoardNum(10009);
        dealService.deleteDeal(deal);
    }
    @Test
    public void testGetListDeal()throws Exception{
        Search search = new Search();
        search.setCurrentPage(1);
        search.setPageSize(5);

        Map<String,Object> map = dealService.getListDeal(search);

        List<Object> list = (List<Object>)map.get("List");

        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        System.out.println(list);

        Integer totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

        System.out.println("=======================================");

        search.setCurrentPage(1);
        search.setPageSize(5);
        search.setSearchCondition("1");
        search.setSearchKeyword("");
        map = dealService.getListDeal(search);

        list = (List<Object>)map.get("list");
        //Assert.assertEquals(3, list.size());

        //==> console Ȯ��
        //System.out.println(list);

        totalCount = (Integer)map.get("totalCount");
        System.out.println(totalCount);

    }










//        Search search =new Search();
//        search.setSearchCondition("0");
//        search.setSearchKeyword("제목4");
//
//        Map<String,Object> map = dealService.getListDeal(search);
//
//        List<Object> list = (List<Object>)map.get("list");
//        Assert.assertEquals(1, list.size());
//        System.out.println(list);
//        Integer totalCount = (Integer)map.get("totalCount");
//        System.out.println(totalCount);
//
//        System.out.println("=======================================");
//
//        search.setSearchCondition("0");
//        search.setSearchKeyword(""+System.currentTimeMillis());
//        map = dealService.getListDeal(search);
//
//        list = (List<Object>)map.get("list");
//        Assert.assertEquals(0, list.size());
//
//        //==> console 확인
//        //System.out.println(list);
//
//        totalCount = (Integer)map.get("totalCount");
//        System.out.println(totalCount);

    @Test
    public void GetDeal() throws Exception{

        int dealBoardNum =10005;
    Deal result = dealService.getDeal(dealBoardNum);
                System.out.println(dealService.getDeal(dealBoardNum)+"1111111111111111111111111111111");
    }



}
