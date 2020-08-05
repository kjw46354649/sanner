<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>J-MES POP(Point Of Production)</title>
	<!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
	<link rel="shortcut icon" href="/favicon.ico">
	<!-- Chrome, Safari, IE -->
	<link rel="icon" href="/favicon.ico">
    <link href="/resource/asset/css/tvreset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/webFont.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/tv2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
</head>
<body>
	<div class="bodyWrap">
		<div class="header">
			<h1>Point Of Production</h1><a href="javascript:getAllData();" class="refresh">refresh</a>
		</div>
		<section class="contents pop">
			<div class="popWrap">
				<ul class="oneDepthRow">
					<!--1줄 시작 -->
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<!--1줄  1단 시작 -->
							<li class="twoDepthIB pro27">
								<div class="conWrap" style="width: 930px">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">대형MCT</a></li>
										</ul>
									</div>
									<div class="page tab1" style="width: 880px">
										<ul class="p_row">
											<li class="p_col" id="ARE02_1">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black"></div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px"  alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE02_2">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black"></div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 380px;position: absolute;left: 630px;width:25.1%;">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">대형MCT(<sapn id="CNT_POP030">0</sapn>)</span>
													</div>
													<ul id="POP030" data-cnt="12">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->

													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE02_3">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-대형3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE02_4">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-대형4</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!--1줄  1단 마지막 -->

							<!--1줄  2단 시작 -->
							<li class="twoDepthIB pro60">
								<div class="conWrap" style="width: 2435px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">소형MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" id="ARE01_1">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum">9999'</span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_logoff.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">9Log off</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_3">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">8</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>

											<li class="p_col" style="height: 380px;position: absolute;left: 966px;width:240px;">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt" >소형MCT1(<sapn id="CNT_POP010">0</sapn>)</span>
													</div>
													<ul id="POP010" data-cnt="12">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->
													</ul>
												</div>
											</li>
											<li class="p_col" style="width: 240px;">
												<div class="list">
													<div class="nodata"></div>
													<!--공간차지하기위해서 틀만 만들어놓음-->
												</div>
											</li>

											<li class="p_col" id="ARE01_4">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-4</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">7</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_5">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-5</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_logoff.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">6Log off</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_6">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-6</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_logoff.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">5Log off</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 380px;position: absolute;left: 2150px;width:240px;">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">소형MCT2(<sapn id="CNT_POP020">0</sapn>)</span>
													</div>
													<ul id="POP020" data-cnt="12">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>

										<ul class="p_row">
											<li class="p_col" id="ARE01_7">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-7</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">4</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_8">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-8</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_logoff.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">3Log off</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_9">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-9</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">2</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="margin-right: 0px;">
												<div class="nodata"></div>
											</li>
											<li class="p_col" style="margin-right: 17px;">
												<div class="nodata"></div>
											</li>
											<li class="p_col" id="ARE01_10">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-10</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">1</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_11">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-11</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">0</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<!--1줄  2단 마지막 -->

							<!--1줄  3단 시작 -->
							<li class="twoDepthIB pro10" style="position: absolute;left: 3470px;">
								<div class="conWrap" style="width: 86%;height: 1980px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">외부</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" style="margin-bottom: 42.5px;">
											<li class="p_col">
												<div class="list" style="height: 572px">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt" >후가공(<sapn id="CNT_POP150">0</sapn>)</span>
													</div>
													<ul id="POP150" data-cnt="19">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row" style="margin-bottom: 42.5px;">
											<li class="p_col">
												<div class="list" style="height: 572px">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt" >표면처리(<sapn id="CNT_POP160">0</sapn>)</span>
													</div>
													<ul id="POP160" data-cnt="19">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col">
												<div class="list" style="height: 572px">
													<div class="titleWrap">
