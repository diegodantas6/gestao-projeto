<g:each in="${retorno}" var="atividade">

<ul>
	<li>${atividade.nome}</li>
	<li>${atividade.usuario.username}</li>
</ul>

</g:each>


<ul>
	<li>Jose</li>
	<li>
		<h3>
			Design some buttons <small class="pull-right">20%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-aqua" style="width: 20%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">20% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Create a nice theme <small class="pull-right">40%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-green" style="width: 40%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">40% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Some task I need to do <small class="pull-right">60%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-red" style="width: 60%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">60% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Make beautiful transitions <small class="pull-right">80%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-yellow" style="width: 80%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">80% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
</ul>
<ul>
	<li>Joao</li>
	<li>
		<h3>
			Design some buttons <small class="pull-right">20%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-aqua" style="width: 20%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">20% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Create a nice theme <small class="pull-right">40%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-green" style="width: 40%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">40% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Some task I need to do <small class="pull-right">60%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-red" style="width: 60%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">60% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
	<li>
		<h3>
			Make beautiful transitions <small class="pull-right">80%</small>
		</h3>
		<div class="progress xs">
			<div class="progress-bar progress-bar-yellow" style="width: 80%"
				role="progressbar" aria-valuenow="20" aria-valuemin="0"
				aria-valuemax="100">
				<span class="sr-only">80% Complete</span>
			</div>
		</div>
	</li>
	<!-- end task item -->
</ul>

<input type="button" class="btn btn-primary" value="Voltar"
	onclick="voltar();">
