package deal.service;

import com.project.common.Search;
import com.project.deal.service.DealService;
import com.project.domain.Deal;
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
    public void AddDeal(){
        Deal deal =new Deal();
        deal.setDealBoardNum(1000);
        deal.setDealStatus(1);
        deal.setBoardCategory(9);
        deal.setUserId("user01");
        deal.setDealTitle("바보");
        deal.setDealText("는");
        deal.setProductName("는");
        deal.setPrice(100);
        deal.setDealText("hi");
        deal.setViewCount(1);
        deal.setDealModeCheck(0);

        dealService.addDeal(deal);
        Deal result =dealService.getDeal(1000);
      //  Assert.assertEquals("hi",deal.getDealTitle());
    System.out.println(result);
    }

    @Test
    public void updateDeal(){
        Deal deal =new Deal();
        deal.setDealStatus(1);
        deal.setBoardCategory(9);
        deal.setUserId("user01");
        deal.setDealTitle("바보");
        deal.setDealText("는");
        deal.setProductName("는");
        deal.setPrice(100);
        deal.setDealText("hi");

        dealService.addDeal(deal);
        Deal result=dealService.getDeal(10000);
      System.out.println(result);

    }
    @Test
    public void deleteDeal(){
        Deal deal = new Deal();
        deal.setDealBoardNum(10000);
        dealService.deleteDeal(deal);
    }
 //   @Test
//    public void testGetListDeal(){
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
//    }
    @Test
    public void GetDeal()  {
        int result1 =10002;
                Deal result=dealService.getDeal(result1);
                System.out.println(result+"1111111111111111111111111111111");
    }
}
