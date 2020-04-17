
if &rtp =~ 'fzm.vim'
  call fzm#Add('Go: Run', {'exec': 'call gothx#run#Run()', 'for': 'go'})
  call fzm#Add('Go: Test', {'exec': 'call gothx#test#Test()', 'for': 'go'})
  call fzm#Add('Go: Keyify', {'exec': 'call gothx#keyify#Keyify()', 'for': 'go'})
  call fzm#Add('Go: IfErr', {'exec': 'call gothx#iferr#IfErr()', 'for': 'go'})
  call fzm#Add('Go: FillStruct', {'exec': 'call gothx#fillstruct#FillStruct()', 'for': 'go'})
  call fzm#Add('Go: Play', {'exec': 'call gothx#play#Play()', 'for': 'go'})
  call fzm#Add('Go: Alternate', {'exec': 'call gothx#alternate#Switch()', 'for': 'go'})
endif
