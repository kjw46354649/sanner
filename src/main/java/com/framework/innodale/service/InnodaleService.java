package com.framework.innodale.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface InnodaleService {

        /**
         * 등록하고 생성된 키를 리턴한다.
         * @param hashMap
         * @throws Exception
         */
        public int createKeyReturn(Map<String, Object> hashMap) throws Exception;

        /**
         * 등록
         * @param hashMap
         * @throws Exception
         */
        public void create(Map<String, Object> hashMap) throws Exception;

        /**
         * 수정
         * @param hashMap
         * @throws Exception
         */
        public void update(Map<String, Object> hashMap) throws Exception;

        /**
         * 삭제
         * @param hashMap
         * @throws Exception
         */
        public void remove(Map<String, Object> hashMap) throws Exception;

        /**
         * 조회
         * @param hashMap
         * @return
         * @throws Exception
         */
        public Map<String, Object> getInfo(Map<String, Object> hashMap) throws Exception;

        /**
         * 페이지 처리시 총 건수 구하기
         * @param hashMap
         * @return
         * @throws Exception
         */
        // public int getPageTotalCount() throws Exception;

        /**
         * 리스트 조회
         * @param hashMap
         * @return
         * @throws Exception
         */
        public List<Map<String, Object>> getList(Map<String, Object> hashMap) throws Exception;

        /**
         * 페이지 처리시 페이지 리스트 조회
         * @param hashMap
         * @return
         * @throws Exception
         */
        public void getPageList(Map<String, Object> hashMap) throws Exception;

        /**
         * 그리드 삽입/갱신
         *
         * @param map
         * @throws Exception
         */
        public void modifyGrid(Map<String, Object> map) throws Exception;

        /**
         * 그리드 삭제
         *
         * @param map
         * @throws Exception
         */
        public void deleteGrid(Map<String, Object> map) throws Exception;

}
