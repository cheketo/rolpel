<?php

class CompanyBranch
{
  use CoreCrud,CoreImage;

  const TABLE				     = 'company_branch';
	const TABLE_ID			   = 'branch_id';
	const DEFAULT_IMG		   = '../../../../skin/images/branches/default/default.png';
	const DEFAULT_IMG2		 = '../../../../skin/images/branches/default/default2.png';
	const DEFAULT_IMG_DIR	 = '../../../../skin/images/branches/default/';
	const IMG_DIR			     = '../../../../skin/images/branches/';

  public static function GetBranch( $BranchID )
  {

      $Branch = Core::Select( self::TABLE, '*', self::TABLE_ID . "=" . $BranchID );

      return $Branch[ 0 ];

  }

	public static function GetBranches($Branches)
	{
	  $TotalBranches = array();
		if(is_array($Branches))
		{
		    $X=0;
			foreach($Branches as $Branch)
			{
			    if($Branch['branch_id']!=$ID)
			    {
			        if(!$X)
			            $Branch['branch_logo'] = self::DEFAULT_IMG;
			        else
			            $Branch['branch_logo'] = self::DEFAULT_IMG2;

			        $TotalBranches[] = $Branch;
			        $ID=$Branch['branch_id'];
			    }
			    $X++;
			}
		}
		return $TotalBranches;
	}

