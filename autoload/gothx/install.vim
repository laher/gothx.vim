
function! gothx#install#gokeyifyinstall()
  let argv = ['go', 'get', '-u', 'honnef.co/go/tools/cmd/keyify']
  call gothx#utils#run_maybe_async(argv)
endfunction


command! -nargs=0 GoThxInstall call gothx#install#gokeyifyinstall()
