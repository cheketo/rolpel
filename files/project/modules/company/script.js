/////////////////////////// ALERTS ////////////////////////////////////
$(document).ready(function(){
	if(get['msg']=='insert')
		notifySuccess('La empresa <b>'+get['element']+'</b> ha sido creada correctamente.');
	if(get['msg']=='update')
		notifySuccess('La empresa <b>'+get['element']+'</b> ha sido modificada correctamente.');
	showBillingType();
	inputMask();
});

///////////////////////// CREATE/EDIT ////////////////////////////////////
$(function(){
		$("#BtnCreate").click(function(){
			ShowErrorMapDiv();
			if(validate.validateFields('new_company_form') && validateMaps())
			{
				var getVars;
				switch ($("#relation").val())
				{
					case '1':
						getVars = '&customer=Y';
					break;
					case '2':
						getVars = '&provider=Y';
					break;
				}
				var target		= 'list.php?element='+$('#name').val()+'&msg='+ $("#action").val()+getVars;
				askAndSubmit(target,'Company','¿Desea crear la empresa <b>'+$('#name').val()+'</b>?',undefined,'new_company_form');
			}
		});
		$("#BtnCreateNext").click(function(){
			ShowErrorMapDiv();
			if(validate.validateFields('new_company_form') && validateMaps())
			{
				var getVars;
				switch ($("#relation").val())
				{
					case '1':
						getVars = '&customer=Y';
					break;
					case '2':
						getVars = '&provider=Y';
					break;
				}
				var target		= 'new.php?element='+$('#name').val()+'&msg='+ $("#action").val()+getVars;
				askAndSubmit(target,'Company','¿Desea crear la empresa <b>'+$('#name').val()+'</b>?',undefined,'new_company_form');
			}
		});
		$("#BtnEdit").click(function(){
			ShowErrorMapDiv();
			if(validate.validateFields('new_company_form') && validateMaps())
			{
				var getVars;
				switch ($("#relation").val())
				{
					case '1':
						getVars = '&customer=Y';
					break;
					case '2':
						getVars = '&provider=Y';
					break;
				}
				var target		= 'list.php?element='+$('#name').val()+'&msg='+ $("#action").val()+getVars;
				askAndSubmit(target,'Company','¿Desea modificar la empresa <b>'+$('#name').val()+'</b>?',undefined,'new_company_form');
			}
		});
		$("input").keypress(function(e){
			if(e.which==13 && $(this).hasClass('MainForm')){
				$("#BtnCreate,#BtnEdit").click();
			}
		});
});
///////////////////////// CREATE/EDIT FORM FUNCTIONS ////////////////////////////////////
$(document).ready(function(){
	DeleteAgent();
	CancelAgent();
	changeBillingFields();
	AddAgent();
	DeleteBranch();
	DayCheck();
});
function AddAgent()
{
	$(".agent_add").on("click",function(e){
		e.preventDefault();
		var id = $(this).attr("branch");
		if(validate.validateFields('new_agent_form_'+id))
		{
			var name = $('#agentname_'+id).val();
			var charge = $('#agentcharge_'+id).val();
			var email = $('#agentemail_'+id).val();
			var phone = $('#agentphone_'+id).val();
			var extra = $('#agentextra_'+id).val();
			if(!$("#branch_total_agents_"+id).val() || $("#branch_total_agents_"+id).val()=='undefined')
				$("#branch_total_agents_"+id).val(0);
			var total = parseInt($("#branch_total_agents_"+id).val())+1;


			$("#branch_total_agents_"+id).val(total);
			var agent = $("#branch_total_agents_"+id).val();
			if(charge)
			{
				chargehtml = '<br><span><i class="fa fa-briefcase"></i> '+charge+'</span>';
			}else{
				chargehtml = '';
			}
			if(phone)
			{
				phonehtml = '<br><span><i class="fa fa-phone"></i> '+phone+'</span>';
			}else{
				phonehtml = '';
			}
			if(email)
			{
				emailhtml = '<br><span><i class="fa fa-envelope"></i> '+email+'</span>';
			}else{
				emailhtml = '';
			}
			if(extra)
			{
				extrahtml = '<br><span><i class="fa fa-info-circle"></i> '+extra+'</span>';
			}else{
				extrahtml = '';
			}

			$("#agent_list_"+id).append('<div class="col-md-6 col-sm-6 col-xs-12 AgentCard"><div class="info-card-item"><input type="hidden" id="agent_name_'+agent+'_'+id+'" value="'+name+'" /><input type="hidden" id="agent_charge_'+agent+'_'+id+'" value="'+charge+'" /><input type="hidden" id="agent_email_'+agent+'_'+id+'" value="'+email+'" /><input type="hidden" id="agent_phone_'+agent+'_'+id+'" value="'+phone+'" /><input type="hidden" id="agent_extra_'+agent+'_'+id+'" value="'+extra+'" /><div class="close-btn DeleteAgent"><i class="fa fa-times"></i></div><span><i class="fa fa-user"></i> <b>'+name+'</b></span>'+chargehtml+phonehtml+emailhtml+extrahtml+'</div></div>');

			$('#agentname_'+id).val('');
			$('#agentcharge_'+id).val('');
			$('#agentemail_'+id).val('');
			$('#agentphone_'+id).val('');
			$('#agentextra_'+id).val('');
			$('#agent_form_'+id).addClass('Hidden');
			$('#SaveBranchEdition'+id).removeClass('disabled-btn');
			$('#SaveBranchEdition'+id).prop("disabled", false);
			$("#empty_agent_"+id).remove();
			DeleteAgent();
		}
	});
}

