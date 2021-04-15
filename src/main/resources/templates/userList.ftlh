<#import "parts/common.ftlh" as c>

<@c.page>
    <p style="font-family: 'Adobe Devanagari', monospace">List of Users</p>

    <table class="content-user-table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Password</th>
            <th>Role</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username!}</td>
                <td> ${user.password}</td>
                <td><#list  user.roles as role>${role}<#sep >, </#list></td>
                <td><a href="/user/${user.id}">Edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>