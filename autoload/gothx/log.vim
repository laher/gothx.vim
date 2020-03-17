
" Log a message to the screen and highlight it with the group in a:hi.
"
" The message can be a list or string; every line with be :echomsg'd separately.
function! s:log(msg, hi)
  let l:msg = []
  if type(a:msg) != type([])
    let l:msg = split(a:msg, "\n")
  else
    let l:msg = a:msg
  endif

  " Tabs display as ^I or <09>, so manually expand them.
  let l:msg = map(l:msg, 'substitute(v:val, "\t", "        ", "")')

  exe 'echohl ' . a:hi
  for line in l:msg
    echom "gothx: " . line
  endfor
  echohl None
endfunction

function! gothx#log#OK(msg)
  call s:log(a:msg, 'Function')
endfunction
function! gothx#log#Error(msg)
  call s:log(a:msg, 'ErrorMsg')
endfunction
function! gothx#log#Warning(msg)
  call s:log(a:msg, 'WarningMsg')
endfunction
function! gothx#log#Info(msg)
  call s:log(a:msg, 'Debug')
endfunction

