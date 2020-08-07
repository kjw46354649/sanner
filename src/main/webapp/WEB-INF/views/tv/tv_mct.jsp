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
    <script type="text/javascript" src="/resource/asset/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resource/asset/js/jquery.easing.1.3.js"></script>
</head>
<body>
	<div class="bodyWrap mct">
		<div class="header">
			<div class="left"><h1>MCT 가동 및 주요 현황</h1><a href="/tv/mct" class="refresh">refresh</a></div>
			<div class="right">
				<div class="infoTit">MCT 가동률</div>
				<div class="infoContsWrap">
					<div class="infoCont">
						<span>현재</span>
						<span class="txtB">82%</span>
					</div>
					<div class="infoCont">
						<span>3일간 평균</span>
						<span class="txtR">68%</span>
					</div>
					<div class="infoCont">
						<span>2月 평균</span>
						<span>72%</span>
					</div>
				</div>
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
														<div class="inWrap on">
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
									<div class="percentWrap">
										<span class="txtB">82%</span>
										<span class="txtR">68%</span>
										<span>72%</span>
									</div>
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
										<ul class="p_row"  id="ARE02_2_1" style="padding:21px 20px 0;">
											<li class="p_col">
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
									<div class="percentWrap">
										<span class="txtB">82%</span>
										<span class="txtR">68%</span>
										<span>72%</span>
									</div>
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
									<div class="percentWrap">
										<span class="txtB">82%</span>
										<span class="txtR">68%</span>
										<span>72%</span>
									</div>
								</div>
							</li>
							<li class="twoDepthIB pro16">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">2공장MCT</a></li>
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
									<div class="percentWrap">
										<span class="txtB">82%</span>
										<span class="txtR">68%</span>
										<span>72%</span>
									</div>
								</div>
							</li>
							<li class="twoDepthIB pro30">
								<div class="conWrap2">
									<div class="tabmenu">
										<ul>
											<li><a href="#a;">3공장MCT</a></li>
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
									<div class="percentWrap">
										<span class="txtB">82%</span>
										<span class="txtR">68%</span>
										<span>72%</span>
									</div>
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
											<div class="tblTit"><span>불량/반품</span> 발생 현황 (3일간)</div>
											<div class="tblDate">2020/1/29 ~ 1/31</div>
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
														<th>유형</th>
														<th>수량</th>
														<th>납기</th>
														<th>불량코드</th>
														<th>조치</th>
													</tr>
												</thead>
												<tbody id="grid1">
													<tr>
														<td>1</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-01-02</td>
														<td class="txtR">불량</td>
														<td class="txtR">4ea</td>
														<td>1/31</td>
														<td>01. 치수불량</td>
														<td>수정</td>
													</tr>
													<tr>
														<td>2</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-012</td>
														<td class="txtR">불량</td>
														<td class="txtR">4ea</td>
														<td>1/31</td>
														<td>01. 치수불량</td>
														<td>재가공</td>
													</tr>
													<tr>
														<td>3</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-0123</td>
														<td class="txtR">불량</td>
														<td class="txtR">4ea</td>
														<td>1/31</td>
														<td>01. 치수불량</td>
														<td>재가공</td>
													</tr>
													<tr>
														<td>4</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td class="txtR">불량</td>
														<td class="txtR">4ea</td>
														<td>1/31</td>
														<td>01. 치수불량</td>
														<td>재가공</td>
													</tr>						<tr>
														<td colspan="9"><div class="nodata"></div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="statusTblBox w1100">
										<div class="tblTitWrap">
											<div class="tblTit ty2"><span>긴급</span>주문 진행현황</div>
											<div class="tblDate">2020/1/29 ~ 1/31</div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 납기, 출고일, 발주처, 관리번호, 수량, 진행상태로 구분된 긴급주문 진행현황</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
													<col width="95px">
													<col width="115px">
													<col width="219px">
													<col width="74px">
													<col width="138px">
												</colgroup>
												<thead>
													<tr>
														<th>No</th>
														<th>납기</th>
														<th>출고일</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>수량</th>
														<th>진행상태</th>
													</tr>
												</thead>
												<tbody id="grid2">
													<tr>
														<td>1</td>
														<td class="txtR bold">4/16</td>
														<td></td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>후가공입고</td>
													</tr>
													<tr>
														<td>2</td>
														<td class="txtR bold">4/16</td>
														<td></td>
														<td>ANI</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>출고완료</td>
													</tr>
													<tr>
														<td>3</td>
														<td class="txtR bold">4/16</td>
														<td></td>
														<td>ANI</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>출고완료</td>
													</tr>
													<tr>
														<td>4</td>
														<td>4/16</td>
														<td class="txtR">1/31</td>
														<td>ANI</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>출고완료</td>
													</tr>
													<tr>
														<td>5</td>
														<td>4/16</td>
														<td class="txtR">1/31</td>
														<td>ANI</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>출고완료</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="statusTblBox w1150">
										<div class="tblTitWrap">
											<div class="tblTit ty3">납기 <span>지연</span> 목록 (3일간)</div>
											<div class="tblDate">2020/1/29 ~ 1/31</div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 납기, 출고일, 발주처, 관리번호, 수량, 진행상태, 담당영업으로 구분된 납기 지연 목록 (3일간)</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
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
														<th>납기</th>
														<th>출고일</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>수량</th>
														<th>진행상태</th>
														<th>담당영업</th>
													</tr>
												</thead>
												<tbody id="grid3">
													<tr>
														<td>1</td>
														<td class="txtR bold">4/16</td>
														<td></td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>후가공입고</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>2</td>
														<td>4/16</td>
														<td class="txtR">1/30</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>후가공입고</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>3</td>
														<td>4/16</td>
														<td class="txtR">1/30</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>후가공입고</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>4</td>
														<td>4/16</td>
														<td class="txtR">1/30</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>후가공입고</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td><div class="nodata"></div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="statusTblBox" style="display: none;">
										<div class="tblTitWrap">
											<div class="tblTit ty4">납기 <span>지연 위험</span> List</div>
											<div class="tblDate">2020/1/29 ~ 1/31</div>
										</div>
										<div class="tblWrap">
											<table>
												<caption>No, 납기, 발주처, 관리번호, 수량, 진행상태, 담당영업으로 구분된 납기 지연 위험 List</caption>
												<colgroup>
													<col width="64px">
													<col width="95px">
													<col width="95px">
													<col width="219px">
													<col width="74px">
													<col width="138px">
													<col width="100px">
												</colgroup>
												<thead>
													<tr>
														<th>No</th>
														<th>납기</th>
														<th>발주처</th>
														<th>관리번호</th>
														<th>수량</th>
														<th>진행상태</th>
														<th>담당영업</th>
													</tr>
												</thead>
												<tbody id="grid4">
													<tr>
														<td>1</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>소재주문완료</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>2</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-0704-01#2</td>
														<td>4ea</td>
														<td>소재주문완료</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>3</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-07</td>
														<td>4ea</td>
														<td>검사대기</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td>4</td>
														<td>4/16</td>
														<td>제이스텍</td>
														<td class="alignLeft">C19-625-07</td>
														<td>4ea</td>
														<td>검사대기</td>
														<td>김동근</td>
													</tr>
													<tr>
														<td><div class="nodata"></div></td>
													</tr>
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
	$(function () {
			let getData = function () {
				'use strict';

				$.ajax({
					type: 'POST', url: "/tv/mct/data", dataType: 'json',
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

						let mct_info_list = data.mct_info_list;//mct info
						let mct_list = data.mct_list;//mct
						let grid_list1 = data.grid_list1;//불량/반품
						let grid_list2 = data.grid_list2;//긴급주문
						let grid_list3 = data.grid_list3;//납기지연목록
						let grid_list4 = data.grid_list4;//납기지연위협
						let mct_info = data.mct_info;//mct 가동률 및 기타

						//init
						$('[id^=ARE]').each(function () {
							$(this).find(".inBox:nth-child(1)").html('&nbsp;');
							$(this).find(".inBox:nth-child(2)").html('&nbsp;');
							$(this).find(".inBox:nth-child(3)").find('div:nth-child(1)').html('&nbsp;');
							$(this).find(".inBox:nth-child(3)").find('div:nth-child(2)').html('&nbsp;');

							$(this).find(".statusWrap").hide();
							//$(this).find(".statusConts").find('.inWrap').empty();
							$(this).find(".statusConts").empty();

						});
						$("#grid1").empty();
						$("#grid2").empty();
						$("#grid3").empty();
						$("#grid4").empty();

						//mct info
						if (mct_info_list != '') {
							for (let i = 0; i < mct_info_list.length; i++) {
								//let equip_seq = mct_info_list[i].EQUIP_SEQ;
								let equip_nm = mct_info_list[i].EQUIP_NM;
								let factory_area = mct_info_list[i].FACTORY_AREA;
								let layout_row = mct_info_list[i].LAYOUT_ROW;
								let layout_col = mct_info_list[i].LAYOUT_COL;

								//$("#" + factory_area + "_" + layout_row + "_" + layout_col).attr("data-target",equip_seq);
								$("#" + factory_area + "_" + layout_row + "_" + layout_col).find(".statusWrap").show();
								$("#" + factory_area + "_" + layout_row + "_" + layout_col).find(".inBox:nth-child(1)").html(equip_nm);

							}
						}
						if (mct_list != '') {
							for (let i = 0; i < mct_list.length; i++) {
								//let EQUIP_SEQ = mct_list[i].EQUIP_SEQ;
								let factory_area = mct_list[i].FACTORY_AREA;
								let layout_row = mct_list[i].LAYOUT_ROW;
								let layout_col = mct_list[i].LAYOUT_COL;
								let user_nm = mct_list[i].USER_NM;
								let total_cnt_info = mct_list[i].TOTAL_CNT_INFO;
								let total_part_qty_info = mct_list[i].TOTAL_PART_QTY_INFO;
								let total_plan_working_time_info = mct_list[i].TOTAL_PLAN_WORKING_TIME_INFO;//여기까지 상단

								let work_plan_type = ( mct_list[i].WORK_PLAN_TYPE != undefined ) ? mct_list[i].WORK_PLAN_TYPE : '' ;//1:작동중, 나머지:계획
								let inner_due_dt = ( mct_list[i].INNER_DUE_DT != undefined ) ? mct_list[i].INNER_DUE_DT : '' ;
								let work_type_nm = ( mct_list[i].WORK_TYPE_NM != undefined ) ? mct_list[i].WORK_TYPE_NM : '' ;
								let control_part_info = ( mct_list[i].CONTROL_PART_INFO != undefined ) ? mct_list[i].CONTROL_PART_INFO : '' ;
								let size_txt = ( mct_list[i].SIZE_TXT != undefined ) ? mct_list[i].SIZE_TXT : '' ;
								let material_detail_nm =( mct_list[i].MATERIAL_DETAIL_NM != undefined ) ? mct_list[i].MATERIAL_DETAIL_NM : '' ;
								let part_qty = ( mct_list[i].PART_QTY != undefined ) ? mct_list[i].PART_QTY : '' ;
								let working_time_info = ( mct_list[i].WORKING_TIME_INFO != undefined ) ? mct_list[i].WORKING_TIME_INFO : '' ;
								let plan_working_time_info =( mct_list[i].PLAN_WORKING_TIME_INFO != undefined ) ? mct_list[i].PLAN_WORKING_TIME_INFO : '' ;

								let $target = $("#" + factory_area + "_" + layout_row + "_" + layout_col);

								$target.find(".inBox:nth-child(2)").html(user_nm);
								$target.find(".inBox:nth-child(3)").find('div:nth-child(1)').html(total_cnt_info + '&nbsp;' + total_part_qty_info);
								$target.find(".inBox:nth-child(3)").find('div:nth-child(2)').html(total_plan_working_time_info);

							let divHtml = '<div class="inWrap">';
								divHtml += '<a href="#a;">';
								divHtml += '	<span>'+inner_due_dt+'<br>'+work_type_nm+'</span>';
								divHtml += '	<span><span class="txtB ellipsis" style="font-size: 17px;">'+control_part_info+'</span><br>'+size_txt+'&nbsp;&nbsp;'+material_detail_nm+'</span>';
								divHtml += '	<span>'+part_qty+'</span>';
								/*divHtml += '	<span><span class="txtR">'+working_time_info+'</span><br><span class="txtB ty2">'+plan_working_time_info+'</span></span>';*/
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

						if (grid_list1 != '') {
							for (let i = 0; i < grid_list1.length; i++) {
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
						} else {
							for (let i = 0; i < 5; i++) {
								let grid1Html = '<tr><td colspan="8"></td></tr>';
								$("#grid1").append(grid1Html);
							}
						}

						if (grid_list2 != '') {
							for (let i = 0; i < grid_list2.length; i++) {
								let inner_due_dt = grid_list2[i].INNER_DUE_DT == undefined ? "" : grid_list2[i].INNER_DUE_DT;
								let out_finish_dt = grid_list2[i].OUT_FINISH_DT == undefined ? "" : grid_list2[i].OUT_FINISH_DT;
								let order_comp_nm = grid_list2[i].ORDER_COMP_NM == undefined ? "" : grid_list2[i].ORDER_COMP_NM;
								let control_part_info = grid_list2[i].CONTROL_PART_INFO == undefined ? "" : grid_list2[i].CONTROL_PART_INFO;
								let control_part_qty = grid_list2[i].CONTROL_PART_QTY == undefined ? "" : grid_list2[i].CONTROL_PART_QTY;
								let control_part_qty_info = grid_list2[i].CONTROL_PART_QTY_INFO == undefined ? "" : grid_list2[i].CONTROL_PART_QTY_INFO;
								let part_status_nm = grid_list2[i].PART_STATUS_NM == undefined ? "" : grid_list2[i].PART_STATUS_NM;

								let grid2Html = '<tr>';
									grid2Html += '<td>' + (i+1) +'</td>';
									grid2Html += '<td class="txtR bold">'+ inner_due_dt + '</td>';
									grid2Html += '<td>'+ out_finish_dt + '</td>';
									grid2Html += '<td class="alignLeft ellipsis">'+ order_comp_nm + '</td>';
									grid2Html += '<td class="alignLeft ellipsis">'+ control_part_info + '</td>';
									grid2Html += '<td>'+ control_part_qty_info + '</td>';
									grid2Html += '<td class="ellipsis">'+ part_status_nm + '</td>';
									grid2Html += '</tr>';

								$("#grid2").append(grid2Html);
								if((i+1) == 5){
									break;
								}

							}
						}  else {
							for (let i = 0; i < 5; i++) {
								let grid2Html = '<tr><td colspan="8"></td></tr>';
								$("#grid2").append(grid2Html);
							}
						}

						if (grid_list3 != '') {
							for (let i = 0; i < grid_list3.length; i++) {
								let inner_due_dt = grid_list3[i].INNER_DUE_DT == undefined ? "" : grid_list3[i].INNER_DUE_DT;
								let out_finish_dt = grid_list3[i].OUT_FINISH_DT == undefined ? "" : grid_list3[i].OUT_FINISH_DT;
								let order_comp_nm = grid_list3[i].ORDER_COMP_NM == undefined ? "" : grid_list3[i].ORDER_COMP_NM;
								let control_part_info = grid_list3[i].CONTROL_PART_INFO == undefined ? "" : grid_list3[i].CONTROL_PART_INFO;
								let control_part_qty_info = grid_list3[i].CONTROL_PART_QTY_INFO == undefined ? "" : grid_list3[i].CONTROL_PART_QTY_INFO;
								let part_status_nm = grid_list3[i].PART_STATUS_NM == undefined ? "" : grid_list3[i].PART_STATUS_NM;
								let charge_user_nm = grid_list3[i].CHARGE_USER_NM == undefined ? "" : grid_list3[i].CHARGE_USER_NM;


								let grid3Html = '<tr>';
									grid3Html += '<td>' + (i+1) +'</td>';
									grid3Html += '<td class="txtR bold">'+ inner_due_dt + '</td>';
									grid3Html += '<td>'+ out_finish_dt + '</td>';
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
						} else {
							for (let i = 0; i < 5; i++) {
								let grid3Html = '<tr><td colspan="8"></td></tr>';
								$("#grid3").append(grid3Html);
							}
						}

						if (grid_list4 != '') {
							for (let i = 0; i < grid_list4.length; i++) {
								let inner_due_dt = grid_list4[i].INNER_DUE_DT == undefined ? "" : grid_list4[i].INNER_DUE_DT;
								let out_finish_dt = grid_list4[i].OUT_FINISH_DT == undefined ? "" : grid_list4[i].OUT_FINISH_DT;
								let order_comp_nm = grid_list4[i].ORDER_COMP_NM == undefined ? "" : grid_list4[i].ORDER_COMP_NM;
								let control_part_info = grid_list4[i].CONTROL_PART_INFO == undefined ? "" : grid_list4[i].CONTROL_PART_INFO;
								let control_part_qty_info = grid_list4[i].CONTROL_PART_QTY_INFO == undefined ? "" : grid_list4[i].CONTROL_PART_QTY_INFO;
								let part_status_nm = grid_list4[i].PART_STATUS_NM == undefined ? "" : grid_list4[i].PART_STATUS_NM;
								let charge_user_nm = grid_list4[i].CHARGE_USER_NM == undefined ? "" : grid_list4[i].CHARGE_USER_NM;


								let grid4Html = '<tr>';
								grid4Html += '<td>' + (i+1) +'</td>';
								grid4Html += '<td class="txtR bold">'+ inner_due_dt + '</td>';
								grid4Html += '<td>'+ out_finish_dt + '</td>';
								grid4Html += '<td class="alignLeft ellipsis">'+ order_comp_nm + '</td>';
								grid4Html += '<td class="alignLeft ellipsis">'+ control_part_info + '</td>';
								grid4Html += '<td>'+ control_part_qty_info + '</td>';
								grid4Html += '<td>'+ part_status_nm + '</td>';
								grid4Html += '<td>'+ charge_user_nm + '</td>';
								grid4Html += '</tr>';

								$("#grid4").append(grid4Html);
								if((i+1) == 5){
									break;
								}

							}
						} else {
							for (let i = 0; i < 5; i++) {
								let grid4Html = '<tr><td colspan="8"></td></tr>';
								$("#grid4").append(grid4Html);
							}
						}



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
						$("#" + popPosition).append("<li class=\"ellipsis\">" + liInfo + "</li>jung67");
					}
					$("#CNT_" + popPosition).html(totalCnt);
				}
			};


			let setIntervalTimer;
			let timer = function(){
				let selVal = 60;//1분
				let timesec = 1000;//1초
				setIntervalTimer = setInterval(function() {
					getData();
				}, timesec*selVal);
			};

			getData();
			timer();

			$(document).on('click', 'a[href="#a;"]', function(e){
				e.preventDefault();
			});

		Date.prototype.format = function (f) {
			if (!this.valueOf()) return ' ';

			let d = this;

			return f.replace(/(Y|c|e)/gi, function ($1) {
				switch ($1) {
					case 'Y':
						return d.getFullYear(); // Year with 4 digits.
					case "c":
						return d.getMonth() + 1; // Month with 1 or 2 digits.
					case "e":
						return d.getDate(); // Day with 1 or 2 digits.
					default:
						return $1;
				}
			});
		};

		const TODAY = new Date();
		const TWO_DAYS_LATER = new Date(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate() + 2);

		$('.tblDate').html(TODAY.format('Y/c/e') + '~' + TWO_DAYS_LATER.format('c/e'));
	});
</script>
</body>
</html>