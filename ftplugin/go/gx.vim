nnoremap <buffer> <silent> <Plug>GothxBrowseDoc :call gothx#gx#Gogx()<cr>

if !hasmapto('<Plug>GothxBrowseDoc', 'n')
   nmap <buffer> <silent> gx <Plug>GothxBrowseDoc
endif
