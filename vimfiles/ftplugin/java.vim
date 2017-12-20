"Only do this when not done yet for this buffer
if exists("b:did_java_ftplugin")
	finish
endif
let b:did_java_ftplugin = 1

let b:junit_imports = "import static org.junit.jupiter.api.Assertions.*;\n"
	\ . "import org.junit.jupiter.api.Test;\n"

"if filename is ~/foo/Bar.java, this is Bar
let b:class_name = expand('%:t:r')
let b:class_boilerplate = "public class " . b:class_name . " {\n}"

"if the buffer is empty
if line('$') == 1 && getline(1) == ''
	"put in our boilerplate
	exe "normal! \"=b:class_boilerplate\<CR>p"
	if matchend(b:class_name, 'Test') == strlen(b:class_name)
		exe "normal! \"=b:junit_imports\<CR>P"
	endif
endif
