#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.shift_right_to_ctrl_a 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.vimnormal_jk_toggle 1
/bin/echo -n .
$cli set private.jk_to_ctrla_double_quote 1
/bin/echo -n .
/bin/echo