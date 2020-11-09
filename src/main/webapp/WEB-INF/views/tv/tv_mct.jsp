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
    <title>J-MES MCT 가동현황</title>
	<!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
	<link rel="shortcut icon" href="/favicon.ico">
	<!-- Chrome, Safari, IE -->
	<link rel="icon" href="/favicon.ico">
    <link href="/resource/asset/css/tvreset.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/webFont.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/common.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/resource/asset/css/tv.css" rel="stylesheet" type="text/css" />
	<!-- alertify -->
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/alertify.css" />
	<link rel="stylesheet" type="text/css" href="/resource/plugins/alertifyjs/css/themes/default.css" />

    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
	<!-- alertify -->
	<script type="text/javascript" src='/resource/plugins/alertifyjs/alertify.js'></script>

	<!-- socket -->
	<script type="text/javascript" src='/resource/plugins/socket/sockjs.min.js'></script>
	<script type="text/javascript" src='/resource/plugins/stomp/stomp.min.js'></script>
	<style type="text/css">
	        html {
	            cursor: none;
	       	}
	</style>
</head>
<body>
	<div class="bodyWrap mct">
		<div class="header">
			<div class="left">
				<h1 class="title">MCT 가동 및 주요 현황</h1>
				<div class="infoTit infoContsWrap">
					<div class="infoCont">
						<span>현재</span>
<%--						<span class="txtB">82%</span>--%>
						<span class="txtB"></span>
					</div>
					<div class="infoCont">
						<span>3일간 평균</span>
						<span class="txtR"></span>
					</div>
					<div class="infoCont">
						<span>月 평균</span>
						<span></span>
					</div>
				</div>
				<a href="/tv/mct" class="refresh">refresh</a>
			</div>
			<div class="right">
<%--				<div class="infoTit"><img src="/resource/asset/images/common/logo-02.png"> &nbsp;&nbsp;진성정밀 & (주)제이에스하이테크</div>--%>
			</div>
		</div>
		<section class="contents pop ty2">
			<div class="popWrap">
				<ul class="oneDepthRow">
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<li class="twoDepthIB pro">
								<div class="conWrap">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">소형MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row">
											<li class="p_col" id="ARE01_1_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on machine-run-background">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB ellipsis"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_2">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_3">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_4">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_5">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_6">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_1_7">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row">
											<li class="p_col" id="ARE01_2_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_2">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_3">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_4">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_5">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_6">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col" id="ARE01_2_7">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
<%--									<div class="percentWrap">--%>
<%--										<span class="txtB"> </span>--%>
<%--										<span class="txtR">&nbsp;</span>--%>
<%--										<span>&nbsp;</span>--%>
<%--									</div>--%>
								</div>
							</li>
						</ul>
					</li>
					<!--2줄 시작-->
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<li class="twoDepthIB pro30">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">대형MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE02_1_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE02_1_2" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row"  style="padding:21px 20px 0;">
											<li class="p_col" id="ARE02_2_1" >
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE02_2_2" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
<%--									<div class="percentWrap">--%>
<%--										<span class="txtB"> </span>--%>
<%--										<span class="txtR">&nbsp;</span>--%>
<%--										<span>&nbsp;</span>--%>
<%--									</div>--%>
								</div>
							</li>
							<li class="twoDepthIB pro16">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">정밀MCT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE11_1_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE11_2_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
<%--									<div class="percentWrap">--%>
<%--										<span class="txtB"> </span>--%>
<%--										<span class="txtR">&nbsp;</span>--%>
<%--										<span>&nbsp;</span>--%>
<%--									</div>--%>
								</div>
							</li>
							<li class="twoDepthIB pro16">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">JST</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE05_1_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE05_2_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
