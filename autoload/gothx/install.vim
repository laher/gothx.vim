

function! gothx#install#binaries()
  let keyify_addr = 'honnef.co/go/tools/cmd/keyify'
  let impl_addr = 'github.com/josharian/impl'
  let argv = ['go', 'get', '-u', '-v', keyify_addr, impl_addr]
  call gothx#utils#run_maybe_async(argv)
endfunction

