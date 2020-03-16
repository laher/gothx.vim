
function! gothx#install#keyify()
  let argv = ['go', 'get', '-u', 'honnef.co/go/tools/cmd/keyify']
  call gothx#utils#run_maybe_async(argv)
endfunction

function! gothx#install#binaries()
  call gothx#install#keyify()
endfunction