function CancelAgent()
{
	$(".agent_cancel").on("click",function(e){
		e.preventDefault();
		var id = $(this).attr("branch");
		$('#agentname_'+id).val('');
		$('#agentcharge_'+id).val('');
		$('#agentemail_'+id).val('');
		$('#agentphone_'+id).val('');
		$('#agentextra_'+id).val('');
		$('#agent_form_'+id).addClass('Hidden');
		$('#SaveBranchEdition'+id).removeClass('disabled-btn');
		$('#SaveBranchEdition'+id).prop("disabled", false);
	});
}

function DeleteAgent()
{
	$(".DeleteAgent").on("click",function(event){
		event.preventDefault();
		$(this).parents(".AgentCard").remove();
	});
}

///////////////////////// UPLOAD IMAGE ////////////////////////////////////
$(function(){
	$("#image_upload").on("click",function(){
		$("#image").click();
	});

	$("#image").change(function(){
		var process		= process_url+'?action=newimage&object=Company';
		var haveData	= function(returningData)
		{
			$('#newimage').val(returningData);
			$("#company_logo").attr("src",returningData);
			$('#company_logo').addClass('pulse').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
		      $(this).removeClass('pulse');
		    });
		}
		var noData		= function(){console.log("No data");}
		sumbitFields(process,haveData,noData);
	});
	ShowAgentForm();
});

function ShowAgentForm()
{
	$('.agent_new').on("click",function(){
		var id = $(this).attr("branch");
	    if ($('#agent_form_'+id).hasClass('Hidden')) {
			$('#agent_form_'+id).removeClass('Hidden');
			$('#SaveBranchEdition'+id).addClass('disabled-btn');
			$('#SaveBranchEdition'+id).attr('disabled', true);
	    } else {
			$('#agent_form').addClass('Hidden');
			$('#SaveBranchEdition'+id).removeClass('disabled-btn');
			$('#SaveBranchEdition'+id).prop("disabled", false);
	    }
	});
}

///////////////////////////// BROKERS /////////////////////////////////////////

function AddBroker()
{
	$(".add_broker").on("click",function(){
		var id = $(this).attr("branch");
	});
}

function ShowErrorMapDiv()
{
	if(!validateMap(1))
	{
		$("#MapsErrorMessage").removeClass('Hidden');
	}else{
		$("#MapsErrorMessage").addClass('Hidden');
	}
}