<!--														<span class="f_txt">POP</span>-->
														<span class="s_txt" style="width: 239px;">외주진행(<sapn id="CNT_POP9991">0</sapn>)</span>
													</div>
													<ul id="POP9991" data-cnt="19">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-0011234</li>--%>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<!--1줄  3단 마지막 -->

						</ul>
					</li>
					<!--1줄 마지막 -->

					<!--2줄 시작 -->
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<!-- 2줄 1단 시작 -->
							<li class="twoDepthIB pro27">
								<div class="conWrap" style="width: 930px">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">선반/연마</a></li>
										</ul>
									</div>
									<div class="page tab1" style="width: 880px">
										<ul class="p_row" id="ARE12_1">
											<li class="p_col">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">선반-1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE12_2">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">연마-1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 580px;position: absolute;left: 630px;width:24.1%;">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">선반/연마실(<sapn id="CNT_POP060">0</sapn>)</span>
													</div>
													<ul id="POP060" data-cnt="20">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>319-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>319-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE12_3">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">선반-2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE12_4">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">연마-2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE12_5">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">선반-3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE12_6">
												<div class="thumb thb_blue">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_blue">연마-3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!-- 2줄 1단 마지막 -->

							<!-- 2줄 2단 시작 -->
							<li class="twoDepthIB pro29" style="margin-right: 10px;">
								<div class="conWrap">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">밀링/사상</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" id="ARE03_1">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE03_2">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE03_3">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 580px;position: absolute;left: 880px;width: 240px">
												<div class="list" style="height: 100%;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt"  >사상(<sapn id="CNT_POP050">0</sapn>)</span>
													</div>
													<ul id="POP050" data-cnt="19">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>319-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->

													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE03_4">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-4</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE03_5">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-5</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 380px;position: absolute;left: 605px;width: 267px">
												<div class="list" style="height: 100%;width: 265px;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt" >밀링(<sapn id="CNT_POP040">0</sapn>)</span>
													</div>
													<ul id="POP040" data-cnt="12">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE03_6">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-6</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE03_7">
												<div class="thumb thb_green">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_green">밀링-7</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_green">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!-- 2줄 2단 마지막 -->

							<!-- 2줄 3단 시작 -->
							<li class="twoDepthIB pro10" style="margin-right: 10px;">
								<div class="conWrap" style="width: 380px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">2공장MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" id="ARE05_1">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">2-NC-1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE05_2">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">2-NC-2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col">
												<div class="list" style="height: 180px;width: 286px;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">2공장(<sapn id="CNT_POP080">0</sapn>)</span>
													</div>
													<ul id="POP080" data-cnt="5">
														<%--<li>이건 몇번?????</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<!-- 2줄 3단 마지막 -->

							<!-- 2줄 4단 시작 -->
							<li class="twoDepthIB pro19">
								<div class="conWrap" style="width: 890px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">3공장MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" id="ARE06_1">
											<li class="p_col">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">3-NC1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE06_2">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">3-NC2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 580px;position: absolute;left: 600px;width: 240px;">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">대형MCT(<sapn id="CNT_POP090">0</sapn>)</span>
													</div>
													<ul id="POP090" data-cnt="19">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>319-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>319-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE06_3">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">3-NC3</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE06_4">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">3-NC4</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_2.png" alt="선반"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap">-</div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE06_5">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">3-NC5</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName" style="width: 190px"></span>
														<span class="proNum" ></span>
													</div>
												</div>
											</li>
											<li class="p_col">
												<div class="nodata"></div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!-- 2줄 4단 마지막 -->

						</ul>
					</li>
					<!--2줄 마지막 -->

					<!--3줄 시작 -->
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<!--3줄 1단 이벤트 알람 시작 -->
							<li class="twoDepthIB pro27">
								<div class="alarm">
									<h2>Event Alarm</h2>
									<ul id="alarm_list">
										<%--<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>
										<li class="alarmList">
											<span class="dateTxt">[02/10 14:30:42]</span>
											<span class="progressTxt ellipsis"><b>검사 완료 (등급 C) </b> : C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)C19-625-0793-15 (35 EA)</span>
										</li>--%>
									</ul>
								</div>
							</li>
							<!--3줄 1단 이벤트 알람 마지막 -->

							<!--3줄 2단 정밀mct 시작 -->
							<li class="twoDepthIB pro620" style="margin-right: 25px;">
								<div class="conWrap">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">정밀MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col"  id="ARE11_1" style="height: 250px;">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-정밀1</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_3.png" alt="NCT"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
											<li class="p_col" style="height: 520px;position: absolute;left: 345px;width: 240px">
												<div class="list" style="height: 100%">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">정밀MCT(<sapn id="CNT_POP070">0</sapn>)</span>
													</div>
													<ul id="POP070" data-cnt="17">
													<%--	<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-0011234</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col"  id="ARE11_2" style="height: 250px;">
												<div class="thumb thb_gray">
													<div class="topDiv">
														<div class="leftWrap">
															<div class="txtWrap tab_black">NC-정밀2</div>
															<div class="imgWrap"><img src="/resource/asset/images/tv/img_thumb_1.png" alt="연마"></div>
														</div>
														<div class="rightWrap">
															<div class="profileWrap">
																<span><img src="/resource/asset/images/tv/img_nopic.png" width="75px" height="75px" alt=""></span></div>
															<div class="nameWrap"></div>
														</div>
													</div>
													<div class="bottomDiv pro_blue">
														<span class="proName"></span>
														<span class="proNum"></span>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!--3줄 2단 정밀mct 마지막 -->

							<!--3줄 3단  시작 -->
							<li class="twoDepthIB pro14" style="margin-right: 25px;">
								<div class="conWrap">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">교정/마감실</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col">
												<div class="list" style="height: 209px;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">교정/마감실(<sapn id="CNT_POP130">0</sapn>)</span>
													</div>
													<ul id="POP130" data-cnt="6">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
											<li class="p_col">
												<div class="list" style="height: 209px;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">교면교정장(<sapn id="CNT_POP140">0</sapn>)</span>
													</div>
													<ul id="POP140" data-cnt="6">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="conWrap" style="margin-top: 20px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">기타</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col">
												<div class="list" style="height: 153px;">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">2층창고(<sapn id="CNT_POP170">0</sapn>)</span>
													</div>
													<ul id="POP170" data-cnt="4">
													<%--	<li>이건 몇번?????</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-0011234</li>-->
