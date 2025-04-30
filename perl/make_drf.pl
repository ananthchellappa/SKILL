# `which perl` make_drf.pl

$sys_cmd = q{perl -p -e 's/solid/thickLine/ if /display\s+y\d\b/;' display.drf_all >> display.drf_thickLine};
system( $sys_cmd ) unless -e 'display.drf_thickLine';
$sys_cmd = q{perl -p -e 's/solid/snadashed/ if /display\s+y\d\b/;' display.drf_all >> display.drf_dashed};
system( $sys_cmd ) unless -e 'display.drf_dashed';
$sys_cmd = q{perl -p -e 'if (/display\s+y\d\b/){ s/outline\b/outlineStipple/; s/blank/cross/; }' display.drf_thickLine >> display.drf_pwrplot};
system( $sys_cmd ) unless -e 'display.drf_pwrplot';
$sys_cmd = q{grep -P 'display\s+y\d\b' display.drf_thickLine | perl -p -e 's/\h+/,/g;' | cut -d',' -f7,7};	# grep, convert to CSV, then extract column 7
$colors = `$sys_cmd`;
chomp $colors;
$colors =~ s/\s+/|/g;
$sys_cmd = q{perl -p -e 'if (/^(.+?display\s+)((?:}.$colors.q{)\b\s+\d+\s+\d+\s+\d+\s+)\)/ ){$new = "$1blink$2"; $new =~ s/blink(.)/blink\u$1/; print "$new t )\n";}' display.drf_thickLine >> display.drf_blink};

# take a line that looks like this
# ( display       cyan         0        255      255      )
# and change it to
# ( display       blinkCyan         0        255      255       t )

# but, how do you know what lines to hit? that comes from the lines looking like..
# ( display      y4                   blank      thickLine  cyan       cyan       outline   )
# you basically grep those and then convert them into a csv table and then pick the column of interest..



unless( -e 'display.drf_blink' ){
	system( $sys_cmd );
	$ins_lin_sty = q{ ( display       DHDashed     3          (1 1 1 1 0 0 ) )};

	$sys_cmd = q{perl -p -i -e 's/drDefineLineStyle\(/drDefineLineStyle(\n}.$ins_lin_sty.q{/;' display.drf_blink};
	system( $sys_cmd );
	$sys_cmd = q{perl -p -i -e 'if (/display\s+y\d\b/){ s/(thickLine\s+\S+\s+)(\S)(\S+\s+outline)/$1blink\u$2$3/; }' display.drf_blink };
	system( $sys_cmd );

	$ins_pkt_sty = q{ ( display      refSelPkt            solid      thickLine  yellow     yellow     outline   )};
	$ins_pkt_sty .= "\n".q{ ( display      dynamicHilight       blank      DHDashed   yellow     yellow     outline   )};
	$sys_cmd = q{perl -p -i -e 's/drDefinePacket\(/drDefinePacket(\n}.$ins_pkt_sty.q{/;' display.drf_blink};
	system( $sys_cmd );
}

