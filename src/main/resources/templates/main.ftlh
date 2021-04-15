<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <table>
        <tr>
            <th><p>${user.username}</p></th>
            <th><@l.logout /></th>
        </tr>
    </table>
    <div>
        <#if isAdmin>
            <span><a href="/user">Users list</a></span>
        </#if>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение"/>
            <input type="text" name="tag" placeholder="Тэг"/>
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!}"/>
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
        <div>

            <#--форма для удаления 1 сообшений через кнопку-->
            <form method="get" action="/main">
                <#--выдёргиваем ныжный ID и посылаем его через гет запрос
                ссылка в пойсковик будет - http://localhost:8080/main?messageId=1
             -->
                <input type="hidden" name="messageId" value="${message.id}">
                <button type="submit">DELETE</button>
            </form>
        </div>

        <div>

            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>


        </div>
    <#else>
        No message
    </#list>
</@c.page>