    public static function InsertBranchInfo($ID,$DeleteInfo=false)
	{
	  // DELETE ALL BRANCHES
		if($DeleteInfo)
		{
			Core::Delete('company_agent',Company::TABLE_ID."=".$ID);
			Core::Delete('relation_company_broker',Company::TABLE_ID."=".$ID);
			Core::Delete(self::TABLE,Company::TABLE_ID."=".$ID);
		}

		// BRANCHES
		for($I=1;$I<=$_POST['total_branches'];$I++)
		{
			if($_POST['branch_name_'.$I])
			{
				$Branches[$I]['name']			= $_POST['branch_name_'.$I];
				$Branches[$I]['website']	= $_POST['website_'.$I];
				$Branches[$I]['fax']			= $_POST['fax_'.$I];
				$Branches[$I]['email']	  = $_POST['email_'.$I];
				$Branches[$I]['phone']		= $_POST['phone_'.$I];

				if($I==1)
					$Branches[$I]['main_branch']			= 'Y';
				else
					$Branches[$I]['main_branch']			= 'N';

        // DAYS & HOURS
        $Branches[$I]['monday_from']		= $_POST['monday_'.$I]? $_POST['from_monday_'.$I]:'';
        $Branches[$I]['monday_to']		  = $_POST['monday_'.$I]? $_POST['to_monday_'.$I]:'';

        $Branches[$I]['tuesday_from']		= $_POST['tuesday_'.$I]? $_POST['from_tuesday_'.$I]:'';
        $Branches[$I]['tuesday_to']		  = $_POST['tuesday_'.$I]? $_POST['to_tuesday_'.$I]:'';

        $Branches[$I]['wensday_from']		= $_POST['wensday_'.$I]? $_POST['from_wensday_'.$I]:'';
        $Branches[$I]['wensday_to']		  = $_POST['wensday_'.$I]? $_POST['to_wensday_'.$I]:'';

        $Branches[$I]['thursday_from']		= $_POST['thursday_'.$I]? $_POST['from_thursday_'.$I]:'';
        $Branches[$I]['thursday_to']		  = $_POST['thursday_'.$I]? $_POST['to_thursday_'.$I]:'';

        $Branches[$I]['friday_from']		= $_POST['friday_'.$I]? $_POST['from_friday_'.$I]:'';
        $Branches[$I]['friday_to']		  = $_POST['friday_'.$I]? $_POST['to_friday_'.$I]:'';

        $Branches[$I]['saturday_from']		= $_POST['saturday_'.$I]? $_POST['from_saturday_'.$I]:'';
        $Branches[$I]['saturday_to']		  = $_POST['saturday_'.$I]? $_POST['to_saturday_'.$I]:'';

        $Branches[$I]['sunday_from']		= $_POST['sunday_'.$I]? $_POST['from_sunday_'.$I]:'';
        $Branches[$I]['sunday_to']		  = $_POST['sunday_'.$I]? $_POST['to_sunday_'.$I]:'';

				// LOCATION DATA
				$Branches[$I]['lat']			= $_POST['map'.$I.'_lat'];
				$Branches[$I]['lng']			= $_POST['map'.$I.'_lng'];

				$Branches[$I]['address']		= $_POST['map'.$I.'_address_short'];
				if(!$Branches[$I]['address'])
					$Branches[$I]['address']	= $_POST['address_'.$I];
				$Branches[$I]['postal_code']	= $_POST['map'.$I.'_postal_code'];
				if(!$Branches[$I]['postal_code'])
					$Branches[$I]['postal_code']= $_POST['postal_code_'.$I];

				$Branches[$I]['zone_short']		= $_POST['map'.$I.'_zone_short'];
				$Branches[$I]['region_short']	= $_POST['map'.$I.'_region_short'];
				$Branches[$I]['province_short']	= $_POST['map'.$I.'_province_short'];
				$Branches[$I]['country_short']	= $_POST['map'.$I.'_country_short'];

				$Branches[$I]['zone']			= $_POST['map'.$I.'_zone'];
				$Branches[$I]['region'] 		= $_POST['map'.$I.'_region'];
				$Branches[$I]['province']		= $_POST['map'.$I.'_province'];
				$Branches[$I]['country']		= $_POST['map'.$I.'_country'];

				// INSERT NEW LOCATIONS
				$Branches[$I]['country_id']		= Geolocation::InsertCountry($Branches[$I]['country'],$Branches[$I]['country_short']);
				$Branches[$I]['province_id']	= Geolocation::InsertProvince($Branches[$I]['province'],$Branches[$I]['province_short'],$Branches[$I]['country_id']);
				$Branches[$I]['region_id']		= Geolocation::InsertRegion($Branches[$I]['region'],$Branches[$I]['region_short'],$Branches[$I]['country_id'],$Branches[$I]['province_id']);
				$Branches[$I]['zone_id']		= Geolocation::InsertZone($Branches[$I]['zone'],$Branches[$I]['zone_short'],$Branches[$I]['country_id'],$Branches[$I]['province_id'],$Branches[$I]['region_id']);

				$BranchID 		                = Core::Insert("company_branch",Company::TABLE_ID.",country_id,province_id,region_id,zone_id,name,address,phone,email,website,fax,postal_code,main_branch,lat,lng,monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,creation_date,created_by,".CoreOrganization::TABLE_ID,$ID.",".$Branches[$I]['country_id'].",".$Branches[$I]['province_id'].",".$Branches[$I]['region_id'].",".$Branches[$I]['zone_id'].",'".$Branches[$I]['name']."','".$Branches[$I]['address']."','".$Branches[$I]['phone']."','".$Branches[$I]['email']."','".$Branches[$I]['website']."','".$Branches[$I]['fax']."','".$Branches[$I]['postal_code']."','".$Branches[$I]['main_branch']."',".$Branches[$I]['lat'].",".$Branches[$I]['lng'].",'".$Branches[$I]['monday_from']."','".$Branches[$I]['monday_to']."','".$Branches[$I]['tuesday_from']."','".$Branches[$I]['tuesday_to']."','".$Branches[$I]['wensday_from']."','".$Branches[$I]['wensday_to']."','".$Branches[$I]['thursday_from']."','".$Branches[$I]['thursday_to']."','".$Branches[$I]['friday_from']."','".$Branches[$I]['friday_to']."','".$Branches[$I]['saturday_from']."','".$Branches[$I]['saturday_to']."','".$Branches[$I]['sunday_from']."','".$Branches[$I]['sunday_to']."',NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID]);
				// echo Core::LastQuery();

				// AGENTS DATA
				$Agents = array();
				for($A=1;$A<=$_POST['branch_total_agents_'.$I];$A++)
				{
					if($_POST['agent_name_'.$A.'_'.$I])
					{
						$AgentName		= ucfirst($_POST['agent_name_'.$A.'_'.$I]);
						$AgentCharge	= ucfirst($_POST['agent_charge_'.$A.'_'.$I]);
						$AgentEmail 	= $_POST['agent_email_'.$A.'_'.$I];
						$AgentPhone		= $_POST['agent_phone_'.$A.'_'.$I];
						$AgentExtra 	= $_POST['agent_extra_'.$A.'_'.$I];
						$Agents[]		= array('name'=>$AgentName,'charge'=>$AgentCharge,'email'=>$AgentEmail,'phone'=>$AgentPhone,'extra'=>$AgentExtra);
					}
				}

				// INSERT AGENTS
				$Fields="";
				foreach($Agents as $Agent)
				{
					if($Fields)
						$Fields .= "),(";
					$Fields .= $ID.",".$BranchID.",'".$Agent['name']."','".$Agent['charge']."','".$Agent['email']."','".$Agent['phone']."','".$Agent['extra']."',NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID];
				}
				if($Fields)
				    Core::Insert('company_agent',Company::TABLE_ID.',branch_id,name,charge,email,phone,extra,creation_date,created_by,'.CoreOrganization::TABLE_ID,$Fields);

				// INSERT BROKERS
				$Brokers = explode(",",$_POST['brokers_'.$I]);
				$Fields="";
				foreach($Brokers as $Broker)
				{
					if($Broker>0)
					{
						if($Fields)
							$Fields .= "),(";
						$Fields .= $ID.",".$BranchID.",".$Broker.",".$_SESSION['organization_id'];
					}
				}
				if($Fields)
					Core::Insert('relation_company_broker',Company::TABLE_ID.',branch_id,broker_id,organization_id',$Fields);
			}
		}
	}

	public function Getbranchmodal($ID=1,$Data=array())
    {
    	if($_POST['total_branches'])
    		$ID = $_POST['total_branches'];
    	if(empty($Data))
		{
			if($ID>1)
				$NewClass = "NewBranch";
			$BranchName = (intval($ID)-1);
			$Agents	= array();
		}else{
			$BranchName = $Data['branch_name'];
			$Results	= Core::Select('relation_company_broker','broker_id',self::TABLE_ID.'='.$Data[self::TABLE_ID]);
			foreach($Results as $Broker)
		    {
		      $Brokers .= $Brokers? ','.$Broker['broker_id'] : $Broker['broker_id'];
		    }
		    $Agents	= Core::Select('company_agent','*','branch_id='.$Data['branch_id']);
		    $A=0;
		    $AgentsHTML = "";
		    foreach($Agents as $Agent)
		    {
		    	$A++;
		    	$Charge = $Agent['charge']? '<br><span><i class="fa fa-briefcase"></i> '.$Agent['charge'].'</span>':'';
		    	$Email = $Agent['email']? '<br><span><i class="fa fa-envelope"></i> '.$Agent['email'].'</span>':'';
		    	$Phone = $Agent['phone']? '<br><span><i class="fa fa-phone"></i> '.$Agent['phone'].'</span>':'';
		    	$Extra = $Agent['extra']? '<br><span><i class="fa fa-info-circle"></i> '.$Agent['extra'].'</span>':'';
		    	$AgentsHTML .= '<div class="col-md-6 col-sm-6 col-xs-12 AgentCard"><div class="info-card-item"><input type="hidden" id="agent_name_'.$A.'_'.$ID.'" value="'.$Agent['name'].'" /><input type="hidden" id="agent_charge_'.$A.'_'.$ID.'" value="'.$Agent['charge'].'" /><input type="hidden" id="agent_email_'.$A.'_'.$ID.'" value="'.$Agent['email'].'" /><input type="hidden" id="agent_phone_'.$A.'_'.$ID.'" value="'.$Agent['phone'].'" /><input type="hidden" id="agent_extra_'.$A.'_'.$ID.'" value="'.$Agent['extra'].'" /><div class="close-btn DeleteAgent"><i class="fa fa-times"></i></div><span><i class="fa fa-user"></i> <b>'.$Agent['name'].'</b></span>'.$Charge.$Phone.$Email.$Extra.'</div></div>';
		    }
		    // if($A==0)
		    // {
		    // 	$NoAgents = '<span id="empty_agent_'.$ID.'" class="Info-Card-Empty info-card-empty">No hay representantes ingresados</span>';
		    // }
		}

		if(!$A)
	    {
	    	$NoAgents = '<span id="empty_agent_'.$ID.'" class="Info-Card-Empty info-card-empty">No hay representantes ingresados</span>';
	    }


    	if($ID>1)
    	{
    		$BranchNameHTML = '<div class="row form-group inline-form-custom">
						<div class="col-xs-12 col-sm-4">
                            Nombre de la Sucursal:
                        </div>
                        <div class="col-xs-12 col-sm-8">
                            '.Core::InsertElement('text','branch_name_'.$ID,$BranchName,'form-control branchname','branch="'.$ID.'" placeholder="Nombre" validateEmpty="Ingrese un nombre de sucursal"').'
                        </div>
                        </div>';
    	}else{
    		$BranchName = 'Central';
    		$BranchNameHTML = Core::InsertElement('hidden','branch_name_'.$ID,$BranchName);
    	}

    	if(Core::IsMobile())
    	{
    		$TopEm = 7;
    		$BodyEm = 24;
    	}else{
    		$TopEm = 11;
    		$BodyEm = 41;
    	}

        $MondayChecked = $Data['monday_from']? 'checked="checked"' : '';
        $TuesdayChecked = $Data['tuesday_from']? 'checked="checked"' : '';
        $WensdayChecked = $Data['wensday_from']? 'checked="checked"' : '';
        $ThursdayChecked = $Data['thursday_from']? 'checked="checked"' : '';
        $FridayChecked = $Data['friday_from']? 'checked="checked"' : '';
        $SaturdayChecked = $Data['saturday_from']? 'checked="checked"' : '';
        $SundayChecked = $Data['sunrday_from']? 'checked="checked"' : '';

        $MondayDisabled = $Data['monday_from']? '"' : 'disabled="disabled"';
        $TuesdayDisabled = $Data['tuesday_from']? '"' : 'disabled="disabled"';
        $WensdayDisabled = $Data['wensday_from']? '"' : 'disabled="disabled"';
        $ThursdayDisabled = $Data['thursday_from']? '"' : 'disabled="disabled"';
        $FridayDisabled = $Data['friday_from']? '"' : 'disabled="disabled"';
        $SaturdayDisabled = $Data['saturday_from']? '"' : 'disabled="disabled"';
        $SundayDisabled = $Data['sunday_from']? '"' : 'disabled="disabled"';

        $HTML .= '
        <!-- //// BEGIN BRANCH MODAL '.$ID.' //// -->
        <div id="branch_modal_'.$ID.'" class="modal fade '.$NewClass.'" role="dialog" style="opacity:1!important;">
            <div class="modal-dialog" style="top:'.$TopEm.'em;">

                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title" id="BranchTitle'.$ID.'">Editar Sucursal '.$BranchName.'</i></h4>
                    </div>
                    <div class="modal-body" style="max-height:'.$BodyEm.'em;overflow-y:scroll;">
                    <form id="branch_form_'.$ID.'" name="branch_form_'.$ID.'">
                            '.$BranchNameHTML.'
                        <h4 class="subTitleB" style="margin-top:0px;"><i class="fa fa-globe"></i> Geolocalizaci&oacute;n</h4>
                        <div class="row form-group inline-form-custom">
                            <div class="col-xs-12 col-sm-6">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                    '.Core::InsertElement('text','address_'.$ID,$Data['address'],'form-control','disabled="disabled" placeholder="Direcci&oacute;n" validateMinLength="4///La direcci&oacute;n debe contener 4 caracteres como m&iacute;nimo."').'
                                </span>
                            </div>
                            <div class="col-xs-12 col-sm-6 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-bookmark"></i></span>
                                    '.Core::InsertElement('text','postal_code_'.$ID,$Data['postal_code'],'form-control','disabled="disabled" placeholder="C&oacute;digo Postal" validateMinLength="4///La direcci&oacute;n debe contener 4 caracteres como m&iacute;nimo."').'
                                </span>
                            </div>
                        </div>
                        <div class="row form-group inline-form-custom">
                            <div class="col-xs-12 col-sm-12 MapWrapper">
                                '.Core::InsertAutolocationMap($ID,$Data).'
                            </div>
                        </div>

                        <br>
                        <h4 class="subTitleB"><i class="fa fa-phone"></i> Datos de contacto</h4>
                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-6 col-xs-12">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    '.Core::InsertElement('text','email_'.$ID,$Data['email'],'form-control',' placeholder="Email"').'
                                </span>
                            </div>
                            <div class="col-sm-6 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                    '.Core::InsertElement('text','phone_'.$ID,$Data['phone'],'form-control',' placeholder="Tel&eacute;fono"').'
                                </span>
                            </div>
                        </div>
                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-6 col-xs-12">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-desktop"></i></span>
                                    '.Core::InsertElement('text','website_'.$ID,$Data['website'],'form-control',' placeholder="Sitio Web"').'
                                </span>
                            </div>
                            <div class="col-sm-6 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-fax"></i></span>
                                    '.Core::InsertElement('text','fax_'.$ID,$Data['fax'],'form-control',' placeholder="Fax"').'
                                </span>
                            </div>
                        </div>
                        <br>

                        <h4 class="subTitleB"><i class="fa fa-clock-o"></i> Horarios de entregas</h4>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$MondayChecked.' class="iCheckbox DayCheck" name="monday_'.$ID.'" id="monday_'.$ID.'" value="1" > <span>Lunes</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_monday_'.$ID,$Data['monday_from'],'form-control clockPicker inputMask',$MondayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_monday_'.$ID,$Data['monday_to'],'form-control clockPicker inputMask',$MondayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$TuesdayChecked.' class="iCheckbox DayCheck" name="tuesday_'.$ID.'" id="tuesday_'.$ID.'" value="1" > <span>Martes</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_tuesday_'.$ID,$Data['tuesday_from'],'form-control clockPicker inputMask',$TuesdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_tuesday_'.$ID,$Data['tuesday_to'],'form-control clockPicker inputMask',$TuesdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$WensdayChecked.' class="iCheckbox DayCheck" name="wensday_'.$ID.'" id="wensday_'.$ID.'" value="1" > <span>Mi&eacute;rcoles</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_wensday_'.$ID,$Data['wensday_from'],'form-control clockPicker inputMask',$WensdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_wensday_'.$ID,$Data['wensday_to'],'form-control clockPicker inputMask',$WensdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$ThursdayChecked.' class="iCheckbox DayCheck" name="thursday_'.$ID.'" id="thursday_'.$ID.'" value="1" > <span>Jueves</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_thursday_'.$ID,$Data['thursday_from'],'form-control clockPicker inputMask',$ThursdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_thursday_'.$ID,$Data['thursday_to'],'form-control clockPicker inputMask',$ThursdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$FridayChecked.' class="iCheckbox DayCheck" name="friday_'.$ID.'" id="friday_'.$ID.'" value="1" > <span>Viernes</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_friday_'.$ID,$Data['friday_from'],'form-control clockPicker inputMask',$FridayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_friday_'.$ID,$Data['friday_to'],'form-control clockPicker inputMask',$FridayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$SaturdayChecked.' class="iCheckbox DayCheck DayCheck" name="saturday_'.$ID.'" id="saturday_'.$ID.'" value="1" > <span>S&aacute;bado</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_saturday_'.$ID,$Data['saturday_from'],'form-control clockPicker inputMask',$SaturdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_saturday_'.$ID,$Data['saturday_to'],'form-control clockPicker inputMask',$SaturdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>

                        <div class="row form-group inline-form-custom">
                            <div class="col-sm-4 col-xs-12">
                              <div class="checkbox icheck">
                                <label>
                                  <input type="checkbox" '.$SundayChecked.' class="iCheckbox DayCheck" name="sunday_'.$ID.'" id="sunday_'.$ID.'" value="1" > <span>Domingo</span>
                                </label>
                              </div>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','from_sunday_'.$ID,$Data['sunday_from'],'form-control clockPicker inputMask',$SundayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario inicial"').'
                                </span>
                            </div>

                            <div class="col-sm-4 col-xs-12 margin-top1em">
                                <span class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    '.Core::InsertElement('text','to_sunday_'.$ID,$Data['sunday_to'],'form-control clockPicker inputMask',$SundayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="Horario final"').'
                                </span>
                            </div>
                        </div>
                      </form>
                        <br>