<!--														<li>C19-625-0799-0011234</li>-->
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<!--3줄 3단  마지막 -->

							<!--3줄 4단  시작 -->
							<li class="twoDepthIB pro13" style="margin-right: 25px;">
								<div class="conWrap" style="height: 670px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">출하대기장</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" style="width: 48.0%">
												<div class="list" style="height: 516px">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">출하대기장(<sapn id="CNT_POP110">0</sapn>)</span>
													</div>
													<ul id="POP110" data-cnt="17">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
											<li class="p_col" style="width: 48.0%">
												<div class="list" style="height: 516px">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">출하대기장(<sapn id="CNT_POP120">0</sapn>)</span>
													</div>
													<ul id="POP120" data-cnt="17">
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<%--														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!--3줄 4단  마지막 -->

							<!--3줄 5단  시작 -->
							<li class="twoDepthIB pro13" >
								<div class="conWrap" style="height: 670px;">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">검사실</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" style="width: 48.0%">
												<div class="list" style="height: 516px">
													<div class="titleWrap">
														<span class="f_txt">POP</span>
														<span class="s_txt">검사실(<sapn id="CNT_POP100">0</sapn>)</span>
													</div>
													<ul id="POP100" data-cnt="17">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
											<li class="p_col" style="width: 48.0%">
												<div class="list" style="height: 516px">
													<div class="titleWrap">
<!--														<span class="f_txt">&nbsp;</span>-->
														<span class="s_txt" style="width: 239px;">소재대기(<sapn id="CNT_POP9992">0</sapn>)</span>
													</div>
													<ul id="POP9992" data-cnt="17">
														<%--<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>
														<li>C19-625-0799-001</li>--%>
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
<!--														<li>C19-625-0799-001</li>-->
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</div>

							</li>
							<!--3줄 5단  마지막 -->

						</ul>
					</li>
					<!--3줄 마지막 -->
				</ul>
			</div>
		</section>
	</div>
