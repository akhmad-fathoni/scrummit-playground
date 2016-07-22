<%@include file="icon_modal.jsp" %>
<%@include file="parent_menu_modal.jsp" %>


<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>{{title}}</h2>
        <ol class="breadcrumb">
            <li>
                <a ui-sref="index.dashboard">Home</a>
            </li>
            <li>
                <a ui-sref="index.menu">Menu</a>
            </li>
            <li class="active">
                <strong>{{topmenu}}</strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <form class="m-t" role="form" ng-submit="saveProject()">
    	<div class="col-md-6">
    		<div class="form-group">
	            <label for="projectName">Menu Name</label>
	            <input type="text" class="form-control" required="true" ng-model="menu.menuname" aria-required="true">
	        </div>
	        <div class="form-group">
	            <label for="projectName">Link/Path/href</label>
	            <input type="text" class="form-control" required="true" ng-model="menu.href" aria-required="true">
	        </div>
    	</div>
    	
    	<div class="col-md-6">
    		<div class="form-group">
	            <label for="projectName">Menu Icon</label>
	            <div class="input-group">
		            <input id="menuIcon" type="text" class="form-control" required="true" ng-model="menu.cssClass" aria-required="true" onfocus="showIconModal();">
		            <span class="input-group-btn">
						<button type="button" class="btn btn-info btn-flat" onclick="showIconModal();">
									<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
				</div>
	        </div>
	        
	        <div class="form-group">
	            <label for="projectName">Parent Menu</label>
	            <div class="input-group">
	            	<input id="parentName" type="text" class="form-control" required="true" ng-model="menu.parentId" aria-required="true" onfocus="showPicklistMenu();">
	            	<input id="parentId" type="hidden" ng-model="menu.parentId"/>
	            	<span class="input-group-btn">
						<button type="button" class="btn btn-info btn-flat" onclick="showPicklistMenu();">
									<i class="glyphicon glyphicon-search"></i>
						</button>
					</span>
	            </div>
	        </div>
    	</div>
        
        
            <div class="form-group" style="padding-left:15px;">
				<button ui-sref="index.menu" class="btn btn-default">Cancel</button>
                <button class="btn btn-primary">Save</button>
            </div>
        
        <div
                ng-class="{ 'alert': flash, 'alert-success': flash.type === 'success', 'alert-danger': flash.type === 'error' }"
                ng-if="flash">
            <p ng-bind="flash.message"></p>
        </div>
    </form>

</div>

<script>
function showIconModal(){
	$("#iconModal").modal("show");
}

function showPicklistMenu(){
	$("#menuPickModal").modal("show");
}
</script>