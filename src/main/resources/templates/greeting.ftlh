<#import "parts/common.ftlh" as c>

<@c.page>
<div>Hello,
    <#if isLogged>
        ${user.username}
    <#else>
        guest
    </#if>
</div>

<a href="/main">Main Page</a>
</@c.page>