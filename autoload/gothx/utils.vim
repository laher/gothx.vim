

function! s:output_handler(job_id, data, event_type)
    if a:event_type == "exit"
      echom 'gothx: job done. Exit code: ' . a:data
    else
      echo a:job_id . ' ' . a:event_type
      echo join(a:data, "; ")
    endif
endfunction

function! gothx#utils#run_maybe_async(argv)
  if &rtp =~ 'async.vim'
    echom 'gothx: running async job'
    let jobid = async#job#start(a:argv, {
        \ 'on_stdout': function('s:output_handler'),
        \ 'on_stderr': function('s:output_handler'),
        \ 'on_exit': function('s:output_handler'),
    \ })
    if jobid > 0
        echom 'gothx: job started'
    else
        echom 'gothx: job failed to start'
    endif
  else
    echom 'async.vim not available. Running synchronously: ' . join(a:argv)
    let l:out = system(join(a:argv, ' '))
    echo l:out
  endif
endfunction

function! gothx#utils#chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction

function! gothx#utils#bytes_offset(line, col) abort
  if &encoding !=# 'utf-8'
    let l:sep = "\n"
    if &fileformat ==# 'dos'
      let l:sep = "\r\n"
    elseif &fileformat ==# 'mac'
      let l:sep = "\r"
    endif
    let l:buf = a:line ==# 1 ? '' : (join(getline(1, a:line-1), l:sep) . l:sep)
    let l:buf .= a:col ==# 1 ? '' : getline('.')[:a:col-2]
    return len(iconv(l:buf, &encoding, 'utf-8'))
  endif
  return line2byte(a:line) + (a:col-2)
endfunction

