

function! gothx#install#Update()
  call s:install_all_binaries(1)
endfunction

function! gothx#install#Install()
  call s:install_all_binaries(0)
endfunction

function! s:install_all_binaries(update)
  let keyify_addr = 'honnef.co/go/tools/cmd/keyify'
  let impl_addr = 'github.com/josharian/impl'
  let goplay_addr = 'github.com/haya14busa/goplay/cmd/goplay'
  let iferr_addr = 'github.com/koron/iferr'
  let argv = ['go', 'get']
  if a:update
    call add(argv, '-u')
  endif
  let argv += [ '-v', keyify_addr, impl_addr, goplay_addr, iferr_addr]
  call gothx#exec#run_maybe_async(argv)
endfunction

