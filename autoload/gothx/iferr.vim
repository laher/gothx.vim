" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! gothx#iferr#IfErr()
  let l:cmd = printf('iferr -pos %s', gothx#utils#bytes_offset(line('.'), col('.')))
  let l:out = system(l:cmd, bufnr('%'))
  if v:shell_error != 0
    call gothx#log#Error(l:out)
    return
  endif
  if len(l:out) == 1
    return
  endif
  if getline('.') =~ '^\s*$'
    silent delete _
    silent normal! k
  endif
  let l:pos = getcurpos()
  call append(l:pos[1], split(l:out, "\n"))
  silent normal! j=2j
  call setpos('.', l:pos)
  silent normal! 4j
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
