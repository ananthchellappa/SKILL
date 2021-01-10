procedure( proc_alt_sh_scroll_up()
	if( geGetSelSet()
	then
		txpose_inst_label('t)
	else
		updateTemp( 't )
	)
)

procedure( proc_alt_sh_scroll_down()
	if( geGetSelSet()
	then
		txpose_inst_label(nil)
	else
		updateTemp( nil )
	)
)