//////////////////////////// DAYS AND HOURS ///////////////////////////////////////
function DayCheck()
{
	$('.iCheckbox').on('ifChecked', function(){
		var id = $(this).attr('id');
		$("#from_"+id).attr("validateEmpty","Seleccione un horario inicial.");
		$("#from_"+id).attr("disabled",false);
		$("#to_"+id).attr("validateEmpty","Seleccione un horario final.");
		$("#to_"+id).attr("disabled",false);
	});

	$('.iCheckbox').on('ifUnchecked', function(){
		var id = $(this).attr('id');

		$("#from_"+id).removeAttr("validateEmpty");
		$("#from_"+id).attr("disabled",true);
		$("#from_"+id).val('');
		$("#from_"+id).change();
		$("#to_"+id).removeAttr("validateEmpty");
		$("#to_"+id).attr("disabled",true);
		$("#to_"+id).val('');
		$("#to_"+id).change();
	});

	$(".clockPicker").focusout(function()
	{
		if($(this).val())
		{
			$(this).val($(this).val().replace('_','0'));
			var time = $(this).val().split(':');
			console.log($(this).val());
			if(!time[1])
			{
				$(this).val(time[0]+':00');
			}else{
				if(time[1]=='__')
				{
					$(this).val(time[0]+':00');
				}else{
					$(this).val($(this).val().replace('_','0'));
				}
			}

			if(time[0]>23 || time[1]>59)
			{
				$(this).val('');
			}

			var id = $(this).attr('id').split('_');
			var from = $("#from_"+id[1]+"_"+id[2]);
			var to = $("#to_"+id[1]+"_"+id[2]);

			if(from.val() && to.val())
			{
				var time1 = from.val().replace(':','');
				var time2 = to.val().replace(':','');

				if(parseInt(time1)>parseInt(time2))
				{
					var fromval = from.val();
					from.val(to.val());
					to.val(fromval);
				}
			}

			if( id[1] == 'monday' )
			{

				$(".clockPicker").each(function(){
					// console.log($(this).attr('id'));
					if(!$(this).val() && $(this).attr('disabled')!="disabled" )
					{
						var otherid = $(this).attr('id').split('_');
						if(otherid[0]=='to')
						{
							$(this).val(to.val());
						}else{
							$(this).val(from.val());
						}
					}
				});
			}
		}
	});
}

//////////////////////////// ADD BRANCH ///////////////////////////////////////
function addBranchModal()
{
		var process		= process_url+'?object=CompanyBranch&action=Getbranchmodal';
		var haveData	= function(returningData)
		{
			//console.log(returningData);
			$("#ModalBranchesContainer").append(returningData);
			$("#branch_modal_"+$("#total_branches").val()).show();
			EditBranch();
			CancelBranchEdition();
			SaveBranchEdition();
			validateMap();
			chosenSelect();
			iCheck();
			setClockPicker();
			DayCheck();
			inputMask();
			ShowAgentForm();
			AddAgent();
			CancelAgent();
			initMap($("#total_branches").val());
			validateDivChange();
		}
		var noData		= function()
		{
			console.log("no returning data");
		}
		sumbitFields(process,haveData,noData);


}

function addBranch()
{
	var id = parseInt($("#total_branches").val())+1;
	$("#total_branches").val(id);
	var name = 'Sucursal '+(id-1);
	var img = '../../../../skin/images/companies/default/default2.png';
	var html = '<div id="branch_row_'+id+'" class="row branch_row listRow2" style="margin:0px!important;"><div class="col-lg-1 col-md-2 col-sm-3 flex-justify-center hideMobile990"><div class="listRowInner"><img class="img" style="margin-top:5px!important;" src="'+img+'" alt="Sucursal" title="Sucursal"></div></div><div class="col-lg-9 col-md-7 col-sm-5 col-xs-7 flex-justify-center" style="margin-left:0px;"><span class="listTextStrong" style="margin-top:15px!important;" id="branch_row_name_'+id+'">'+name+'</span></div><div class="col-lg-1 col-md-2 col-sm-3 col-xs-5 flex-justify-center" style="margin-right:0px;"><button type="button" branch="'+id+'" id="EditBranch'+id+'" class="btn btnBlue EditBranch"><i class="fa fa-pencil"></i></button>&nbsp;<button type="button" id="DeleteBranch'+id+'" branch="'+id+'" class="btn btnRed DeleteBranch"><i class="fa fa-trash"></i></button></div></div>';
	$("#branches_container").append(html);
	addBranchModal();
	DeleteBranch();
}

