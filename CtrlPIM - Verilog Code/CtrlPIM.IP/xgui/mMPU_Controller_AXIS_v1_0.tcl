# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "col_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "crossbar_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "dest_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "imm_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "iw_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "no_of_bitlines" -parent ${Page_0}
  ipgui::add_param $IPINST -name "num_crossbar" -parent ${Page_0}
  ipgui::add_param $IPINST -name "regsize" -parent ${Page_0}
  ipgui::add_param $IPINST -name "row_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "src_size" -parent ${Page_0}


}

proc update_PARAM_VALUE.col_size { PARAM_VALUE.col_size } {
	# Procedure called to update col_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.col_size { PARAM_VALUE.col_size } {
	# Procedure called to validate col_size
	return true
}

proc update_PARAM_VALUE.crossbar_width { PARAM_VALUE.crossbar_width } {
	# Procedure called to update crossbar_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.crossbar_width { PARAM_VALUE.crossbar_width } {
	# Procedure called to validate crossbar_width
	return true
}

proc update_PARAM_VALUE.dest_size { PARAM_VALUE.dest_size } {
	# Procedure called to update dest_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.dest_size { PARAM_VALUE.dest_size } {
	# Procedure called to validate dest_size
	return true
}

proc update_PARAM_VALUE.imm_size { PARAM_VALUE.imm_size } {
	# Procedure called to update imm_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.imm_size { PARAM_VALUE.imm_size } {
	# Procedure called to validate imm_size
	return true
}

proc update_PARAM_VALUE.iw_size { PARAM_VALUE.iw_size } {
	# Procedure called to update iw_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.iw_size { PARAM_VALUE.iw_size } {
	# Procedure called to validate iw_size
	return true
}

proc update_PARAM_VALUE.no_of_bitlines { PARAM_VALUE.no_of_bitlines } {
	# Procedure called to update no_of_bitlines when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.no_of_bitlines { PARAM_VALUE.no_of_bitlines } {
	# Procedure called to validate no_of_bitlines
	return true
}

proc update_PARAM_VALUE.num_crossbar { PARAM_VALUE.num_crossbar } {
	# Procedure called to update num_crossbar when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.num_crossbar { PARAM_VALUE.num_crossbar } {
	# Procedure called to validate num_crossbar
	return true
}

proc update_PARAM_VALUE.regsize { PARAM_VALUE.regsize } {
	# Procedure called to update regsize when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.regsize { PARAM_VALUE.regsize } {
	# Procedure called to validate regsize
	return true
}

proc update_PARAM_VALUE.row_size { PARAM_VALUE.row_size } {
	# Procedure called to update row_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.row_size { PARAM_VALUE.row_size } {
	# Procedure called to validate row_size
	return true
}

proc update_PARAM_VALUE.src_size { PARAM_VALUE.src_size } {
	# Procedure called to update src_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.src_size { PARAM_VALUE.src_size } {
	# Procedure called to validate src_size
	return true
}


proc update_MODELPARAM_VALUE.iw_size { MODELPARAM_VALUE.iw_size PARAM_VALUE.iw_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.iw_size}] ${MODELPARAM_VALUE.iw_size}
}

proc update_MODELPARAM_VALUE.src_size { MODELPARAM_VALUE.src_size PARAM_VALUE.src_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.src_size}] ${MODELPARAM_VALUE.src_size}
}

proc update_MODELPARAM_VALUE.dest_size { MODELPARAM_VALUE.dest_size PARAM_VALUE.dest_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.dest_size}] ${MODELPARAM_VALUE.dest_size}
}

proc update_MODELPARAM_VALUE.imm_size { MODELPARAM_VALUE.imm_size PARAM_VALUE.imm_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.imm_size}] ${MODELPARAM_VALUE.imm_size}
}

proc update_MODELPARAM_VALUE.col_size { MODELPARAM_VALUE.col_size PARAM_VALUE.col_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.col_size}] ${MODELPARAM_VALUE.col_size}
}

proc update_MODELPARAM_VALUE.row_size { MODELPARAM_VALUE.row_size PARAM_VALUE.row_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.row_size}] ${MODELPARAM_VALUE.row_size}
}

proc update_MODELPARAM_VALUE.crossbar_width { MODELPARAM_VALUE.crossbar_width PARAM_VALUE.crossbar_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.crossbar_width}] ${MODELPARAM_VALUE.crossbar_width}
}

proc update_MODELPARAM_VALUE.regsize { MODELPARAM_VALUE.regsize PARAM_VALUE.regsize } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.regsize}] ${MODELPARAM_VALUE.regsize}
}

proc update_MODELPARAM_VALUE.num_crossbar { MODELPARAM_VALUE.num_crossbar PARAM_VALUE.num_crossbar } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.num_crossbar}] ${MODELPARAM_VALUE.num_crossbar}
}

proc update_MODELPARAM_VALUE.no_of_bitlines { MODELPARAM_VALUE.no_of_bitlines PARAM_VALUE.no_of_bitlines } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.no_of_bitlines}] ${MODELPARAM_VALUE.no_of_bitlines}
}

