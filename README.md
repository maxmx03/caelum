`maxmx03/caelum`
# Caelum 🎨

Caelum is a Vim colorscheme inspired by the rich colors and intricate designs found in Catholic art during the Renaissance period, "Caelum" is a Latin word meaning "sky" or "heaven."

## Preview 👀

![Captura de tela de 2023-03-05 20-19-35](https://user-images.githubusercontent.com/50273941/222991738-e8ef9860-4038-447e-87e0-d499de63fd2a.png)

## Requirements 🛠️

for vim users
- [vim-polyglot](https://github.com/sheerun/vim-polyglot)

for neovim users
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)


## Installation 💻

**Vim**
```vim
" vim-plug
call plug#begin()
 Plug 'maxmx03/caelum'
call plug#end()
```

```vim
" .vimrc
set termguicolors
set background=dark

colorscheme caelum
```

**Neovim**
```lua
-- init.lua
vim.o.termguicolors = true
vim.o.background = 'dark'
```

```lua
-- packer.nvim
use 'maxmx03/caelum'
```

## Why use Caelum 🤔

When it comes to Vim colorschemes, there are a lot of options out there. However, many of them are outdated or lack support for the latest version of Vim. 
That's where Caelum comes in.

But Caelum isn't just about looks. We've put a lot of effort into making sure that the syntax highlighting is optimized for readability and ease of use. 
Whether you're coding late into the night or just spending a lot of time in Vim, Caelum is easy on the eyes and won't leave you feeling fatigued.


## Contributing 🤝

Caelum is an open-source project, and we welcome contributions from anyone in the Vim community. Here are some ways you can help:

- Fork the repository: If you have an idea for a new feature or improvement, feel free to fork the Caelum repository and submit a pull request with your changes.

- Add new syntax highlighting: We currently support a number of popular programming languages, but there are always more to add. If you notice that a particular language is missing, feel free to add it using the vim-polyglot plugin.

- Report bugs and issues: If you run into any problems with Caelum, please let us know by opening an issue on the GitHub repository. We'll do our best to address the issue as quickly as possible.

We appreciate all contributions to the project, no matter how big or small. Together, we can make Caelum the best Vim colorscheme out there!
