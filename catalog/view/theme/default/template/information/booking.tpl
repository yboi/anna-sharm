<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php echo $content_top; ?>
    
  
  <br />&nbsp;

  <style type="text/css">
            .moveCalendar
            {
                cursor: pointer;
                height: 32px;
            }
            .moveText
            {
                margin: 0px 10px;
				/*width: 170px;*/
				float: left;
            } 
			
			.table_bron{
				text-align: left;
			}
			
			.clear_div{
				clear: both;
			}
			
			.clear_place{
				height: 5px;
			}
  </style>
  
  <form action="<?php echo $action; ?>" name="form_booking" method="post" enctype="multipart/form-data">
    
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
	
		<table width="auto" cellspacing="0" cellpadding="0" border="0px" class="table_bron" align="left">
			<!--DATEin and DATEout begin-->	
			<tr>
				<td>  <span id="spDatein" class="moveText"> <b><?php echo $entry_datein; ?></b> </span> </td>
				<td>  <input  name="datefrom" id="tbMovingInDate" type="text" value ="" class="moveDate"/> 	</td>
				<td>  <img class="moveCalendar" id="imCalendarIn" src="/image/date.png" onclick="initDatePicker();" alt=""/> </td>			
				
				<td>  <span id="spDateout" class="moveText"><b><?php echo $entry_dateout; ?></b></span> </td>
				<td>  <input  name ="dateto" id="tbMovingOutDate" type="text" value ="" class="moveDate"/> </td>
				<td>  <img class="moveCalendar" id="imCalendarIn" src="/image/date.png" onclick="initDatePicker();" alt="" />				
				</td>			
			</tr>
			<!-- <tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr> -->			
			<!--DATEin and DATEout end-->			
			
			<!--Тип кімнати and кількість місць begin-->
			<tr>
				<td> <span id="room_type_span" class="moveText"><b><?php echo $entry_roomtype; ?></b></span> </td>		
				<td  colspan=2> 
					<input type="radio" name="room_type" value="4rooms"/><?php echo $entry_roomtype0; ?><br />
					<input type="radio" name="room_type" value="6rooms"/><?php echo $entry_roomtype1; ?><br />
					<input type="radio" name="room_type" value="8rooms"/><?php echo $entry_roomtype2; ?><br />
					<input type="radio" name="room_type" value="10rooms"/><?php echo $entry_roomtype3; ?><br />
				</td>
				
				<td> <span class="moveText"><b><?php echo $entry_place_count; ?></b></span> </td>		
				<td  colspan=2> 
						<select name="place_count">
						<option selected="selected">1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>		
				</td>
			</tr>
			<tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr>			
			<!--Тип кімнати and кількість місць end-->
			
			
			<!--NAME and SURNAME begin-->
			<tr>
				<td> <span id="spuser_name" class="moveText"><b><?php echo $entry_name;?></b></span> </td>		
				<td  colspan=2> <input type="text" id="user_name" name="name" value=""/> </td>
				
				<td> <span class="moveText"><b><?php echo $entry_surname;?></b></span> </td>		
				<td  colspan=2> <input type="text" name="surname" value=""/> </td>
			</tr>
			<tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr>			
			<!--NAME and SURNAME end-->		
			
			
			<!--телефон and емейл begin-->
			<tr>
				<td> <span id="sptelephone" class="moveText"><b><?php echo $text_telephone;?></b></span> </td>		
				<td  colspan=2> <input type="text" id="telephone" name="telephone" value=""/> </td>
				
				<td> <span id="spemail" class="moveText"><b><?php echo $entry_email;?></b></span> </td>		
				<td  colspan=2> <input id="email" type="text" name="email" value=""/> </td>
			</tr>
			<tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr>			
			<!--телефон and емейл end-->		
			
			<!--країна and місто begin-->
			<tr>
				<td> <span class="moveText"><b><?php echo $entry_country; ?></b></span> </td>		
				<td  colspan=2> 
					<select name="country">
						<option selected="selected"><?php echo $entry_country0; ?></option>
						<option><?php echo $entry_country1; ?></option>
						<option><?php echo $entry_country2; ?></option>
						<option><?php echo $entry_country3; ?></option>
						<option><?php echo $entry_country4; ?></option>
						<option><?php echo $entry_country5; ?></option>
						<option><?php echo $entry_country6; ?></option>
					</select>
				</td>
				
				<td> <span id="spcity" class="moveText"><b><?php echo $entry_city; ?></b></span> </td>		
				<td  colspan=2> <input id="city" type="text" name="city" value=""/> </td>
			</tr>
			<tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr>			
			<!--країна and місто end-->				

			<!--адреса begin-->
			<tr>
				<td  colspan=6> <span class="moveText"><b><?php echo $text_address; ?></b></span> <br />
					<textarea name="address" cols="40" rows="3"></textarea>
				</td>		
			</tr>
			<tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr>				
			<!--адреса end-->		
			
			<!--додаткова інформація begin-->
			<tr>
				<td  colspan=6> <span class="moveText"><b><?php echo $entry_adinfo; ?></b></span> <br />
					<textarea name="adinfo" cols="40" rows="3"></textarea>
				</td>		
			</tr>
			<!-- <tr>		
				<td colspan=6>
					<div class="clear_place"></div>
				</td>	
			</tr> -->				
			<!--додаткова інформація end-->				
		</table>
	
		<div class="clear_div"> </div>
    
    </div>
	
    <div class="buttons">
      <div class="left"><input type="submit" onclick="if (!InfoValidate()) return false;" value="<?php echo $entry_send_quechen; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>

