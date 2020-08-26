
if exists('g:fuzzymenu_loaded')
  call fuzzymenu#AddAll({
      \ 'Run': {'exec': 'call gothx#run#Run()'},
      \ 'Test': {'exec': 'call gothx#test#Test()'},
      \ 'Keyify (specify keys in structs)': {'exec': 'call gothx#keyify#Keyify()'},
      \ 'IfErr': {'exec': 'call gothx#iferr#IfErr()'},
      \ 'Fill Struct': {'exec': 'call gothx#fillstruct#FillStruct()'},
      \ 'Play (launch in browser)': {'exec': 'call gothx#play#Play()'},
      \ 'Alternate to/from test file': {'exec': "call gothx#alternate#Switch(0, '')"},
    \ },
    \ {'for': {'ft': 'go'}, 'tags':['go','gothx']})
endif