$("#add_branch").on("click",function(){
	addBranch();
});

function EditBranch()
{
	$(".EditBranch").on("click",function(){
		var id = $(this).attr('branch');
		$("#branch_modal_"+id).show();
		// console.log($("#branch_modal_"+id).html());
	});
}

function SaveBranchEdition()
{
	$(".SaveBranchEdition").click(function(e){
		e.stopPropagation();
		var id = $(this).attr('branch');

		// alert(validate.validateFields('branch_form_'+id));
		// alert(validate.getLastValidation());

		if(validate.validateFields('branch_form_'+id) && validateMap(id))
		{
			$("#branch_modal_"+id).removeClass("NewBranch");
			$("#branch_modal_"+id).hide();
			$("#branch_row_name_"+id).html('Sucursal '+$("#branch_name_"+id).val());
			$("#BranchTitle"+id).html('Editar Sucursal '+$("#branch_name_"+id).val());
		}
		ShowErrorMapDiv();
		return false;
	});

	$(".branchname").on("keyup",function(){
		var name = $(this).val();
		var id = $(this).attr('branch');
		$("#BranchTitle"+id).html('Editar Sucursal '+name);
	});
}

function DeleteBranch()
{
	$(".DeleteBranch").on("click",function(e){
		e.stopPropagation();
		var id = $(this).attr('branch');
		var branch = $("#branch_row_name_"+id).html();
		alertify.confirm("¿Desea eliminar la "+branch+"?", function(r){
			if(r)
			{
				$("#branch_row_"+id).remove();
				$("#branch_modal_"+id).remove();
				$("#total_branches").val(parseInt(id)-1);
			}
		});
	});
}

function CancelBranchEdition()
{
	$(".CancelBranchEdition").on("click",function(){
		var id = $(this).attr('branch');
		if($("#branch_modal_"+id).hasClass("NewBranch"))
		{
			$("#DeleteBranch"+id).click();
			$("#total_branches").val(id-1);
		}else{
			$("#branch_modal_"+id).hide();
		}
	});
	return false;
}
$(document).ready(function(){
	EditBranch();
	SaveBranchEdition();
	CancelBranchEdition();
	$(".LoadedMap").click(function(){
		if(!$(this).hasClass('Initializated'))
		{
			var id =$(this).attr("branch");
			$(this).addClass('Initializated');
			initMap(id);
		}

	});
});


////////////////////////////// Billing Fields ///////////////////////////
function changeBillingFields()
{
	$("#international").change(function(){
		showBillingType();
	});
}

function showBillingType()
{
	if($("#international").val())
		$("#Billing").removeClass('Hidden');
	if($("#international").val()=="Y")
	{
		$("#BillingNational").addClass('Hidden');
		$("#BillingInternational").removeClass('Hidden');
		// $("#iva").attr("validateEmpty2",$("#iva").attr("validateEmpty"));
		// $("#iva").removeAttr("validateEmpty");
		// $("#cuit").attr("validateEmpty2",$("#cuit").attr("validateEmpty"));
		// $("#cuit").removeAttr("validateEmpty");
	}else{
		$("#BillingInternational").addClass('Hidden');
		$("#BillingNational").removeClass('Hidden');
		// $("#iva").attr("validateEmpty",$("#iva").attr("validateEmpty2"));
		// $("#iva").removeAttr("validateEmpty2");
		// $("#cuit").attr("validateEmpty",$("#cuit").attr("validateEmpty2"));
		// $("#cuit").removeAttr("validateEmpty2");
	}
}
