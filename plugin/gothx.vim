
if &rtp =~ 'fzm.vim'
  call fzm#Add('Go: Run', {'exec': 'call gothx#run#Run()', 'for': 'go'})
  call fzm#Add('Go: Test', {'exec': 'call gothx#test#Test()', 'for': 'go'})
  call fzm#Add('Go: Keyify', {'exec': 'call gothx#keyify#Keyify()', 'for': 'go'})
endif
