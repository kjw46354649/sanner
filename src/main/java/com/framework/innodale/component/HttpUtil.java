package com.framework.innodale.component;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HttpUtil {
    public static void callApi(String apiUrl, JsonObject params, String type) {
        HttpURLConnection conn = null;

        try {
            URL url = new URL(apiUrl);
            conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod(type);
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setRequestProperty("Content-Type","application/json");
            conn.setRequestProperty("Transfer-Encoding", "chunked");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setDoInput(true);
            conn.setDoOutput(true);

            JSONObject command = new JSONObject();
            command.put("data",params.toString());

            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(params.toString());
            wr.flush();
            System.out.println("params : " + params.toString());

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {

                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder sb = new StringBuilder();
                String line = "";
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
                br.close();
                // 응답 데이터
                System.out.println("responseJson :: " + sb.toString());
            }

            wr.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
