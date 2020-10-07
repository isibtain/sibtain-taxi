<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<li>
    <a href="<spring:url value="/welcome" />">
        <button type="button" class="btn btn-info">
            HOME
        </button>
    </a>
</li>
<li>
    <a href="<spring:url value="/about" />">
        <button type="button" class="btn btn-info">
            ABOUT AAAJ
        </button>
    </a>
</li>
<li>
    <security:authorize access="hasRole('ADMIN')">
        <a class="btn btn-info" href="<spring:url value="/admin/approval" />">
            USER APPROVAL
        </a>
    </security:authorize>
</li>
<li>
    <security:authorize access="hasAnyRole('ADMIN', 'DRIVER')">
        <a href="<spring:url value="/addTrip" />">
            <button type="button" class="btn btn-info">
                ADD TRIP
            </button>
        </a>
    </security:authorize>
</li>

</li>
<li>
    <security:authorize access="hasAnyRole('ADMIN', 'DRIVER')">
    <a href="<spring:url value="/driver_Trip" />">
        <button type="button" class="btn btn-info">
            MY TRIP
        </button>
    </a>
    </security:authorize>
</li>
<li>
    <security:authorize access="hasRole('RIDER')">
        <a href="<spring:url value="/registerDriver" />">
            <button type="button" class="btn btn-info">
                BECOME A DRIVER
            </button>
        </a>
    </security:authorize>
</li>