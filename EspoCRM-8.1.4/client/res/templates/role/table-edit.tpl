
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">{{translate 'Scope Level' scope='Role'}}</h4>
    </div>
    <div class="panel-body">
        <div class="no-margin">
            <table class="table table-bordered-inside no-margin scope-level">
                <tr>
                    <th></th>
                    <th style="width: 20%">{{translate 'Access' scope='Role'}}</th>
                    {{#each actionList}}
                        <th style="width: 11%">{{translate this scope='Role' category='actions'}}</th>
                    {{/each}}
                </tr>
                {{#each tableDataList}}
                <tr>
                    <td><b>{{translate name category='scopeNamesPlural'}}</b></td>

                    <td>
                        <select
                            name="{{name}}"
                            class="form-control"
                            data-type="access"
                        >{{options ../accessList access scope='Role' field='accessList'}}</select>
                    </td>

                    {{#ifNotEqual type 'boolean'}}
                        {{#each list}}
                            <td>
                                {{#if levelList}}
                                <select name="{{name}}"
                                    class="form-control scope-action{{#ifNotEqual ../access 'enabled'}} hidden{{/ifNotEqual}}"
                                    data-scope="{{../name}}"
                                    {{#ifNotEqual ../access 'enabled'}} disabled{{/ifNotEqual}}
                                    title="{{translate action scope='Role' category='actions'}}"
                                    data-role-action="{{action}}">
                                {{options levelList level field='levelList' scope='Role'}}
                                </select>
                                {{/if}}
                            </td>
                        {{/each}}
                    {{/ifNotEqual}}
                </tr>
                {{/each}}
            </table>

            <div class="sticky-header-scope hidden sticky-head">
                <table class="table borderless no-margin">
                    <tr>
                        <th></th>
                        <th style="width: 20%">{{translate 'Access' scope='Role'}}</th>
                        {{#each actionList}}
                            <th style="width: 11%">{{translate this scope='Role' category='actions'}}</th>
                        {{/each}}
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>

{{#if fieldTableDataList.length}}
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">{{translate 'Field Level' scope='Role'}}</h4>
    </div>
    <div class="panel-body">
        <div class="no-margin">
            <table class="table table-bordered-inside no-margin field-level">
                <tr>
                    <th></th>
                    <th style="width: 20%"></th>
                    {{#each fieldActionList}}
                        <th style="width: 11%">{{translate this scope='Role' category='actions'}}</th>
                    {{/each}}
                    <th style="width: 33%"></th>
                </tr>
                {{#each fieldTableDataList}}
                    <tr>
                        <td><b>{{translate name category='scopeNamesPlural'}}</b></td>
                        <td><button
                            type="button"
                            class="btn btn-link btn-sm action"
                            data-action="addField"
                            data-scope="{{name}}"
                            title="{{translate 'Add Field'}}"
                            ><span class="fas fa-plus"></span></button></td>
                        <td colspan="3"></td>
                    </tr>
                    {{#each list}}
                    <tr>
                        <td></td>
                        <td><b>{{translate name category='fields' scope=../name}}</b></td>
                        {{#each list}}
                        <td>
                            <select
                                name="field-{{../../name}}-{{../name}}"
                                class="form-control field-action"
                                data-field="{{../name}}"
                                data-scope="{{../../name}}"
                                data-action="{{name}}"
                                title="{{translate name scope='Role' category='actions'}}"
                            >{{options ../../../fieldLevelList value scope='Role' field='accessList'}}</select>
                        </td>
                        {{/each}}
                        <td colspan="2">
                            <a
                                role="button"
                                tabindex="0"
                                class="btn btn-link action"
                                title="{{translate 'Remove'}}"
                                data-action="removeField"
                                data-field="{{name}}"
                                data-scope="{{../name}}"
                                ><span class="fas fa-minus fa-sm"></span></a>
                        </td>
                    </tr>
                    {{/each}}
                {{/each}}
            </table>

            <div class="sticky-header-field hidden sticky-head">
                <table class="table borderless no-margin">
                    <tr>
                        <th></th>
                        <th style="width: 20%"></th>
                        {{#each fieldActionList}}
                            <th style="width: 11%">{{translate this scope='Role' category='actions'}}</th>
                        {{/each}}
                        <th style="width: 33%"></th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
{{/if}}
