"(siiighs)
hi clear texComment
hi link texComment Comment

syn region texZone
	\ start="\\begin{lstlisting}"
	\ end="\\end{lstlisting}\|%stopzone\>"
syn region texZone
	\ start="\\begin{assembly}"
	\ end="\\end{assembly}\|%stopzone\>"
