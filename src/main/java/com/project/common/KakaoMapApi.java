package com.project.common;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

public class KakaoMapApi {
    private String latitude;
    private String longitude;
    private String kakaoVillCode;

    public KakaoMapApi() {
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getKakaoVillCode() {
        return kakaoVillCode;
    }

    public void setKakaoVillCode(String kakaoVillCode) {
        this.kakaoVillCode = kakaoVillCode;
    }

    private static String getJSONData(String apiUrl) throws Exception {
        HttpURLConnection conn = null;
        StringBuffer response = new StringBuffer();

        //Kakao REST API Key값 입력
        String auth = "KakaoAK " + "b6ebc978fd15666147bd090e0e7ae4c5";

        //URL 占쏙옙占쏙옙
        URL url = new URL(apiUrl);

        conn = (HttpURLConnection) url.openConnection();

        //Request
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", auth);

        //request占쏙옙 JSON data 占쌔븝옙
        conn.setDoOutput(true);

        //占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쌨깍옙
        int responseCode = conn.getResponseCode();
        if (responseCode == 400) {
            System.out.println("+++++++ 400 : 명령을 실행할 수 없음");
        } else if (responseCode == 401) {
            System.out.println("401:: Authorization이 잘못됨 ");
        } else if (responseCode == 500) {
            System.out.println("500:: 서버 에러, 문의 필요");
        } else { // 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙 JSON 占쏙옙占쏙옙占싶받깍옙

            Charset charset = Charset.forName("UTF-8");
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));

            String inputLine;
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
        }

        return response.toString();
    }

    private static String getRegionAddress(String jsonString, int fromIndex) {
        String value = "";
        //System.out.println(jsonString);
        JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
        JSONObject meta = (JSONObject) jObj.get("meta");
        long size = (long) meta.get("total_count");

        if(size>0){
            JSONArray jArray = (JSONArray) jObj.get("documents");
            JSONObject subJobj = (JSONObject) jArray.get(0);
            JSONObject roadAddress =  (JSONObject) subJobj.get("road_address");

            if(roadAddress == null){
                JSONObject subsubJobj = (JSONObject) subJobj.get("address");

                if(fromIndex == 1) {
                    value = (String) subsubJobj.get("region_3depth_name");
                } else if(fromIndex == 2) {
                    value = (String) subsubJobj.get("address_name");
                }

            }else{
                if(fromIndex == 1) {
                    value = (String) roadAddress.get("region_3depth_name");
                } else if(fromIndex == 2) {
                    value = (String) roadAddress.get("address_name");
                }

            }

            if (value.equals("") || value == null) {
                    //subJobj = (JSONObject) jArray.get(1);
                subJobj = (JSONObject) subJobj.get("address");
                if(fromIndex == 1) {
                    value = (String) subJobj.get("region_3depth_name");
                }else if(fromIndex == 2) {
                    value =(String) subJobj.get("address_name");
                }
            }
        }
        return value;
    }

    //좌표를 주소로 변환 Method
    public static String coordToAddress(String longitude, String latitude, int fromIndex) {
        String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longitude+"&y="+latitude;
        String addr = "";
        try{
           addr = getRegionAddress(getJSONData(url), fromIndex);
        }catch(Exception e){
           e.printStackTrace();
        }
        System.out.println("+++++++++++++++++ 변환된 주소값 ++++++++++++++++" +addr);
        return addr;
    }

    //좌표값으로 행정구역 정보 받기 region_type이 B-법정동, H-행정동
    private static String getRegionCode(String jsonString) {
        String value = "";
        //System.out.println(jsonString);
        JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
        JSONObject meta = (JSONObject) jObj.get("meta");
        long size = (long) meta.get("total_count");
        JSONArray jArray = (JSONArray) jObj.get("documents");

        if(size  == 1){
            JSONObject subJobj = (JSONObject) jArray.get(0);
            String regionBType =  (String) subJobj.get("region_type");

            if(regionBType.equals("B")) {
              value = (String) subJobj.get("region_3depth_name");
            }
        }else if(size == 2) {
            JSONObject subJobj = (JSONObject) jArray.get(1);
            //System.out.println(subJobj);
            String regionHType =  (String) subJobj.get("region_type");
            //System.out.println(regionHType);
            if(regionHType.equals("H")) {
              value = (String) subJobj.get("region_3depth_name");
            }
        }
        return value;
    }

    public static String coordToRegioncode(String longitude, String latitude) {
        String url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+longitude+"&y="+latitude;
        String addr = "";
        try{
            addr = getRegionCode(getJSONData(url));
        }catch(Exception e){
            e.printStackTrace();
        }
        //System.out.println("+++++++++++++++++ 변환된 주소값 ++++++++++++++++" +addr);
        return addr;
    }

    //주소를 좌표로 변화 Method
    public static Map<String, String> getJsonAddress(String address) throws Exception {

        address = URLEncoder.encode(address,"UTF-8");

        String url = "https://dapi.kakao.com/v2/local/search/address.json?query="+ address;

        String jsonString = new String();

        String buf;

        URL Url = new URL(url);

        HttpsURLConnection conn = (HttpsURLConnection) Url.openConnection();
        String auth ="KakaoAK " +"b6ebc978fd15666147bd090e0e7ae4c5";
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", auth);

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        while((buf = br.readLine()) != null) {
            jsonString += buf;
        }
        JSONParser paser = new JSONParser();

        JSONObject jObj = (JSONObject)paser.parse(jsonString);
        JSONObject meta = (JSONObject) jObj.get("meta");

        JSONArray data = (JSONArray) jObj.get("documents");
        long size = (long) meta.get("total_count");

        Map<String, String> mapInfo = new HashMap<String, String>();

        if(size > 0) {
            JSONObject jsonX = (JSONObject)data.get(0);

            mapInfo.put("longitude", jsonX.get("y").toString()) ;
            mapInfo.put("latitude", jsonX.get("x").toString());

            //System.out.println(jsonX.get("x").toString());
            //System.out.println(jsonX.get("y").toString());
        }
        System.out.println(mapInfo);
        return mapInfo;
    }
}

/*
    //좌표를 RequestParam으로 받아서 RestController에서 Call한 예제
    @RequestMapping( value="json/myLocation" , method=RequestMethod.GET)
	public String myLocation(@RequestParam String longitude, @RequestParam String latitude)  throws Exception {

		String vilCode = "";
		vilCode = coordToAddress(longitude, latitude);
		System.out.println("++++++++my location : ++++++++++" +vilCode);
		return vilCode;
	}

    //주소를 RequestParam으로 받아서 RestController에서 Call한 예제
	@RequestMapping( value="json/makerLocation" , method=RequestMethod.GET)
	public Map<String, String> makerLocation(@RequestParam String address)  throws Exception {

		Map<String , String> mapInfo = getJsonAddress(address);
		return mapInfo;
	}
 */