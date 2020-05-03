
if &rtp =~ 'fuzzymenu.vim'
  call fuzzymenu#Add('Run', {'exec': 'call gothx#run#Run()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('Test', {'exec': 'call gothx#test#Test()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('Keyify (specify keys in structs)', {'exec': 'call gothx#keyify#Keyify()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('IfErr', {'exec': 'call gothx#iferr#IfErr()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('Fill Struct', {'exec': 'call gothx#fillstruct#FillStruct()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('Play (launch in browser)', {'exec': 'call gothx#play#Play()', 'for': 'go', 'tags': ['go']})
  call fuzzymenu#Add('Alternate to/from test file', {'exec': "call gothx#alternate#Switch(0, '')", 'for': 'go', 'tags': ['go']})
endif
