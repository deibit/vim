Delete all ^M when loading a file from Windows

:%s/^M$//g

^M has to be entered by Ctrl+v+Ctrl+m

Yank all matches regex with grouping in a register
:%s/regex/\=setreg('A', submatch(0), 'V')/n
:%s/regex <--- possibly with grouping \(regex\)
.../\=setreg('register name', select group (number), 'V' = linewise
... ... /n <--- sandbox, it won't actually make changes

Write as sudo
:w !sudo tee %

Load an hex version of buffer and revert back
:%!xxd
:%!xxd -r

Fast format a json file or chunk
:%!python -m json.tool

Sort and filter duplicates
:sort u

Grep IP addresses from commandline

grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

** Format a XML document
silent %!xmllint --encode UTF-8 --format -