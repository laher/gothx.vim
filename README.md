# gothx.vim

A go plugin for vim/nvim, which only tries to do things that `gopls` doesn't do. thx.

The idea of this **Experimental** plugin is to provide features not currently supported by `gopls`. As `gopls` grows and matures, relevant features will be aggressively removed from `gothx.vim` (deprecated and replaced with messages 'use your LSC for this').

Note that this plugin doesn't ever hope to cover the same featureset as [vim-go](https://github.com/fatih/vim-go), (nor `govim`). However, vim-go's featureset overlaps with [more recent] LSPs, making it an awkward fit for a polymath like me. I like using the same LSP client across different languages, so I'd sooner only use other plugins which expressly avoid LSP-supplied features.

## Special love for vim-go

I *LOVE* the vim-go project. I fell in love with `vim` through that project, and between 2012-2020, it got me using `vim` or `nvim` as my main editor. Many thanks to that team, especially [fatih](https://github.com/fatih) and [bc](https://github.com/bhcleek). If you ever find an way to adjust vim-go with 'getting out of the way of the Language Server' in mind, then I'm keen to embrace it again. 

## Install in the usual way

For example, using vim-plug:

```
Plug 'laher/gothx.vim'
```

### Installing/updating binaries (once only)

```
:GoThxInstallBinaries
```

NOTE: if you have [async.vim](https://github.com/prabirshrestha/async.vim) installed, `gothx.vim` will install your go things asynchronously … if not, it'll let you know it's blocking your UI thread.

## Features

| Feature      | Status | `vim-go` feature | Related Tool                            | Notes  |
|--------------|--------|------------------|-----------------------------------------|--------|
| `:GoThxKeyify` | [x]    | `:GoKeyify`        | [keyify](honnef.co/go/tools/cmd/keyify) |        | 
| `:GoThxDoc`    | [ ]    | `:GoDoc`           | [gogetdoc](x)          | Watch out for gopkg.dev |
| `:GoThxAddTags` | [ ]   | `:GoAddTags`       | | |

## NOTES

 * Totally copied from [vim-go](https://github.com/fatih/vim-go) and various [mattn](https://github.com/mattn) projects like [gorename](https://github.com/mattn/vim-gorename).
 * This plugin can be used to replace parts of vim-go functionality, in the age of LSP. 
 * See also:
   * https://github.com/mattn/vim-goimports (covered by LSP)
   * https://github.com/mattn/vim-gorename (covered by LSP)
   * https://github.com/mattn/vim-goaddtags 
   * https://github.com/mattn/vim-gorun
   * https://github.com/mattn/vim-goimpl
   * https://github.com/mattn/vim-gosrc
   * https://github.com/mattn/go-errcheck-vim
   * https://github.com/laher/gokeyify.vim
