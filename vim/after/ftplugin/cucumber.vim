setlocal shiftwidth=2
setlocal tabstop=2

set fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set fdm=expr
