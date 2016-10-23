"scp (winscp) script ftplugin
"more or less just command line syntax, soooo......

if exists('loaded_scp_ftplugin')
	finish
endif
let loaded_scp_ftplugin=1

"good enough
setlocal syntax=sh
