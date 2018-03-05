"Only do this when not done yet for this buffer
if exists("b:did_java_ftplugin")
	finish
endif
let b:did_java_ftplugin = 1

"if filename is ~/foo/Bar.java, this is Bar
let b:class_name = expand('%:t:r')
