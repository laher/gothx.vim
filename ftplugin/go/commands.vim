
let s:prefix = get(g:, "gothx_command_prefix", "Gothx")

execute "command! -bang ".s:prefix."Alternate call gothx#alternate#Switch(<bang>0, '')"
execute "command! -nargs=0 ".s:prefix."Keyify call gothx#keyify#Keyify()"
execute "command! -nargs=0 ".s:prefix."InstallBinaries call gothx#install#binaries()"
