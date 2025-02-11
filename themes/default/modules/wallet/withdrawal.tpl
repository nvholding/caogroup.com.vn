<!-- BEGIN: main -->
<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->
<div class="panel panel-default">
<div class="panel-body">
<form class="form-horizontal" action="#" onsubmit="return check()" method="post">
    <input type="hidden" name="id" value="{ROW.id}" />
    <div class="form-group">
        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.money_out}</strong> <span class="red">(*)</span></label>
        <div class="col-sm-12 col-md-12">
            <input class="form-control" type="text" name="money_out" id="money_out" value="{ROW.money_out}" required="required" onkeyup="this.value=FormatNumber(this.value);" placeholder="1,000,000 VND" />
        </div>
		  <div class="col-sm-14 col-md-8">
			<label class="control-label"><strong>{LANG.money_in}: </strong>{ROW.money_in} </label>
        </div>
    </div>
	 <div class="form-group">
                <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.typemoney}</strong> <span class="red">(*)</span></label>
                <div class="col-sm-19 col-md-20">
                    <select class="form-control mw250" name="money_unit">
                        <!-- BEGIN: money_unit -->
                        <option value="{MONEY_UNIT.key}"{MONEY_UNIT.selected}>{MONEY_UNIT.title}</option>
                        <!-- END: money_unit -->
                    </select>
                </div>
     </div>
    <div class="form-group">
        <label class="col-sm-5 col-md-4 control-label"><strong>{LANG.transaction_info_1}</strong></label>
        <div class="col-sm-19 col-md-20">
            <textarea class="form-control" style="height:100px;" cols="75" rows="5" name="transaction_info">{ROW.transaction_info}</textarea>
        </div>
    </div>
    <div class="form-group" style="text-align: center"><input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" /></div>
</form>
</div></div>

<script type="text/javascript">
function check(){
		var money_out = document.getElementById("money_out").value;
		money_out = Number(money_out);
		if(money_out == 0){
			alert("Bận vui lòng kiểm tra lại thông tin");
			return false;
		}else if( money_out < 0){
			alert("Bận vui lòng nhập số tiền lớn hơn 0");
			return false;
		}
}
//<![CDATA[
    function nv_change_weight(id) {
        var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
        var new_vid = $('#id_weight_' + id).val();
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=withdrawal&nocache=' + new Date().getTime(), 'ajax_action=1&id=' + id + '&new_vid=' + new_vid, function(res) {
            var r_split = res.split('_');
            if (r_split[0] != 'OK') {
                alert(nv_is_change_act_confirm[2]);
            }
            window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=withdrawal';
            return;
        });
        return;
    }


    function nv_change_status(id) {
        var new_status = $('#change_status_' + id).is(':checked') ? true : false;
        if (confirm(nv_is_change_act_confirm[0])) {
            var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
            $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=withdrawal&nocache=' + new Date().getTime(), 'change_status=1&id='+id, function(res) {
                var r_split = res.split('_');
                if (r_split[0] != 'OK') {
                    alert(nv_is_change_act_confirm[2]);
                }
            });
        }
        else{
            $('#change_status_' + id).prop('checked', new_status ? false : true);
        }
        return;
    }


//]]>
</script>
<!-- END: main -->