
if &rtp =~ 'fuzzymenu.vim'
  call fuzzymenu#Add('Go: Run', {'exec': 'call gothx#run#Run()', 'for': 'go'})
  call fuzzymenu#Add('Go: Test', {'exec': 'call gothx#test#Test()', 'for': 'go'})
  call fuzzymenu#Add('Go: Keyify', {'exec': 'call gothx#keyify#Keyify()', 'for': 'go'})
  call fuzzymenu#Add('Go: IfErr', {'exec': 'call gothx#iferr#IfErr()', 'for': 'go'})
  call fuzzymenu#Add('Go: FillStruct', {'exec': 'call gothx#fillstruct#FillStruct()', 'for': 'go'})
  call fuzzymenu#Add('Go: Play', {'exec': 'call gothx#play#Play()', 'for': 'go'})
  call fuzzymenu#Add('Go: Alternate', {'exec': "call gothx#alternate#Switch(0, '')", 'for': 'go'})
endif
