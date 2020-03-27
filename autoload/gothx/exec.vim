
function! s:output_handler(job_id, data, event_type)
    if a:event_type == "exit"
      echom 'gothx: job done. Exit code: ' . a:data
    else
      for l in a:data
        put =(l)
      endfor
      " put =(join(a:data, "\n"))
      " put =(join(a:data, "; "))
      "call writefile(a:data, glob('/tmp/out.log'), 'a')
    endif
endfunction

function! s:scratch()
    let bnr = bufexists('scratch')
    "echo 'buffer: ' .bnr
    if bnr > 0
      bd scratch
    endif
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    "setlocal nobuflisted
    "lcd ~
    file scratch
endfunction

function! gothx#exec#run_maybe_async(argv)

  if &rtp =~ 'async.vim'
    call s:scratch()
    put ='gothx: running async job'
    "execute '!date > /tmp/out.log 2>&1'
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
