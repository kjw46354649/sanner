<%--
  Created by IntelliJ IDEA.
  User: heeky
  Date: 2020-03-18
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="page-context">
    <div class="row m-b-md">
        <div class="col-sm-12">&nbsp;
            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    업체 정보 관리
                </header>
                <div class="panel-body">
                    <form class="form-inline" id="company-master-search-form" name="company-master-search-form" role="form">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_COMP_CLASS">사업자구분</label>
                                <input type="email" class="form-control" id="SEL_COMP_CLASS" placeholder="Enter email">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_COMP_TYPE">발주사</label>
                                <input type="password" class="form-control" id="SEL_COMP_TYPE" placeholder="Password">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="MODULE_NM">견적번호</label>
                                <input type="password" class="form-control" id="MODULE_NM" placeholder="Password">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="ITEM_NM">제목</label>
                                <input type="email" class="form-control" id="ITEM_NM" placeholder="Enter email">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="DRAWING_NUM">도면번호</label>
                                <input type="password" class="form-control" id="DRAWING_NUM" placeholder="Password">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="PART_NUM">품명</label>
                                <input type="password" class="form-control" id="PART_NUM" placeholder="Password">
                            </div>
                        </div>
                        <div class="line line-dashed b-b line-xs"></div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="SEL_STAFF_NM">Option</label>
                                <input type="email" class="form-control" id="SEL_STAFF_NM" placeholder="Enter email">
                            </div>
                            <div class="form-group col-md-4">
                                <input type="password" class="form-control" id="SEL_CEO_NM" placeholder="Password">
                            </div>
                            <div class="form-group col-md-4 text-right">
                                <div type="submit" class="btn btn-success btn-sm btn-default">SEARCH</div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="estimate_master_top_grid" class="jqx-refresh"></div>
                </div>
            </section>
        </div>
        <div class="row">&nbsp;
            <section>
                <div class="col-md-12">
                    <div id="estimate_master_sub_grid" class="jqx-refresh"></div>
                </div>
            </section>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        'use strict';
        let click_seq;
        let estimateMasterTopGrid = $("#estimate_master_top_grid");
        let estimateMasterBotGrid = $("#estimate_master_sub_grid");

        let topColModel= [

        ];

        let botColModel= [

        ];


    });


</script>