
" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! gothx#fillstruct#FillStruct() abort
  let l:cmd = ['fillstruct',
      \ '-file', bufname(''),
      \ '-offset', gothx#utils#bytes_offset(line('.'), col('.')),
      \ '-line', line('.')]

  let l:pos = getpos('.')
  let l:out = system(l:cmd, bufnr('%')) " pass file into stdin

  if v:shell_error != 0
    call gothx#log#Error(l:out)
    return
  endif

  try
    let l:json = json_decode(l:out)
  catch
    call gothx#log#Error(l:out)
    return
  endtry
  try
    for l:struct in l:json
      let l:code = split(l:struct['code'], "\n")

      " Add any code before/after the struct.
      exe l:struct['start'] . 'go'
      let l:code[0] = getline('.')[:col('.')-1] . l:code[0]
      exe l:struct['end'] . 'go'
      let l:code[len(l:code)-1] .= getline('.')[col('.'):]

      " Indent every line except the first one; makes it look nice.
      let l:indent = repeat("\t", indent('.') / &tabstop)
      for l:i in range(1, len(l:code)-1)
        let l:code[l:i] = l:indent . l:code[l:i]
      endfor

      " Out with the old ...
      exe 'normal! ' . l:struct['start'] . 'gov' . l:struct['end'] . 'gox'
      " ... in with the new.
      call setline('.', l:code[0])
      call append('.', l:code[1:])
    endfor
  finally
    call setpos('.', l:pos)
  endtry

endfunction
