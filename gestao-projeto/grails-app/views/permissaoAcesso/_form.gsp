<div class="box-body">
	<div class="col-sm-6 form-group">
		<label>Permissões</label>
		<div class="input-group">
			<div id="treeview"></div>
			<input id="result" name="result" type="hidden" />
		</div>
	</div>
</div>
<!-- /.box-body -->

<div class="box-footer">
	<button type="reset" class="btn btn-danger"
		onclick="javascript: cancelar()">Cancelar</button>

	<button type="submit" class="btn btn-primary pull-right"
		onclick="javascript: salvar()">Salvar</button>
</div>

<script>
		$("#treeview").kendoTreeView({
			checkboxes : {
				checkChildren : true
			},

			check : onCheck,

			dataSource : ${raw(retorno)}

		});

		// function that gathers IDs of checked nodes
		function checkedNodeIds(nodes, checkedNodes) {
			for (var i = 0; i < nodes.length; i++) {
				if (nodes[i].checked) {
					checkedNodes.push(nodes[i].id);
				}

				if (nodes[i].hasChildren) {
					checkedNodeIds(nodes[i].children.view(), checkedNodes);
				}
			}
		}

		// show checked node IDs on datasource change
		function onCheck() {
			var checkedNodes = [], treeView = $("#treeview").data("kendoTreeView"), message;

			checkedNodeIds(treeView.dataSource.view(), checkedNodes);

			if (checkedNodes.length > 0) {
				message = checkedNodes.join(",");
			} else {
				message = "";
			}

			$("#result").val(message);
		}

		onCheck();
	</script>

<style>
#treeview .k-sprite {
	background-image:
		url("${createLink(uri: '/assets/kendo/coloricons-sprite.png')}");
}

.rootfolder {
	background-position: 0 0;
}

.folder {
	background-position: 0 -16px;
}

.pdf {
	background-position: 0 -32px;
}

.html {
	background-position: 0 -48px;
}

.image {
	background-position: 0 -64px;
}
</style>
