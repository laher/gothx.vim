
let s:prefix = get(g:, "gothx_command_prefix", "Thx")

execute "command! -bang ".s:prefix."Alternate call gothx#alternate#Switch(<bang>0, '')"
execute "command! -nargs=0 ".s:prefix."Keyify call gothx#keyify#Keyify()"
execute "command! -nargs=0 ".s:prefix."InstallBinaries call gothx#install#Install()"
execute "command! -nargs=0 ".s:prefix."UpdateBinaries call gothx#install#Update()"
execute "command! -nargs=0 ".s:prefix."Test call gothx#test#Test()"
execute "command! -nargs=0 ".s:prefix."Run call gothx#run#Run()"
execute "command! -nargs=0 ".s:prefix."Play call gothx#play#Play()"
execute "command! -nargs=* -buffer ".s:prefix."Impl call gothx#impl#Impl(<f-args>)"
execute "command! -nargs=0 -buffer ".s:prefix."IfErr call gothx#iferr#IfErr()"
