<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
			<div class="page main">
				<div>
					<button type="button" class="defaultBtn radius">기본버튼</button>
					<button type="button" class="defaultBtn radius black">기본버튼</button>
					<button type="button" class="defaultBtn radius blue">기본버튼</button>
					<button type="button" class="defaultBtn radius red">기본버튼</button>
					<button type="button" class="defaultBtn radius orange">기본버튼</button>
					<button type="button" class="defaultBtn radius green">기본버튼</button>
					<button type="button" class="defaultBtn radius yellow">기본버튼</button>
					<button type="button" class="defaultBtn radius purple">기본버튼</button>
					<br /><br />
					<button type="button" class="smallBtn">작은버튼</button>
					<button type="button" class="smallBtn blue">작은버튼</button>
					<button type="button" class="smallBtn black">작은버튼</button>
					<button type="button" class="smallBtn sky">작은버튼</button>
					<button type="button" class="smallBtn red">작은버튼</button>
					<button type="button" class="smallBtn orange">작은버튼</button>
					<button type="button" class="smallBtn green">작은버튼</button>
					<button type="button" class="smallBtn yellow">작은버튼</button>
					<button type="button" class="smallBtn purple">작은버튼</button>
					<br /><br />
					<button type="button" class="defaultBtn yelllowGra">노랑그림자버튼</button>
					<button type="button" class="defaultBtn blueGra">파랑그림자버튼</button>
					<button type="button" class="defaultBtn blackGra">검정그림자버튼</button>
					<button type="button" class="defaultBtn redGra">빨강색그림자버튼</button>
					<button type="button" class="defaultBtn orangeGra">주황그림자색버튼</button>
					<button type="button" class="defaultBtn greenGra">녹색그림자버튼</button>
					<button type="button" class="defaultBtn purpleGra">보라색그림자버튼</button>

					<br /><br />
					<button type="button" class="defaultBtn">텍스트길이만큼 넓어지는</button>
					<button type="button" class="defaultBtn wd_50">넓이50</button>
					<button type="button" class="defaultBtn wd_100">넓이100</button>
					<button type="button" class="defaultBtn wd_150">넓이150</button>
					<button type="button" class="defaultBtn wd_200">넓이200</button>
					<button type="button" class="defaultBtn wd_250">넓이250</button>
					<button type="button" class="defaultBtn wd_300">넓이300</button>
					<button type="button" class="defaultBtn wd_350">넓이350</button>
					<button type="button" class="defaultBtn wd_400">넓이400</button>
					<button type="button" class="defaultBtn wd_450">넓이450</button>
					<button type="button" class="defaultBtn wd_500">넓이500</button>
					<br /><br />
					<button type="button" class="defaultBtn">기본</button>
					<button type="button" class="defaultBtn hg_10">높이10</button>
					<button type="button" class="defaultBtn hg_15">높이15</button>
					<button type="button" class="defaultBtn hg_20">높이20</button>
					<button type="button" class="defaultBtn hg_25">높이25</button>
					<button type="button" class="defaultBtn hg_30">높이30</button>
					<button type="button" class="defaultBtn hg_35">높이35</button>
					<button type="button" class="defaultBtn hg_40">높이40</button>
					<button type="button" class="defaultBtn hg_45">높이45</button>
					<button type="button" class="defaultBtn hg_50">높이50</button>
					<button type="button" class="defaultBtn hg_55">높이55</button>

					<br /><br />
					<button type="button" class="graBtn add">추가버튼</button>
					<button type="button" class="graBtn save">저장버튼</button>
					<br /><br />
					<button type="button" class="gradeBtn  white">흰색버튼</button>
					<button type="button" class="gradeBtn  yellow">노랑버튼</button>
					<button type="button" class="gradeBtn  red">빨강버튼</button>
					<button type="button" class="gradeBtn  blue">블루버튼</button>
					<button type="button" class="gradeBtn  green">녹색버튼</button>
					<button type="button" class="gradeBtn  purple">보라버튼</button>
					<button type="button" class="gradeBtn">기본버튼</button>
					<br /><br />
					<button type="button" class="submit">submit</button>
					<button type="button" class="cancel">cancel</button>
					<button type="button" class="icon_btn search">찾기</button>
					<button type="button" class="icon_btn search black">찾기</button>
					<button type="button" class="icon_btn search_eng">search</button>
					<button type="button" class="icon_btn search_eng black">search</button>
					<button type="button" class="icon_btn print">Print</button>
					<button type="button" class="icon_btn black clear">Clear</button>
					<button type="button" class="icon_btn excel">Excel</button>
					<br /><br />
					<span class="slt_wrap">
						<label for="projectSltd">사업자구분</label>
						<select id="projectSltd" name="projectSltd" title="사업자구분">
							<option value="" selected="selected">-ALL-</option>
							<option value="1">-ALL-</option>
							<option value="2">-ALL-</option>
						</select>
					</span>
					<span class="gubun"></span>
					<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호"></span>
					<span class="gubun"></span>
					<span class="chk_box"><input id="pr_ex1" type="checkbox"><label for="pr_ex1"> 발송완료</label></span>
					<span class="gubun"></span>
					<span class="radio_box">
						<input reqcd="R" type="radio" id="fr_1001_1" name=""><label for="fr_1001_1">오늘</label>
					</span>
					<span class="gubun"></span>
					<div class="calendar_wrap">
						<span class="calendar_span">
							<input type="text" name="dateOneIp" id="dateOneIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
						</span>
						<span class="nbsp">~</span>
						<span class="calendar_span">
							<input type="text" name="dateTwoIp" id="dateTwoIp" placeholder="" value="" title="달력정보"><button type="button">달력선택</button>
						</span>
					</div>
					<span class="slt_wrap namePlusSlt ml-25">
						<label for="prSltd">견적서 추출</label>
						<select id="prSltd" name="prSltd" title="견적서 추출">
							<option value="" selected="selected">견적서 추출1</option>
							<option value="1">견적서 추출2</option>
							<option value="2">견적서 추출3</option>
						</select>
					</span>
					<br /><br />
					<span class="txt_span bold">좌측정렬</span>
					<div class="left_sort">
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_100"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_150"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_200"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_250"></span>
					</div>
					<br /><br />
					<span class="txt_span bold">센터정렬</span>
					<div class="center_sort">
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_100"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_150"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_200"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_250"></span>
					</div>
					<br /><br />
					<span class="txt_span bold">우측정렬</span>
					<div class="right_sort">
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_100"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_150"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_200"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_250"></span>
					</div>
					<br /><br />
					<div class="txt_span bold" style="text-align: center;">좌우정렬</div>
					<div class="left_float">
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_100"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_150"></span>
					</div>
					<div class="right_float">
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_200"></span>
						<span class="gubun"></span>
						<span class="ipu_wrap"><label for="priceSltd">견적번호</label><input type="text" name="priceSltd" id="priceSltd" placeholder="" value="" title="견적번호" class="wd_250"></span>
					</div>
					<div class="nofloat pd-top20">
						<span class="txt_span bold">텝메뉴</span>
						<ul class="tabMenu">
							<li class="on"><a href="#a;">견적관리</a><button type="button" class="closeBtn">닫기</button></li>
							<li><a href="#a;">견적서작성</a><button type="button" class="closeBtn">닫기</button></li>
							<li><a href="#a;">견적 표준 계산 관리</a><button type="button" class="closeBtn">닫기</button></li>
						</ul>
						<br /><br />
						<ul class="smallTabMenu">
							<li class="on"><a href="#a;">견적관리</a></li>
							<li><a href="#a;">견적서작성</a></li>
							<li><a href="#a;">견적 표준 계산 관리</a></li>
						</ul>
					</div>
					<br />
					<span class="txt_span bold  mt-20">테이블</span>
					<table class="boardList">
						<caption>집계기간, 전체 검사현황(양품, 불량), 1공장(양품, 불량), 2공장(양품, 불량), 3공장(양품, 불량), 출고, 반품으로 구분된 신규 발주 현황</caption>
						<colgroup>
							<col width="">
						</colgroup>
						<thead>
							<tr>
								<th rowspan="2" class="bg1">집계기간</th>
								<th colspan="2" class="bg2">전체 검사현황</th>
								<th colspan="2">1공장</th>
								<th colspan="2">2공장</th>
								<th colspan="2">3공장</th>
								<th rowspan="2" class="bg1">출고</th>
								<th rowspan="2" class="bg1">반품</th>
							</tr>
							<tr>
								<th class="bg2">양품</th>
								<th class="bg2">불량</th>
								<th>양품</th>
								<th>불량</th>
								<th>양품</th>
								<th>불량</th>
								<th>양품</th>
								<th>불량</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="txtB bg3">12.8日</td>
								<td class="txtB">70 (102)</td>
								<td class="txtR">3 (31)</td>
								<td class="txtB">15 (21)</td>
								<td class="txtR">1 (20)</td>
								<td class="txtB">15 (21)</td>
								<td></td>
								<td class="txtB">15 (21)</td>
								<td class="txtR">2 (11)</td>
								<td class="txtB">15 (21)</td>
								<td></td>
							</tr>
							<tr>
								<td class="bg3">12.7日</td>
								<td>98 (864)</td>
								<td></td>
								<td>23 (11)</td>
								<td></td>
								<td>23 (11)</td>
								<td></td>
								<td>23 (11)</td>
								<td></td>
								<td>23 (11)</td>
								<td class="txtR">2 (11)</td>
							</tr>
							<tr>
								<td class="bg3">12.6日</td>
								<td>21 (122)</td>
								<td class="txtR">1 (3)</td>
								<td>23 (22)</td>
								<td></td>
								<td>23 (22)</td>
								<td class="txtR">1 (3)</td>
								<td>23 (22)</td>
								<td></td>
								<td>23 (22)</td>
								<td></td>
							</tr>
							<tr>
								<td class="bg3">월간누적</td>
								<td>98 (864)</td>
								<td class="txtR">1 (3)</td>
								<td>23 (22)</td>
								<td></td>
								<td>23 (22)</td>
								<td class="txtR">1 (3)</td>
								<td>23 (22)</td>
								<td class="txtR">2 (11)</td>
								<td>23 (22)</td>
								<td class="txtR">2 (11)</td>
							</tr>
							<tr>
								<td class="bg3">전월실적</td>
								<td>98 (864)</td>
								<td class="txtR">1 (3)</td>
								<td>98 (864)</td>
								<td></td>
								<td>98 (864)</td>
								<td class="txtR">1 (3)</td>
								<td>98 (864)</td>
								<td></td>
								<td>98 (864)</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<table class="rowStyle mt-20">
						<caption></caption>
						<tr>
							<th scope="row">업체</th>
							<td>신진철강</td>
							<td>하나알루</td>
						</tr>
						<tr>
							<th scope="row">담당자</th>
							<td>홍길동(abc@naver.com)</td>
							<td>알길동(def@google.com)</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<span>SM45C 70*20*15 4EA</span>
								<span>SM45C 70*20*15 4EA</span>
								<span>SM45C 70*20*15 4EA</span>
							</td>
							<td><span>SM45C 70*20*15 4EA</span></td>
						</tr>
					</table>
					<table class="colStyle mt-20">
						<caption></caption>
						<tr>
							<th scope="col" class="t_w1"><input id="pr_ex" type="checkbox"></th>
							<th scope="col" class="txt">파일명</th>
							<th scope="col">업로드상태</th>
							<th scope="col">용량</th>
							<th scope="col">첨부방식</th>
						</tr>
						<tr>
							<td class="t_w1"><input id="pr_ex" type="checkbox"></td>
							<td class="txt"><div class="ellipsis">RFQ-JAS-201908030_4세대 인라인 조립기 검사기-1.XLSX</div></td>
							<td>업로드중..</td>
							<td>1,300kb</td>
							<td>업로드</td>
						</tr>
						<tr>
							<td class="t_w1"><input id="pr_ex" type="checkbox"></td>
							<td class="txt"><div class="ellipsis">RFQ-JAS-201908030_4세대 인라인 조립기 검사기-1.XLSX</div></td>
							<td>업로드중..</td>
							<td>1,300kb</td>
							<td>업로드</td>
						</tr>
					</table>
				</div>
			</div>