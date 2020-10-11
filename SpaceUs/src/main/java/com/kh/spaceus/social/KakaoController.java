package com.kh.spaceus.social;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class KakaoController {

  private final static String K_CLIENT_ID = "017446cfc5cb51f558fc94c4b060e0df";
  private final static String K_REDIRECT_URI = "http://localhost:9090/spaceus/member/kakaoLogin.do";

  public String getAuthorizationUrl(HttpSession session) {

    String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
        + "client_id=" + K_CLIENT_ID + "&redirect_uri="
        + K_REDIRECT_URI + "&response_type=code";
    return kakaoUrl;
  }

  public String getAccessToken(String autorize_code) {

    final String RequestUrl = "https://kauth.kakao.com/oauth/token";
    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
    postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
    postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); // 리다이렉트 URI
    postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값

    final HttpClient client = HttpClientBuilder.create().build();
    final HttpPost post = new HttpPost(RequestUrl);
    JsonNode returnNode = null;

    try {

      post.setEntity(new UrlEncodedFormEntity(postParams));
      final HttpResponse response = client.execute(post);
      final int responseCode = response.getStatusLine().getStatusCode();

      // JSON 형태 반환값 처리

      ObjectMapper mapper = new ObjectMapper();
      returnNode = mapper.readTree(response.getEntity().getContent());

    } catch (UnsupportedEncodingException e) {

      e.printStackTrace();

    } catch (ClientProtocolException e) {

      e.printStackTrace();

    } catch (IOException e) {

      e.printStackTrace();

    } finally {
      // clear resources
    }
    return returnNode.get("access_token").toString();
  }

  public JsonNode getKakaoUserInfo(String autorize_code) {

    final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
//    String CLIENT_ID = K_CLIENT_ID; // REST API KEY
//    String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
//    String code = autorize_code; // 로그인 과정중 얻은 토큰 값
    
    
    final HttpClient client = HttpClientBuilder.create().build();
    final HttpPost post = new HttpPost(RequestUrl);
    String accessToken = getAccessToken(autorize_code);
    log.info("accessToken = {}", accessToken);
    
    // add header
    post.addHeader("Authorization", "Bearer " + accessToken);
    //post.addHeader("Content-Type" , "x-www-form-urlencoded");	

    JsonNode returnNode = null;

    try {

      final HttpResponse response = client.execute(post);
      log.info("response = {}", response);
      final int responseCode = response.getStatusLine().getStatusCode();
      log.info("Sending 'POST' request to URL : {}", RequestUrl);
      log.info("Response Code : {}", responseCode);

      // JSON 형태 반환값 처리
      ObjectMapper mapper = new ObjectMapper();
      log.info("mapper : {}", mapper);

      returnNode = mapper.readTree(response.getEntity().getContent());
      
      log.info("returnNode : {}", returnNode);
      
    } catch (UnsupportedEncodingException e) {

      e.printStackTrace();
    } catch (ClientProtocolException e) {

      e.printStackTrace();
    } catch (IOException e) {

      e.printStackTrace();
    } finally {

      // clear resources
    }
    return returnNode;
  }
}
