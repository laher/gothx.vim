
""" open vim imports in browser
function! gothx#gx#Gogx()
  echo "hi"
  if getline('.') =~ '^import "' 
      let pkg = substitute(getline('.'), '\vimport "(.*)"', '\1', '')
      call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
        \ 'https://pkg.go.dev/'.pkg)), netrw#CheckIfRemote())
      return
  endif 
  if getline('.') =~ '\v^\s+".*"\s*$'
      let pkg = substitute(getline('.'), '\v\s+"(.*)"', '\1', '')
      call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
        \ 'https://pkg.go.dev/'.pkg)), netrw#CheckIfRemote())
      return
  endif

  """ usual behaviour for gx
  call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
           \ '<cfile>')), netrw#CheckIfRemote())
endfunction