                        <div class="row">
                            <div class="col-md-12 info-card">
                                <h4 class="subTitleB"><i class="fa fa-male"></i> Representantes</h4>
                                '.$NoAgents.'
                                <div id="agent_list_'.$ID.'" branch="'.$ID.'" class="row">
                                '.$AgentsHTML.'
                                </div>
                                <div class="row txC">
                                    <button id="agent_new_'.$ID.'" branch="'.$ID.'" type="button" class="btn btn-warning Info-Card-Form-Btn agent_new"><i class="fa fa-plus"></i> Agregar un representante</button>
                                </div>
                                '.Core::InsertElement("hidden","branch_total_agents_".$ID,count($Agents),'','branch="'.$ID.'"').'
                                <div id="agent_form_'.$ID.'" class="Info-Card-Form Hidden">
                                    <form id="new_agent_form_'.$ID.'">
                                        <div class="info-card-arrow">
                                            <div class="arrow-up"></div>
                                        </div>
                                        <div class="info-card-form animated fadeIn">
                                            <div class="row form-group inline-form-custom">
                                                <div class="col-xs-12 col-sm-6">
                                                    <span class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        '.Core::InsertElement('text','agentname_'.$ID,'','form-control',' placeholder="Nombre y Apellido" validateEmpty="Ingrese un nombre"').'
                                                    </span>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 margin-top1em">
                                                    <span class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-briefcase"></i></span>
                                                        '.Core::InsertElement('text','agentcharge_'.$ID,'','form-control',' placeholder="Cargo"').'
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row form-group inline-form-custom">
                                                <div class="col-xs-12 col-sm-6">
                                                    <span class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                                        '.Core::InsertElement('text','agentemail_'.$ID,'','form-control',' placeholder="Email" validateEmail="Ingrese un email v&aacute;lido."').'
                                                    </span>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 margin-top1em">
                                                    <span class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                        '.Core::InsertElement('text','agentphone_'.$ID,'','form-control',' placeholder="Tel&eacute;fono"').'
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row form-group inline-form-custom">
                                                <div class="col-xs-12 col-sm-12">
                                                    <span class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-info-circle"></i></span>
                                                        '.Core::InsertElement('textarea','agentextra_'.$ID,'','form-control','rows="1" placeholder="Informaci&oacute;n Extra"').'
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row txC">
                                                <button id="agent_add_'.$ID.'" branch="'.$ID.'" type="button" class="Info-Card-Form-Done btn btnGreen agent_add"><i class="fa fa-check"></i> Agregar</button>
                                                <button id="agent_cancel_'.$ID.'" branch="'.$ID.'" type="button" class="Info-Card-Form-Done btn btnRed agent_cancel"><i class="fa fa-times"></i> Cancelar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <br>

