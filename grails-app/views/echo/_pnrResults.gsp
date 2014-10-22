
    <g:if test="${searchresults}">
       <br/>
       <h3>Search Results</h3>
        <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th><g:message code="pnrdata.trainNo.label" default="trainNo" /></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${searchresults}" status="i" var="mInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: mInstance, field: "trainNo")}</td>
                           
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
    </g:if>