<%--									<div class="percentWrap">--%>
<%--										<span class="txtB"> </span>--%>
<%--										<span class="txtR">&nbsp;</span>--%>
<%--										<span>&nbsp;</span>--%>
<%--									</div>--%>
								</div>
							</li>
							<li class="twoDepthIB pro30">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">DMT</a></li>
										</ul>
									</div>
									<div class="page tab1">
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE06_1_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE06_1_2" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE06_1_3" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<ul class="p_row" style="padding:21px 20px 0;">
											<li class="p_col" id="ARE06_2_1">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE06_2_2" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap ty2 on">
															<a href="#a;">
																<span class="nodata"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
														<div class="inWrap">
																<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span class="txtB ty2"></span>
															</a>
														</div>
													</div>
												</div>
											</li>
											<li class="p_col"  id="ARE06_2_3" style="margin-left:11px;">
												<div class="statusWrap">
													<div class="statusBar">
														<div class="inBox"></div>
														<div class="inBox"></div>
														<div class="inBox">
															<div></div>
															<div class="txtY"></div>
														</div>
													</div>
													<div class="statusConts">
														<div class="inWrap on">
															<a href="#a;">
																<span><br></span>
																<span><span class="txtB"></span><br></span>
																<span></span>
																<span><span class="txtR"></span><br>(<span class="txtB ty2"></span>)</span>
															</a>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
<%--									<div class="percentWrap">--%>
<%--										<span class="txtB"> </span>--%>
<%--										<span class="txtR">&nbsp;</span>--%>
<%--										<span>&nbsp;</span>--%>
<%--									</div>--%>
								</div>
							</li>
						</ul>
					</li>
					<li class="oneDepthIB">
						<ul class="twoDepthCol">
							<li class="twoDepthIB pro">
								<div class="statusTblWrap">
									<div class="statusTblBox w1260">
										<div class="tblTitWrap">
											<div class="tblTit"><span>불량/반품</span> 발생 현황 <span id="grid1_total">(total: 0)</span></div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 발생일, 발주처, 관리번호, 유형, 수량, 납기, 불량코드, 조치로 구분된 불량/반품 발생 현황(3일간)</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
													<col width="115px">
													<col width="219px">
													<col width="74px">
													<col width="74px">
													<col width="74px">
													<col width="150px">
													<col width="95px">
												</colgroup>
												<thead>
													<tr>
														<th>No</th>
														<th>발생일</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>검사유형</th>
														<th>수량</th>
														<th>가공납기</th>
														<th>불량코드</th>
														<th>조치</th>
													</tr>
												</thead>
												<tbody id="grid1">
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="statusTblBox w1100">
										<div class="tblTitWrap">
											<div class="tblTit ty2"><span>긴급</span>주문 진행현황<span id="grid2_total">(total: 0)</span></div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 납기, 출고일, 발주처, 관리번호, 수량, 진행상태로 구분된 긴급주문 진행현황</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
													<col width="145px">
													<col width="115px">
													<col width="169px">
													<col width="74px">
													<col width="138px">
												</colgroup>
												<thead>
													<tr>
														<th>No</th>
														<th>가공납기</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>수량</th>
														<th>진행상태</th>
														<th>현재위치</th>
													</tr>
												</thead>
												<tbody id="grid2">
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="statusTblBox w1150">
										<div class="tblTitWrap">
											<div class="tblTit ty3">가공 <span>지연</span> 목록<span id="grid3_total">(total: 0)</span></div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 납기, 출고일, 발주처, 관리번호, 수량, 진행상태, 담당영업으로 내부 가공 지원 리스트</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
													<col width="115px">
													<col width="219px">
													<col width="74px">
													<col width="150px">
													<col width="103px">
												</colgroup>
												<thead>
													<tr>
														<th>No</th>
														<th>가공납기</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>수량</th>
														<th>진행상태</th>
														<th>담당영업</th>
													</tr>
												</thead>
												<tbody id="grid3">
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
													<tr><td><div class="nodata"></div></td></tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</section>
	</div>
