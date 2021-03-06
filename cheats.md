Vim freezes
===========

Probably a <ctrl-s> was pressed, which is a scroll-locking signal in terminals
Just press <ctrl-q> to unlock the cursor.


Delete all ^M when loading a file from Windows
==============================================

:%s/^M$//g

^M has to be entered by Ctrl+v+Ctrl+m

Yank all matches regex with grouping in a register
==================================================
:%s/regex/\=setreg('A', submatch(0), 'V')/n
:%s/regex <--- possibly with grouping \(regex\)
.../\=setreg('register name', select group (number), 'V' = linewise
... ... /n <--- sandbox, it won't actually make changes

Write as sudo
=============
:w !sudo tee %

Load an hex version of buffer and revert back
=============================================
:%!xxd
:%!xxd -r

Fast format a json file or chunk
================================
:%!python -m json.tool

Sort and filter duplicates
==========================
:sort u

Grep IP addresses from commandline
==================================

grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

Format a XML document
========================
silent %!xmllint --encode UTF-8 --format -

Apply a macro in a range
========================

:3,15norm! @a

Will apply macro in register 'a' from line 3 to line 15

Clean a register
================

:exec setreg('<register>', [])

Clean all registers
===================

let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor


Good links
==========

[Using external tools with Vim](https://www.reddit.com/r/vim/comments/7bj837/favorite_console_tools_to_use_with_vim/)
[Reddit's Vim Wiki](https://www.reddit.com/r/vim/wiki/index)
[The Patient's Vimmer](http://romainl.github.io/the-patient-vimmer/)
[Vi-improved](https://www.vi-improved.org/)
[Power Of Vim](https://gist.github.com/ajh17)

