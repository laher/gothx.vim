# gothx.vim

A go plugin for vim/nvim, which only tries to do things that `gopls` doesn't do. thx.

The idea of this **Experimental** plugin is:

 * To provide features not currently supported by `gopls`, and to focus on modules-aware tooling. 
 * To avoid tools which are not actively embracing modules support (such as `guru`).
 * As `gopls` grows and matures, overlapping features will be deprecated/removed from `gothx.vim` (deprecated and replaced with messages 'use your LSC for this').

Note that this plugin doesn't ever hope to cover the same featureset as [vim-go](https://github.com/fatih/vim-go), (nor `govim`). 

However, vim-go's large featureset overlaps with [more recent] LSPs, making it an awkward fit for a polymath like me. I like using the same LSP client across different languages, so I'd sooner only use other plugins which expressly avoid LSP-supplied features.

## Special love for vim-go

I *LOVE* the vim-go project. I fell in love with `vim` through that project, and between 2012-2020, it got me using `vim` or `nvim` as my main editor. Many thanks to that team, especially [fatih](https://github.com/fatih) and [bc](https://github.com/bhcleek). If you ever find an way to adjust vim-go with 'getting out of the way of the Language Server' in mind, then I'm keen to embrace it again. 

## Install in the usual way

For example, using vim-plug:

```viml
Plug 'prabirshrestha/async.vim'
Plug 'laher/gothx.vim'
```

### Installing/updating binaries (once only)

```vim
:GothxInstallBinaries
```

NOTE: if you have [async.vim](https://github.com/prabirshrestha/async.vim) installed, `gothx.vim` will install your go things asynchronously … if not, it'll let you know it's blocking your UI thread.

## Configuration

If you want `:Gothx` commands to resemble vim-go's `:Go` commands instead:

`let g:gothx_command_prefix = 'Go'` (default = `Gothx`)


## Features and Planned Features

You're free to map these commands to the vim-go names if you're not using vim-go - I just avoided it for compatibility reaons.

| Feature      | Implemented | `vim-go` feature | Related Tool                            | Notes  |
|--------------|----------|--------------------|-----------------------------------------|--------|
| `:GothxKeyify` | [x]    | `:GoKeyify`        | [keyify](honnef.co/go/tools/cmd/keyify) |        | 
| `:GothxAlt`    | [x]    | `:GoAlternate`     | | This is just vim-script |
| `:GothxTest`   | [x]    | `:GoTest`          | | Basic version, no options |
| `:GothxRun`    | [x]    | `:GoRun`           | | Basic version, no options |
| `:GothxImpl`   | [x]    | `:GoImpl`          | [impl](https://github.com/josharian/impl) |  |
| `gx` on import | [ ]    | - | | In vim, `gx` opens urls in a browser. Use it to opek gopkg.dev on import statements |
| `:GothxDoc`    | [ ]    | `:GoDoc`           | [gogetdoc](https://github.com/zmb3/gogetdoc)  | See `gx`, above. Seems like a good start. |
| `:GothxAddTags`| [ ]    | `:GoAddTags`       | | |
| `:GothxPlay`   | [ ]    | `:GoPlay`          | | This is just vim-script |
| `:GothxIfErr`  | [ ]    | `:GoIfErr`         | | |

## LSP notes

The Vim ecosystem offers several LSP clients, including [LanguageClient-neovim](github.com/autozimu/LanguageClient-neovim), [vim-lsc](github.com/natebosch/vim-lsc), [coc.nvim](github.com/neoclide/coc.nvim). Some plugins offer LSP features too, such as [ALE](github.com/w0rp/ale) and vim-go.

For the time being I recommend vim-lsp, because in combination with `vim-lsp-settings` and `asymcomplete-lsp`, it offers easy installation of Language Servers, and LSP-based completion support.

To use `vim-lsp` using `vim-plug`, I recommend the following plugins:

```viml
Plug 'https://github.com/prabirshrestha/async.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/mattn/vim-lsp-settings'
```

_note that this assumes `vim-plug`. Plugin manager tends to use a different function name for specifying plugins._

## Out of scope

 * GoReferrers, GoDef, GoInfo, GoFmt, GoRename, ...
 * The following features as supported by gopls (March 2020):
    * check : show diagnostic results for the specified file
    * folding_ranges : display selected file's folding ranges
    * format : format the code according to the go standard
    * highlight : display selected identifier's highlights
    * implementation : display selected identifier's implementation
    * imports : updates import statements
    * links : list links in a file
    * prepare_rename : test validity of a rename operation at location
    * query : answer queries about go source code
    * references : display selected identifier's references
    * rename : rename selected identifier
    * signature : display selected identifier's signature
    * fix : apply suggested fixes
    * symbols : display selected file's symbols
 * `guru`: various vim-go commands (e.g. `:GoChannelPeers`, `GoCallees`, `GoPointsTo`, …) use `guru`, which is not modules-aware.

## NOTES

 * Totally copied from [vim-go](https://github.com/fatih/vim-go) and various [mattn](https://github.com/mattn) projects like [gorename](https://github.com/mattn/vim-gorename).
 * This plugin can be used to replace parts of vim-go functionality, in the age of LSP. 
 * See also:
   * https://github.com/mattn/vim-goimports (covered by LSP)
   * https://github.com/mattn/vim-gorename (covered by LSP)
   * https://github.com/mattn/vim-gorun (similar feature included in gothx.vim)
   * https://github.com/laher/gokeyify.vim (similar feature included in gothx.vim)
   * https://github.com/mattn/vim-goimpl (similar features included in gothx.vim)
   * https://github.com/mattn/vim-goaddtags 
   * https://github.com/mattn/vim-gosrc
   * https://github.com/mattn/go-errcheck-vim

okthxvi!
