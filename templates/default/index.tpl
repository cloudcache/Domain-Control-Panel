{include file="header.tpl"}
<div class="row">
	<div class="col-lg-12">
		<ol class="breadcrumb">
			<li class="active"><a href="index.php?page=DomainList"><i class="fa fa-home"></i> Domain Control Panel</a></li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="page-header pull-right">
			<a href="#" class="btn btn-gr-gray"><i class="fa fa-plus"></i> Domain hinzufügen</a>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Domains <span class="badge badge-black">{$domains|count}</span></div>
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-bordered table-hover radius table-striped dataTable" data-dontsort="4">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Serial</th>
								<th>Records</th>
								<th>Manage</th>
							</tr>
						</thead>

						<tbody>
							{foreach from=$domains item=domain}
							<tr>
								<td>{$domain['id']}</td>
								<td>{if $domain['active'] != 1}<span class="badge badge-red">{lang}domain.disabled{/lang}</span> {/if}<a href="index.php?page=RecordList&id={$domain['id']}">{$domain['origin']}</a></td>
								<td>{$domain['serial']}</td>
								<td>{$domain['rrc']}</td>
								<td>
									<span class="fa fa-remove ttips pointer deleteDomain" delete-id="{$domain['id']}" delete-confirm="{lang}domain.delete.message{/lang}" title="{lang}button.delete{/lang}"></span>
									<span class="fa fa{if $domain['active']}-check{/if}-square-o ttips pointer toggleDomain" toggle-id="{$domain['id']}" title="{if $domain['active']}{lang}button.disable{/lang}{else}{lang}button.enable{/lang}{/if}" data-disable-message="{lang}button.disable{/lang}" data-enable-message="{lang}button.enable{/lang}"></span>
									<a href="index.php?page=SecList&id={$domain['id']}" class="ttips" title="Edit DNSSEC"><span class="fa fa-key"></span></a>
								</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
{include file="footer.tpl"}