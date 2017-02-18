# jobproc

About
--

`jobproc` is provide the system like function with job API for vim8 and neovim.


Example
--

- with [Shiba command](https://github.com/rhysd/Shiba).

```vim
call jobproc#system('shiba ' . expand('%')) " => boot to markdown previewer of current buffer.
```

- with open command.

```vim
call jobproc#system('open http://google.com') " => boot to browser.
```

- Kana to U.S. when insert to normal mode. (with [keyboardSwitcher](https://github.com/Lutzifer/keyboardSwitcher))

**IME is able to toggle kana to U.S. when leave on insert and vim dont hand up.**

```vim
if executable('keyboardSwitcher')
  augroup SwitchIME
    autocmd!
    autocmd InsertLeave * :call josbproc#system('keyboardSwitcher select U.S.')
  augroup END
endif
```

LICENSE
---

[![maxmellon](https://avatars1.githubusercontent.com/u/9594376?v=3&u=8fd5ebc98054f4945469deef085ef244f3999206&s=80)](https://twitter.com/mozi_kke)

**Copyright (c) 2016 "MaxMEllon" Kento TSUJI**

Licensed under the [MIT license](./LICENSE.txt)
