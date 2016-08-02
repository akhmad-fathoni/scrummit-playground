<style>
	table.treetable tbody tr td.pointer{
		cursor:pointer;
	}
</style>

<div class="modal fade" id="menuPickModal" tabindex="-1" role="dialog" aria-labelledby="menuPickModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		          <h4 class="modal-title">Menu Picklist</h4>
		        </div>
		        <div  class="modal-body">
		          	
		          	
		          	<div class="tableContainer" ng-controller="TreeTableController">
	    				<script type="text/ng-template" id="tree_node">
        					<tr tt-node is-branch="node.children.length > 0">
            					<td class="pointer">
									<input type="hidden" ng-bind="node.id" class="id"/>
									<input type="hidden" ng-bind="node.menuname" class="menuname"/>
									<span ng-if="node.children.length > 0" class="folder" ng-bind="node.menuname" onclick="pilihParent(this);"></span>
									<span ng-if="!node.children || node.children.length < 1" class="file" ng-bind="node.menuname" onclick="pilihParent(this);"></span>
								</td>
        					</tr>
    					</script>
					    <table tt-table tt-params="expanded_params">
					        <thead>
					        <tr>
					            <th>Menu Name</th>
					        </tr>
					        </thead>
					        <tbody></tbody>
					    </table>
					</div>
				
				
				
		        </div>
		        <div class="modal-footer">
		          <button id="pejetClose" type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
		        </div>
		      </div>
		    </div>
		</div>
      
<script>
function pilihParent(ini){
	var idx = $(ini).closest("tr").find("input.id").html();
	var menuname = $(ini).closest("tr").find("input.menuname").html();
	
	var scope = angular.element($("#menuIcon")).scope();
    scope.$apply(function(){
        scope.menu.parentId = idx;
    });
    
	$("#parentName").val(menuname);
	$("#menuPickModal").modal("hide");
}

</script>
      