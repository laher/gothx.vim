# gothx.vim

A go plugin for vim/nvim, which only tries to do things that `gopls` doesn't do. thx.

The idea of this **Experimental** plugin is twofold:

 1. To provide features which are **not** currently supported by `gopls`.
   * You'll need to install a separate LSP client. See [below](#recommended-lsp-setup)
   * As `gopls` grows and matures, any overlapping features will be deprecated/removed from `gothx.vim` (deprecated and replaced with messages 'use your LSC for this').
 2. To focus on modules-aware tooling only. 
   * Avoid tools which are not actively embracing modules support (such as `guru`, which is being abandoned).

Note that this plugin doesn't hope to cover the same featureset as [vim-go](https://github.com/fatih/vim-go), (nor `govim`, probably). In fact, a third aim is to have a 'lighter' feature-set. gothx.vim will hopefully remain kinda small and nimble, and `:ThxUpdateBinaries` will hope to stay reasonably fast. 
I prefer using the same LSP client across different languages, so I'd sooner only use plugins which expressly avoid LSP-supplied features. vim-go's large feature-set overlaps with [recent] LSPs. You _can_ configure vim-go to disable those overlapping features - I have documented [those vim-go configuration options below](#disabling-lsp-supported-features-in-vim-go), just in case that's what you're really looking for. 

## Install in the usual way

Pre-requisites: Use vim8 or neovim. Set up an LSP client (with `gopls`), for all the usual goodies like go-to-definition, get-referrers, format-on-save, etc.

Install the plugin [along with async.vim] in the usual way (depending on what plugin manager you use).

For example, using vim-plug:

```viml
Plug 'prabirshrestha/async.vim'
Plug 'laher/gothx.vim'
```

### Installing/updating go-based tooling 

#### Install (once only)

```vim
:ThxInstallBinaries
```

#### Upgrade (periodically)

```vim
:ThxUpdateBinaries
```

NOTE: if you have [async.vim](https://github.com/prabirshrestha/async.vim) installed, `gothx.vim` will install your go things asynchronously … if not, it'll let you know it's blocking your UI thread.

## Configuration

If you want `:Thx…` commands to resemble vim-go's `:Go` commands instead:

`let g:gothx_command_prefix = 'Go'` (default = `Thx`)


## Features and Planned Features

You're free to map these commands to the vim-go names if you're not using vim-go - I just avoided it for compatibility reaons.

| Feature        | Done     | `vim-go` feature   | Related Tool                            | Notes  |
|----------------|----------|--------------------|-----------------------------------------|--------|
| `:ThxKeyify`   | [x]      | `:GoKeyify`        | [keyify](honnef.co/go/tools/cmd/keyify) |        | 
| `:ThxAlt`      | [x]      | `:GoAlternate`     | | This is just vim-script |
| `:ThxTest`     | [x]      | `:GoTest`          | | Basic version, no options |
| `:ThxRun`      | [x]      | `:GoRun`           | | Basic version, no options |
| `:ThxImpl`     | [x]      | `:GoImpl`          | [impl](https://github.com/josharian/impl) |  |
| `gx` on import | [x]      | -                  | | In vim, `gx` opens urls in a browser. Use it to opek gopkg.dev on import statements |
| `:ThxPlay`     | [x]      | `:GoPlay`          | | vim-go uses vim-script plus `curl`. I'm using a tool which doesn't support line selection (yet). |
| `:ThxIfErr`    | [x]     | `:GoIfErr`         | [iferr](https://github.com/koron/iferr) | Is this something `gopls` plans to cover? |
| `:ThxFillStruct` | [x]     | `:GoFillStruct`    | | |


| Planned          | Started | `vim-go` feature   | Related Tool                            | Notes  |
|------------------|---------|--------------------|-----------------------------------------|--------|
| `:ThxDoc`        | [ ]     | `:GoDoc`           | [gogetdoc](https://github.com/zmb3/gogetdoc)  | See `gx`, above. Seems like a good start. |
| `:ThxAddTags`    | [ ]     | `:GoAddTags`       | [gomodifytags](https://github.com/fatih/gomodifytags) | |

## LSP notes

The Vim ecosystem offers several LSP clients, including [LanguageClient-neovim](github.com/autozimu/LanguageClient-neovim), [vim-lsc](github.com/natebosch/vim-lsc), [coc.nvim](github.com/neoclide/coc.nvim). Some plugins offer LSP features too, such as [ALE](github.com/w0rp/ale) and vim-go. In theory you can use any of these, although I haven't tried them all myself.

For the time being I recommend vim-lsp, because in combination with `vim-lsp-settings` and `asymcomplete-lsp`, it offers easy installation of Language Servers, and LSP-based completion support.

### Recommended LSP Setup

To use `vim-lsp` using `vim-plug`, I recommend the following plugins:

```viml
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'laher/gothx.vim'
```

_note that this assumes `vim-plug`. Plugin managers tend to use a different function name for specifying plugins._

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

## Special love for vim-go

I *LOVE* the vim-go project. I fell in love with `vim` through that project, and between 2012-2020, it got me using `vim` or `nvim` as my main editor. vim-go was light-years ahead of other editors during the early days, and I think its 'lego blocks' architecture allowed for other plugin-writers to copy its features easily. Many thanks to the vim-go team, especially [fatih](https://github.com/fatih) and [bc](https://github.com/bhcleek). 

In the spirit of giving back, I'll make sure to offer PRs to vim-go for any features developed in gothx.vim . Please hold me to that.

### Disabling LSP-supported features in vim-go 

If you'd prefer to stick with vim-go but still avoid those feature-overlaps, the main thing you should do is to set `g:go_pls_enabled=0`. Note that there are a number of other LSP-supported features which vim-go solves in its own way. It seems like you can disable all of these using configuration settings. 
The following should get you most of the way there. Please let me know if you find others:

```
let g:go_gopls_enabled=0
let g:go_def_mapping_enabled=0
let g:go_doc_keywordprg_enabled=0
let g:go_fmt_autosave=0
```

I discussed with bc about automating these defaults based on a single item, or based on the presence of other LSPs. Given the variety of ways people are already using vim-go, `bc` understandably thought it would make the vim-go code and the user experience become more confusing, surprising, and harder to support. So, he updated the vim-go docs, and I've updated these docs, to clarify.


okthxvi!
