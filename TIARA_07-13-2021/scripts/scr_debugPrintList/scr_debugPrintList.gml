/// @param listID
/// @param title
function scr_debugPrintList() {

	var _list = argument[0];
	var _header = argument[1]; 

	var _str = ""; 
	for (var i = 0; i < ds_list_size(_list); ++i)
	{
		_str += string(ds_list_find_value(_list,i)) + ",\n";
	}

	show_message(_header + "\n\n" + _str); 


}