<script>

	let windowImageViewer;
	let machineListData;

    function callWindowImageViewer(imageSeq)
    {
        // 팝업창 열려 있는지 확인
        if(typeof(windowImageViewer)=='undefined' || windowImageViewer.closed) {
            windowImageViewer = window.open("/imageViewer", "jmesImageViewChildForm", "width=1024, height=768, resizable = no, scrollbars = no");
            windowImageViewer.onload = function () {
                setTimeout(function () {
                    $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
                    windowImageViewer.onImageViewStart();
                }, 500);
            };
        }else {
            windowImageViewer.focus();
            setTimeout(function() {
                $(windowImageViewer.window.document).find("#image_seq").val(imageSeq);
                windowImageViewer.onImageViewStart();
            }, 500);
        }
    }

	/**
	 * @title {String or DOMElement} The dialog title.
	 * @message {String or DOMElement} The dialog contents.
	 * @onok {Function} Invoked when the user clicks OK button or closes the dialog.
	 *
	 * fnAlert(null,"<h1>안녕하세요</h1>", function () {alert('확인 클릭')});
	 *
	 */
	const fnAlert = function (title, message, onok) {
		alertify.alert().setting({
			'title': title,
			'message': message,
			'onok': onok,
			'movable': false,
			'transitionOff': true
		}).show();
	};

	const fnConfirm = function (title, message) {
		alertify.confirm().setting({
			'title': title,
			'message': message,
			'onok': function(){ location.reload(); },
			'oncancel': null,
			'movable': false,
			'transitionOff': true
		}).show().autoOk(60);
	};

	$(function () {

		let getInitData = function () {
			'use strict';

			$.ajax({
				type: 'POST', url: "/tv/mct/data", dataType: 'json',
				data: {},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}

					machineListData = data.mct_info_list;//mct info
					// let mct_list = data.mct_list;//mct

					//init
					$('[id^=ARE]').each(function () {
						$(this).find(".inBox:nth-child(1)").html('&nbsp;');
						$(this).find(".inBox:nth-child(2)").html('&nbsp;');
						$(this).find(".inBox:nth-child(3)").find('div:nth-child(1)').html('&nbsp;');
						$(this).find(".inBox:nth-child(3)").find('div:nth-child(2)').html('&nbsp;');
						$(this).find(".statusWrap").hide();
						$(this).find(".statusConts").empty();
					});

					//mct info
					getReLoadWorkData('init');

					createGrid1(data.grid_list1);	//불량/반품
					createGrid2(data.grid_list2);	//긴급주문
					createGrid3(data.grid_list3);	//납기지연목록
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		let getReLoadWorkData = function (sType) {
			'use strict';

			//mct info
			if (machineListData != '') {
				for (let i = 0; i < machineListData.length; i++) {

					let equip_seq = machineListData[i].EQUIP_SEQ;
					let equip_nm = machineListData[i].EQUIP_NM;
					let factory_area = machineListData[i].FACTORY_AREA;
					let layout_row = machineListData[i].LAYOUT_ROW;
					let layout_col = machineListData[i].LAYOUT_COL;
					let user_nm = machineListData[i].USER_NM;

					if(sType === 'init') {
						$("#" + factory_area + "_" + layout_row + "_" + layout_col).find(".statusWrap").show();
						$("#" + factory_area + "_" + layout_row + "_" + layout_col).find(".inBox:nth-child(1)").html(equip_nm);
						$("#" + factory_area + "_" + layout_row + "_" + layout_col).find(".inBox:nth-child(2)").html(user_nm);
					}
					// 장비의 작업 정보 조회
					getReLoadDrawingData(equip_seq, factory_area, layout_row, layout_col);

				}
			}
		};

		let getReLoadTableData = function () {
			'use strict';

			$.ajax({
				type: 'POST', url: "/tv/mct/gridDataList", dataType: 'json', data: {},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}
					createGrid1(data.grid_list1);	//불량/반품
					createGrid2(data.grid_list2);	//긴급주문
					createGrid3(data.grid_list3);	//납기지연목록
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		/** DRAWING BOARD 정보 실시간 처리 **/
		let getReLoadDrawingData = function (equipSeq, factoryArea,  equipRow, equipCol) {
			'use strict';
			$.ajax({
				type: 'POST', url: "/tv/mct/machineDrawingData", dataType: 'json',
				data: {"EQUIP_SEQ": equipSeq},
				success: function (data, textStatus, jqXHR) {
					if (textStatus !== 'success' || data == null) {
						fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}
					let $target = $("#" + factoryArea + "_" + equipRow + "_" + equipCol);
					$target.find(".statusConts").empty();
					let mct_list = data.mct_drawing_list; //mct
					if (mct_list != '') {

						let total_cnt_info = mct_list[0].TOTAL_CNT_INFO;
						let total_part_qty_info = mct_list[0].TOTAL_PART_QTY_INFO;
						let total_plan_working_time_info = mct_list[0].TOTAL_PLAN_WORKING_TIME_INFO;//여기까지 상단

						$target.find(".inBox:nth-child(3)").find('div:nth-child(1)').html(total_cnt_info + '&nbsp;' + total_part_qty_info);
						$target.find(".inBox:nth-child(3)").find('div:nth-child(2)').html(total_plan_working_time_info);

						for (let i = 0; i < mct_list.length; i++) {

							let work_plan_type = ( mct_list[i].WORK_PLAN_TYPE != undefined ) ? mct_list[i].WORK_PLAN_TYPE : '' ;//1:작동중, 나머지:계획
							let inner_due_dt = ( mct_list[i].INNER_DUE_DT != undefined ) ? mct_list[i].INNER_DUE_DT : '' ;
							let work_type_nm = ( mct_list[i].WORK_TYPE_NM != undefined ) ? mct_list[i].WORK_TYPE_NM : '' ;
							let control_part_info = ( mct_list[i].CONTROL_PART_INFO != undefined ) ? mct_list[i].CONTROL_PART_INFO : '' ;
							let size_txt = ( mct_list[i].SIZE_TXT != undefined ) ? mct_list[i].SIZE_TXT : '' ;
							let material_detail_nm =( mct_list[i].MATERIAL_DETAIL_NM != undefined ) ? mct_list[i].MATERIAL_DETAIL_NM : '' ;
							let part_qty = ( mct_list[i].PART_QTY != undefined ) ? mct_list[i].PART_QTY : '' ;
							let working_time_info = ( mct_list[i].WORKING_TIME_INFO != undefined ) ? mct_list[i].WORKING_TIME_INFO : '' ;
							let plan_working_time_info =( mct_list[i].PLAN_WORKING_TIME_INFO != undefined ) ? mct_list[i].PLAN_WORKING_TIME_INFO : '' ;
							let imageSeq =( mct_list[i].IMG_GFILE_SEQ != undefined ) ? mct_list[i].IMG_GFILE_SEQ : '' ;
							let workStatus =( mct_list[i].WORK_STATUS != undefined ) ? mct_list[i].WORK_STATUS : '' ;

							let divHtml = '';
								if(work_plan_type == 1) {
									if(workStatus == "DBS020")
										divHtml +=  '<div class="inWrap machine-run-background">';
									else if(workStatus == "DBS010")
										divHtml +=  '<div class="inWrap machine-pause-background">';
								}else{
									divHtml +=  '<div class="inWrap">';
								}
								divHtml += '<a href="javascript:callWindowImageViewer(' + imageSeq + ');">';
								divHtml += '	<span>'+inner_due_dt+'<br>'+work_type_nm+'</span>';
								divHtml += '	<span><span class="txtB ellipsis" style="font-size: 17px;">'+control_part_info+'</span><br>'+size_txt+'&nbsp;&nbsp;'+material_detail_nm+'</span>';
								divHtml += '	<span>'+part_qty+'</span>';
								// divHtml += '	<span><span class="txtR">'+working_time_info+'</span><br><span class="txtB ty2">'+plan_working_time_info+'</span></span>';
								if(work_plan_type == 1) {
									divHtml += '	<span><span class="txtR">'+working_time_info+'</span></span>';
								} else if(work_plan_type == 2) {
									divHtml += '	<span><span class="txtB ty2">'+plan_working_time_info+'</span></span>';
								}
								divHtml += '</a>';
								divHtml += '</div>';

							if($target.find(".statusConts").find('.inWrap').length >= 4){
							}else{
								if(work_plan_type == 1){
									$target.find(".statusConts").prepend(divHtml);
									$target.find(".statusConts").find('.inWrap:nth-child(1)').addClass("on");
								}else{
									$target.find(".statusConts").append(divHtml);
								}
							}

						}
						//현재 가동중인게 없을경우 넣어준다 공간. 색 다르게
						$('.statusConts').each(function () {
							if($(this).find(".statusConts").find('.inWrap').length >= 4){
							}else{
								if($(this).find(".on").length == 0){
									let emptyHtml = '<div class="inWrap ty2 on"><a href="#a;"><span class="nodata"></span></a></div>';
									$(this).prepend(emptyHtml);
								}
							}
						});
					}
				},
				error: function (jqXHR, textStatus, errorThrown) {
					fnAlert(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
				}
			});
		};

		let createGrid1 = function(grid_list1){
			$("#grid1").empty();
			if (grid_list1 != '') {
				let totalCount = 0;
				for (let i = 0; i < grid_list1.length; i++) {
					totalCount = grid_list1[i].TOTAL_COUNT;
					let inspect_dt = grid_list1[i].INSPECT_DT == undefined ? "" : grid_list1[i].INSPECT_DT;
					let order_comp_nm = grid_list1[i].ORDER_COMP_NM == undefined ? "" : grid_list1[i].ORDER_COMP_NM;
					let control_part_info = grid_list1[i].CONTROL_PART_INFO == undefined ? "" : grid_list1[i].CONTROL_PART_INFO;
					let error_type = grid_list1[i].ERROR_TYPE == undefined ? "" : grid_list1[i].ERROR_TYPE;
					let error_qty_info = grid_list1[i].ERROR_QTY_INFO == undefined ? "" : grid_list1[i].ERROR_QTY_INFO;
					let inner_due_dt = grid_list1[i].INNER_DUE_DT == undefined ? "" : grid_list1[i].INNER_DUE_DT;
					let inspect_result_nm = grid_list1[i].INSPECT_RESULT_NM == undefined ? "" : grid_list1[i].INSPECT_RESULT_NM;
					let error_action_nm = grid_list1[i].ERROR_ACTION_NM == undefined ? "" : grid_list1[i].ERROR_ACTION_NM;

					let grid1Html = '<tr>';
						grid1Html += '<td>' + (i+1) +'</td>';
						grid1Html += '<td>'+ inspect_dt + '</td>';
						grid1Html += '<td>'+ order_comp_nm + '</td>';
						grid1Html += '<td class="alignLeft ellipsis">'+ control_part_info + '</td>';
						grid1Html += '<td class="txtR">'+ error_type + '</td>';
						grid1Html += '<td class="txtR">'+ error_qty_info + '</td>';
						grid1Html += '<td>'+ inner_due_dt + '</td>';
						grid1Html += '<td>'+ inspect_result_nm + '</td>';
						grid1Html += '<td class="ellipsis">'+ error_action_nm + '</td>';
						grid1Html += '</tr>';

					$("#grid1").append(grid1Html);
					if((i+1) == 5){
						break;
					}
				}
				$("#grid1_total").html("(total: " + totalCount + ")");
			} else {
				for (let i = 0; i < 5; i++) {
					let grid1Html = '<tr><td colspan="8"></td></tr>';
					$("#grid1").append(grid1Html);
				}
				$("#grid1_total").html("(total: 0)");
			}
		};

		let createGrid2 = function(grid_list2){
			$("#grid2").empty();
			if (grid_list2 != '') {
				let totalCount = 0;
				for (let i = 0; i < grid_list2.length; i++) {
					totalCount = grid_list2[i].TOTAL_COUNT;
					let inner_due_dt = grid_list2[i].INNER_DUE_DT == undefined ? "" : grid_list2[i].INNER_DUE_DT;
					let order_comp_nm = grid_list2[i].ORDER_COMP_NM == undefined ? "" : grid_list2[i].ORDER_COMP_NM;
					let control_part_info = grid_list2[i].CONTROL_PART_INFO == undefined ? "" : grid_list2[i].CONTROL_PART_INFO;
					let control_part_qty_info = grid_list2[i].CONTROL_PART_QTY_INFO == undefined ? "" : grid_list2[i].CONTROL_PART_QTY_INFO;
					let part_status_nm = grid_list2[i].PART_STATUS_NM == undefined ? "" : grid_list2[i].PART_STATUS_NM;
					let pop_position_nm = grid_list2[i].POP_POSITION_NM == undefined ? "" : grid_list2[i].POP_POSITION_NM;

					let grid2Html = '<tr>';
						grid2Html += '<td>' + (i+1) +'</td>';
						grid2Html += '<td class="txtR bold">'+ inner_due_dt + '</td>';
						grid2Html += '<td class="ellipsis">'+ order_comp_nm + '</td>';
						grid2Html += '<td class="alignLeft ellipsis">'+ control_part_info + '</td>';
						grid2Html += '<td>'+ control_part_qty_info + '</td>';
						grid2Html += '<td class="ellipsis">'+ part_status_nm + '</td>';
						grid2Html += '<td>'+ pop_position_nm + '</td>';
						grid2Html += '</tr>';

					$("#grid2").append(grid2Html);
					if((i+1) == 5){
						break;
					}
				}
				$("#grid2_total").html("(total: " + totalCount + ")");
			}  else {
				for (let i = 0; i < 5; i++) {
					let grid2Html = '<tr><td colspan="8"></td></tr>';
					$("#grid2").append(grid2Html);
				}
				$("#grid2_total").html("(total: 0)");
			}
		};

		let createGrid3 = function(grid_list3){
			$("#grid3").empty();
			if (grid_list3 != '') {
				let totalCount = 0;
				for (let i = 0; i < grid_list3.length; i++) {

					totalCount = grid_list3[i].TOTAL_COUNT;
					let inner_due_dt = grid_list3[i].INNER_DUE_DT == undefined ? "" : grid_list3[i].INNER_DUE_DT;
					let order_comp_nm = grid_list3[i].ORDER_COMP_NM == undefined ? "" : grid_list3[i].ORDER_COMP_NM;
					let control_part_info = grid_list3[i].CONTROL_PART_INFO == undefined ? "" : grid_list3[i].CONTROL_PART_INFO;
					let control_part_qty_info = grid_list3[i].CONTROL_PART_QTY_INFO == undefined ? "" : grid_list3[i].CONTROL_PART_QTY_INFO;
					let part_status_nm = grid_list3[i].PART_STATUS_NM == undefined ? "" : grid_list3[i].PART_STATUS_NM;
					let charge_user_nm = grid_list3[i].CHARGE_USER_NM == undefined ? "" : grid_list3[i].CHARGE_USER_NM;

					let grid3Html = '<tr>';
						grid3Html += '<td>' + (i+1) +'</td>';
						grid3Html += '<td class="txtR bold">'+ inner_due_dt + '</td>';
						grid3Html += '<td class="alignLeft ellipsis">'+ order_comp_nm + '</td>';
						grid3Html += '<td class="alignLeft ellipsis">'+ control_part_info + '</td>';
						grid3Html += '<td>'+ control_part_qty_info + '</td>';
						grid3Html += '<td>'+ part_status_nm + '</td>';
						grid3Html += '<td>'+ charge_user_nm + '</td>';
						grid3Html += '</tr>';
					$("#grid3").append(grid3Html);
					if((i+1) == 5){
						break;
					}
				}
				$("#grid3_total").html("(total: " + totalCount + ")");
			} else {
				for (let i = 0; i < 5; i++) {
					let grid3Html = '<tr><td colspan="8"></td></tr>';
					$("#grid3").append(grid3Html);
				}
				$("#grid3_total").html("(total: 0)");
			}
		};

		/** 작업자 로그인 정보 실시간 처리 **/
		let workerMessageProcess = function(messageData){
			if(messageData){
				let actionType = messageData.actionType;
				let $target = $("#" + messageData.factoryArea + "_" + messageData.equipRow + "_" + messageData.equipCol);
				if(actionType === 'WK_LOGIN') {
					$target.find(".inBox:nth-child(2)").html(messageData.userNm);
				}else{
					$target.find(".inBox:nth-child(2)").html('&nbsp;');
				}
			}
		};
		let iConnectCount = 0;
		function jmesConnect() {
		    let socket = new SockJS('/jmes-ws');
		    stompClient = Stomp.over(socket);
			stompClient.connect({}, (frame) => {
				stompClient.subscribe('/topic/drawing', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					getReLoadDrawingData(messageData.equipSeq, messageData.factoryArea, messageData.equipRow, messageData.equipCol);
				});
				stompClient.subscribe('/topic/worker', function (notificationMessage) {
					let messageData = JSON.parse(notificationMessage.body);
					workerMessageProcess(messageData);
				});
		    }, () => {
			  	setTimeout(() => {
					if(iConnectCount == 6) {
						fnConfirm(null, "시스템에 문제가 발생하였습니다. 60초 후 페이지 새로고침 됩니다.");
						return;
					}else if(iConnectCount <= 5){
						jmesConnect();
					}
					iConnectCount++
			  	}, 5000);
			});
		}

		let setGridSchedulerIntervalTimer;
		let gridSchedulerTimer = function(){
			// let selVal = 60;//1분
			let selVal = 5;// 분
			let timesec = 60000;//60초
			setGridSchedulerIntervalTimer = setInterval(function() {
				getReLoadTableData();
			}, timesec*selVal);
		};

		let setWorkSchedulerIntervalTimer;
		let workSchedulerTimer = function(){
			let selVal = 1;// 분
			let timesec = 60000;//60초
			setWorkSchedulerIntervalTimer = setInterval(function() {
				getReLoadWorkData('scheduler');
			}, timesec*selVal);
		};

		getInitData();
		jmesConnect();
		gridSchedulerTimer();
		workSchedulerTimer();
	});
</script>
</body>
</html>