                    </div>
                    <div class="modal-footer txC" style="background-color:#6f69bd!important;">
          						<button type="button" name="button" class="btn btn-success btnBlue SaveBranchEdition" id="SaveBranchEdition'.$ID.'" data-dismiss="modal" branch="'.$ID.'">Guardar</button>
          						<button type="button" name="button" class="btn btn-success btnRed CancelBranchEdition" id="CancelBranchEdition'.$ID.'" data-dismiss="modal" branch="'.$ID.'">Cancelar</button>
          					</div>
                </div>
            </div>
        </div>
        <!-- //// END BRANCH MODAL '.$ID.' //// -->
        ';

        echo $HTML;
    }

    public function Fillbranches()
  	{
  		$Company = $_POST['id'];
  		$Branches = Core::Select(self::TABLE,"branch_id,CONCAT(name,' (',address,')') AS name","company_id=".$Company);
  		if(count($Branches)<1)
  		{
  			$Disabled = 'disabled="disabled"';
  		}
  		$HTML = Core::InsertElement('select','branch','','form-control chosenSelect','data-placeholder="Seleccione una Sucursal" '.$Disabled,$Branches);
  		echo $HTML;
  	}

    public function Getbranchinfo()
    {

        $ID = $_POST[ 'branch' ];

        $BranchInfo = Core::Select( self::TABLE, '*', self::TABLE_ID . "=" . $ID )[ 0 ];

        echo json_encode($BranchInfo);

    }
}

?>
