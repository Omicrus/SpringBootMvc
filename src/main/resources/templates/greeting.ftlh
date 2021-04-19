<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>Hello,
        <#if isLogged>
            ${user.username}
        <#else>
            guest
        </#if>
    </h5>
    <div>This is a simple clone of Twitter</div>


</@c.page>