<script type="text/javascript">
$(document).ready(function() {    
    initDatePicker();
      $('#tbMovingInDate').change(function(){
        /*$('#tbMovingOutDate').val($('#tbMovingInDate').val() );*/ 
	});  
    initDateButton();
    });
    function initDatePicker() {
		$.datepicker.setDefaults($.datepicker.regional['<?php echo $lang_value; ?>']); 
		$("input[id$='tbMovingInDate']").datepicker({ minDate: +0, dateFormat: "yy-mm-dd"});
		$("input[id$='tbMovingOutDate']").datepicker({ minDate: +0, dateFormat: "yy-mm-dd"});
    }
    function initDateButton() {                                        
		$("img[id$='imCalendarIn']").click(function () {                                            
		$("input[id$='tbMovingInDate']").datepicker("show");
		});
		$("img[id$='imCalendarOut']").click(function () {                                            
		$("input[id$='tbMovingOutDate']").datepicker("show");
		});
	}
    function InfoValidate() {
            var datein = $("input[id$='tbMovingInDate']").val();
            var dateout = $("input[id$='tbMovingOutDate']").val();
			var user_name = $("input[id$='user_name']").val();
			var telephone = $("input[id$='telephone']").val();
			var city = $("input[id$='city']").val();
			var email=$("input[id$='email']").val();
			var namevalue=false;
			var telephonevalue=false;
			var cityvalue=false;
			var emailvalue=false; 
			if (!Validate(user_name) || !ValidateNameLenght(user_name)){
				namevalue=false;
                $("span[id$='spuser_name']").css('color','#F13804'); // не введено значення
			}
            else {
				namevalue=true;
				$("span[id$='spuser_name']").css('color','#20201d'); // введено значення
			}
			
			
			if (!Validate(telephone) || !ValidateNameLenght(telephone)){
				telephonevalue=false;
				$("span[id$='sptelephone']").css('color','#F13804'); // не введено значення
			}
            else {
				telephonevalue=true;
				$("span[id$='sptelephone']").css('color','#20201d'); // введено значення
			}
			
			if (!Validate(city) || !ValidateNameLenght(city)){
				cityvalue=false;
                $("span[id$='spcity']").css('color','#F13804'); // не введено значення
			}
            else {
				cityvalue=true;
				$("span[id$='spcity']").css('color','#20201d'); // введено значення
			}
			
			if (!ValidateEmail(email)){
                emailvalue = false;
				$("span[id$='spemail']").css('color','#F13804');
				document.getElementById('email').value="";
			}
            else {
				emailvalue = true;
                $("span[id$='spemail']").css('color','#20201d');
			}
						
            if (!Validate(datein))
                $("span[id$='spDatein']").css('color','#F13804');
            else
                $("span[id$='spDatein']").css('color','#20201d');
            if (!Validate(dateout))
                $("span[id$='spDateout']").css('color','#F13804');
            else
                $("span[id$='spDateout']").css('color','#20201d');
				
			var radio = ValidateRadio(document.form_booking.room_type);
			
			/*alert("radio=" + radio);
			alert("namevalue=" + namevalue);
			alert("telephonevalue=" + telephonevalue);
			alert("cityvalue=" + cityvalue);
			alert("emailvalue=" + emailvalue);*/
			radio = radio && namevalue && telephonevalue && cityvalue && emailvalue;
			//alert("radioFINISH=" + radio);
			return Validate(datein) && Validate(dateout) && ValueDateValid() && radio ;
	}
	
	function ValidateEmail(val) {
		reg = /[0-9a-z_]+@[0-9a-z_^.]+\.[a-z]{2,3}/i;
		if ( val.match(reg) )  
			return true; 
		else
			return false;
	}
	
	function Validate(val) {
		if (val == null || val == "") {
			return false;
		}
		else
			return true;
	}
	function ValidateNameLenght(val) {
		if ( (val.length >=3) && (val.length <=32) ) {
			return true;
		}
		else
			return false;
	}
    function ValueDateValid (){
		var datein = $("input[id$='tbMovingInDate']").val();
		var dateout = $("input[id$='tbMovingOutDate']").val();
		var check = true;
		if (StrToDate(datein) >= StrToDate(dateout))
		{
			check = false;
			$("span[id$='spDatein']").css('color','#F13804');
			$("span[id$='spDateout']").css('color','#F13804');  
		}
		else
		{
			$("span[id$='spDatein']").css('color','#20201d');
			$("span[id$='spDateout']").css('color','#20201d');
		}
						
		return check;
    }
    
	function StrToDate(myDay) {
		var converted = Date.parse(myDay);
		var myDate = new Date(converted);
        return myDate;
    }
	
	function ValidateRadio(radio){
		var tr = false; 
		if (radio == null ) tr = false;
		
		for (var i=0; i<radio.length; i++ ){
			if ( radio[i].checked === true ) { 
				tr = true;
			}
		}
               		
		if (tr){
			$("span[id$='room_type_span']").css('color','#20201d');
		}
		else {
			$("span[id$='room_type_span']").css('color','#F13804');
		}
		
		return tr;
	}
</script>