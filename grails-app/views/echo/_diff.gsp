<g:if test="${parsed == 'YES'}">
	
<g:if test="${er}">
    <div class="alert alert-danger" role="alert"><h3>${er}</h3></div>

</g:if>
<g:else>

		    <g:if test="${searchresults}">
       <br/>
%{--       <h3>Search Results</h3>--}%

        <div class="list">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Train Name</th>
                            <th>Train Number</th>
                            <th>Date Of Journey</th>
                            <th>Chart Prepared</th>
                            
                        </tr>
                    </thead>
                    <tbody class="table-striped">
                    <g:each in="${searchresults}" status="i" var="mInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: mInstance, field: "trainName")}</td>
                            <td>${fieldValue(bean: mInstance, field: "trainNo")}</td>
                            <td>${fieldValue(bean: mInstance, field: "doj")}</td>
                            <td>${fieldValue(bean: mInstance, field: "chartPrepared")}</td>
                        </tr>
                        <tr>
                            <td><b>From Station</b></td><td>${fieldValue(bean: mInstance, field: "fromStation")}</td>
                            <td><b>To Station</b></td><td>${fieldValue(bean: mInstance, field: "toStation")}</td>
                        </tr>
                        <tr>
                        	<td><b>Boarding Point</b></td><td>${fieldValue(bean: mInstance, field: "boardCode")}</td>
                             <td><b>Class</b></td><td>${fieldValue(bean: mInstance, field: "cls")}</td>
                        </tr>
                        <tr>
                        	<td><b>Reservation UpTo Code</b></td><td>${fieldValue(bean: mInstance, field: "resupCode")}</td>
                          	<td><b>Reservation UpTo Name</b></td><td>${fieldValue(bean: mInstance, field: "resupName")}</td>
                        </tr>
                        <%--<tr>
                        	<td><b>Chart Prepared</b></td><td>${fieldValue(bean: mInstance, field: "chartPrepared")}</td>
                        </tr>   
                    --%></g:each>
                    </tbody>
                    <%--
                Sub list
                --%>
                 <g:if test="${sr}">
       <br/>
      <center> <h3 style="color:#abbf78"></h3></center>
        <div class="list">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>SNO</th>
                            <th>Booking Status</th>
                            <th>Current Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sr}" status="i" var="mInst">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: mInst, field: "sr")}</td>
                            <td>${fieldValue(bean: mInst, field: "bStatus")}</td>
                            <td>${fieldValue(bean: mInst, field: "cStatus")}</td>
                           
                        </tr>
                    </g:each>
                    </tbody>
                    
                </table>
            </div>
    </g:if>
                </table>
            </div>
    </g:if>
		

</g:else>

					



</g:if>

<g:else>
<div class="alert alert-warning" role="alert">Enter complete pnr in a valid format</div>
</g:else>

