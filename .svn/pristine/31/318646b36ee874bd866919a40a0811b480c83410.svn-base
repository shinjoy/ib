<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
			<table class="t_skinR00">
				<colgroup>
					<col width="78">
					<col width="57">
					<col width="57">
					<col width="90">
					<col width="134">
					<col width="57">
					<col width="90">
					<col width="134">
					<col width="90">
					<col width="*">
					<!-- <col width="84"> -->					
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2" onclick="sortTable();" class="hand bgYlw">일자<br/>▼</th>
						<th rowspan="2" onclick="sortTable(1);" class="hand bgYlw">입력자<br/>▼</th>
						<th colspan="3" class="bgGrn">인물 I</th>
						<th colspan="3" class="bgPich">인물 II</th>
						<th rowspan="2" onclick="sortTable(7);" class="hand bgYlw"><small>인물I - 인물II</small><br/>친밀도<br/>▼</th>
						<th rowspan="2" class="bgYlw">내용</th>
						<!-- <th rowspan="2" onclick="sortTable(6);" class="hand bgYlw"><small>입력자 - 인물I</small><br/>친밀도<br/>▼</th> -->						
					</tr>
					<tr>
						<th onclick="sortTable(2);" class="hand bgGrn pd0">이름<br/>▼</th>
						<th class="bgGrn">직책</th>
						<th onclick="sortTable(3);" class="hand bgGrn pd0">회사<br/>▼</th>						
						<th onclick="sortTable(4);" class="hand bgPich pd0">이름<br/>▼</th>
						<th class="bgPich">직책</th>
						<th onclick="sortTable(5);" class="hand bgPich pd0">회사<br/>▼</th>						
					</tr>
					<tr style="height:1px;"></tr>
				</thead>
			</table>
		</div>
		<div style="padding-top:100px;">
			<table class="t_skinR00">
				<colgroup>
					<col width="78">
					<col width="57">
					<col width="57">
					<col width="90">
					<col width="134">
					<col width="57">
					<col width="90">
					<col width="134">
					<col width="90">
					<col width="*">
					<!-- <col width="84"> -->					
				</colgroup>
				<tbody>
					<c:forEach var="financ" items="${financingList}" varStatus="financStatus">
					<tr <c:if test="${financ.tmpNum1 == 2}">style="background-color:ivory;"</c:if>>
						<input type="hidden" id="snb${financStatus.count}" value="${financ.sNb }"/>
						
						<td class="cent"><nobr>${financ.tmDt}</nobr></td>
						<td class="cent">${financ.rgNm}</td>
						<td class="cent bold navy hov hand" onclick="popUp('','rcmdCst','',${financ.snb1st});">${financ.cstNm1st}</td>
						<td class="navy">${financ.position1st}</td>
						<td class="bold navy">${financ.cpnNm1st}</td>
						<td class="cent bold red hov hand" onclick="popUp('','rcmdCst','',${financ.snb2nd});">${financ.cstNm2nd}</td>
						<td class="red">${financ.position2nd}</td>
						<td class="bold red">${financ.cpnNm2nd}</td>
						<td class="cent">
							<table class="t pd0"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5">
								<td class="tabImportant <c:if test="${financ.lvCd>=L5.count}">bgLightGray</c:if>" title="${L5.count}" onclick="javascript:selectLevelCD('${L5.count}','${financ.sNb}','modifyRec',<c:if test="${financ.tmpNum1 == 1}">'2'</c:if><c:if test="${financ.tmpNum1 == 2}">'4'</c:if>)"></td>
							</c:forEach></tr></table>
						</td>
						<td class="">${financ.note}</td>
						<%-- <td class="cent">
							<table class="t pd0"><tr><c:forEach var="loop5" varStatus="L5" begin="1" end="5">
								<td class="tabImportant <c:if test="${financ.importance>=L5.count}">bgLightGray</c:if>" title="${L5.count}" onclick="javascript:selectLevelCD('${L5.count}','${financ.sNb}','modifyRec',<c:if test="${financ.tmpNum1 == 1}">'1'</c:if><c:if test="${financ.tmpNum1 == 2}">'3'</c:if>)"></td>
							</c:forEach></tr></table>
						</td> --%>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