<script>
	$(function () {
		let getData = function () {
			'use strict';

			$.ajax({
				type: 'POST', url: "/tv/pop/data", dataType: 'json',
				data: {},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success') {
						alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.3");
						return;
					}
					if (data == null) {
						alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.2");
						return;
					}

					let pop_list1 = data.pop_list1;//pop
					let pop_list2 = data.pop_list2;//소재대기
					let pop_list3 = data.pop_list3;//외주진행
					let m_list = data.m_list;//장비

					//init
					$('[id^=CNT_POP]').each(function () {
						$(this).html('0');
					});
					$('[id^=POP]').each(function () {
						$(this).empty();
					});
					$('[id^=ARE]').each(function () {
						$(this).find(".leftWrap").find(".txtWrap").html('');
						$(this).find(".rightWrap").find(".nameWrap").html('Log off');
						$(this).find(".rightWrap").find("img").attr("src", "/resource/asset/images/tv/img_logoff.png");
						$(this).find(".proName").html('');
						$(this).find(".proName").removeClass("ellipsis");
						$(this).find(".proNum").html('');
					});

					if (pop_list1 != '') {//pop
						for (let i = 0; i < pop_list1.length; i++) {
							let pop_position = pop_list1[i].POP_POSITION;
							let control_part_info = pop_list1[i].CONTROL_PART_INFO;
							let total_cnt = pop_list1[i].TOTAL_CNT;

							setPopData(pop_position, control_part_info, total_cnt);
						}
					}
					if (pop_list2 != '') {//소재대기
						for (let i = 0; i < pop_list2.length; i++) {
							let pop_position = 'POP9992';
							let control_part_info = pop_list2[i].CONTROL_PART_INFO;
							let total_cnt = pop_list2[i].TOTAL_CNT;

							setPopData(pop_position, control_part_info, total_cnt);
						}
					}
					if (pop_list3 != '') {//외주
						for (let i = 0; i < pop_list3.length; i++) {
							let pop_position = 'POP9991';
							let control_part_info = pop_list3[i].CONTROL_PART_INFO;
							let total_cnt = pop_list3[i].TOTAL_CNT;

							setPopData(pop_position, control_part_info, total_cnt);
						}
					}
					//2공장 MCT, 기타 진행해야 함.

                    if (m_list != '') {//장비
                        for (let i = 0; i < m_list.length; i++) {
                            let factory_area = m_list[i].FACTORY_AREA;
                            let layout_sort = m_list[i].LAYOUT_SORT;
                            let equip_nm = m_list[i].EQUIP_NM;

                            let control_part_info = m_list[i].CONTROL_PART_INFO;
							let working_time = m_list[i].WORKING_TIME;
							let user_nm = m_list[i].USER_NM;
							let user_photo_gfile_seq = m_list[i].USER_PHOTO_GFILE_SEQ;

							let $target = $("#" + factory_area+"_"+layout_sort);
							if($target.length > 0){
								if(equip_nm != undefined) {
									$target.find(".leftWrap").find(".txtWrap").html(equip_nm);
								}
								if(user_nm != undefined) {
									$target.find(".rightWrap").find(".nameWrap").html(user_nm);
								}
								if(user_photo_gfile_seq != undefined){
									$target.find(".rightWrap").find("img").attr("src", "/image/" + user_photo_gfile_seq);
								}
								if(control_part_info != undefined) {
									$target.find(".proName").addClass("ellipsis");
									$target.find(".proName").html(control_part_info);
								}
								if(working_time != undefined) {
									$target.find(".proNum").html(working_time + "'");
								}
							}

                        }
                    }
					//console.log(m_list);

				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.");
				}
			});
		};

		let setPopData = function (popPosition, liInfo, totalCnt) {
			if (popPosition != "") {
				let maxCnt = $("#" + popPosition).attr("data-cnt");
				let targetCnt = $("#" + popPosition).find("li").length;
				if (maxCnt > targetCnt) {
					$("#" + popPosition).append("<li class=\"ellipsis\">" + liInfo + "</li>");
				}
				$("#CNT_" + popPosition).html(totalCnt);
			}
		}
		let curr_seq = 0;
		let getAlarm = function () {
					'use strict';

					$.ajax({
						type: 'POST', url: "/tv/pop/alarm", dataType: 'json',
						data: {"SEQ":curr_seq},
						success: function (data, textStatus, jqXHR) {
							if (textStatus !== 'success') {
								alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.3");
								return;
							}
							if (data == null) {
								alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.2");
								return;
							}

							let alarm_list = data.alarm_list;
							let maxCnt = 9;
							if (alarm_list != '') {
								for (let i = 0; i < alarm_list.length; i++) {
									let data1 = alarm_list[i].DATA1;
									let data2 = alarm_list[i].DATA2;
									let data3 = alarm_list[i].DATA3;
									let SEQ = alarm_list[i].SEQ;
									curr_seq = SEQ;

								let al = '<li class="alarmList">';
									al += '<span class="dateTxt">[' + data1 + ']</span>';
									al += '<span class="progressTxt ellipsis"><b>' + data2 + ' </b> : ' + data3 + '</span>';
									al += '</li>';

                                    if($(".alarmList").length >= maxCnt){
                                        $(".alarmList").last().remove();
                                    }

									$("#alarm_list").prepend($(al).fadeIn(2000));
								}
							}

						},
						error: function (jqXHR, textStatus, errorThrown) {
							alert("시스템에 문제가 발생하였습니다. 잠시 후 재작업 부탁 드립니다.");
						}
					});
				};
		let getAllData = function(){
			getData();
			getAlarm();
		}
		let setIntervalTimer;
		let timer = function(){
			let selVal = 60;//1분
			let timesec = 1000;//1초
			setIntervalTimer = setInterval(function() {
				getData();
			}, timesec*selVal);
		}

		let setIntervalTimer_alarm;
		let timer_alarm = function(){
			let selVal = 5;//1분
			let timesec = 1000;//1초
			setIntervalTimer_alarm = setInterval(function() {
				getAlarm();
			}, timesec*selVal);
		}

		getAllData();
		timer();
		timer_alarm();
	});

</script>
</body>
</html>