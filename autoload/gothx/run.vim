" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! gothx#run#Run() abort
  let l:args = ['run', expand('%:t')]
  let l:cmd = ['go'] + l:args
  call gothx#utils#run_maybe_async(l:cmd)
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
