"(siiighs)
hi clear texComment
hi link texComment Comment
highlight clear Conceal
syn match texStatement "\\[a-zA-Z_:@]\+"

syn region texZone
	\ start="\\begin{lstlisting}"
	\ end="\\end{lstlisting}\|%stopzone\>"
syn region texZone
	\ start="\\begin{assembly}"
	\ end="\\end{assembly}\|%stopzone\>"

if has('conceal')
  syn match texMathSymbol '\\after\>' contained conceal cchar=∘
  syn match texMathSymbol '\\Re\>' contained conceal cchar=ℝ
  syn match texMathSymbol '\\Int\>' contained conceal cchar=ℤ
  syn match texMathSymbol '\\Rat\>' contained conceal cchar=ℚ
  syn match texMathSymbol '\\Nat\>' contained conceal cchar=ℕ
  syn match texMathSymbol '\\Comp\>' contained conceal cchar=ℂ
  syn match texMathSymbol '\\powerset\>' contained conceal cchar=℘
  syn match texMathSymbol '\\intersection\>' contained conceal cchar=∩
  syn match texMathSymbol '\\union\>' contained conceal cchar=∪
  syn match texMathSymbol '\\And\>' contained conceal cchar=∧
  syn match texMathSymbol '\\Or\>' contained conceal cchar=∨
  syn match texMathSymbol '\\cross\>' contained conceal cchar=×
  syn match texMathSymbol '\\emptyset\>' contained conceal cchar=∅
  syn match texMathSymbol '\\coloneq\>' contained conceal cchar=≔
end

hi clear texOnlyMath
