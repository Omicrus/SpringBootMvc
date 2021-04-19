<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Insert message"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tag">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>

            <table>
                <tr>
                    <th>
                        <div class="m-1">
                            <form method="get" action="/main">
                                <input type="hidden" name="messageId" value="${message.id}">

                                <button type="submit" class="btn btn-secondary btn-sm">DELETE</button>
                            </form>
                        </div>
                    </th>
                    <th>

                        <div class="card body my-3">
                            <#if message.filename??>
                                <img src="/img/${message.filename}" class="card-img-top">
                            </#if>

                            <div class="m-2">
                                <p class="card-text">
                                <small>${message.text}</small>
                                <i>${message.tag}</i>
                                </p>
                            </div>
                            <div class="card-footer ">
                                <h5><small class=" text-muted">
                                    ${message.authorName}
                                </small></h5>
                            </div>

                        </div>
                    </th>
                </tr>
            </table>
        <#else>
            No message
        </#list>
    </div>
</@c.page>