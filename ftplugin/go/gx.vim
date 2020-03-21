nnoremap <buffer> <silent> <Plug>ThxBrowseDoc :call gothx#gx#Gogx()<cr>

if !hasmapto('<Plug>ThxBrowseDoc', 'n')
   nmap <buffer> <silent> gx <Plug>ThxBrowseDoc
endif
