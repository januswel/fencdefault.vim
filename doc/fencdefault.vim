*fencdefault.txt*	Plugin to set default fileencoding
                                                Last change: 2014 Sep 21.

SYNOPSIS						*fencdefault-synopsis*
>
	" 'fileencoding' will set to the value of 'encoding'.
	:edit onlyascii.txt

	" in your .vimrc
	let g:fencdefault_default = 'cp932'
	" 'fileencoding' will be "cp932".
	:edit onlyascii.txt

DESCRIPTION						*fencdefault-description*

Plugin to set default 'fileencoding' and force it on files that contains only
ASCII characters.

DEPENDENCIES						*fencdefault-dependencies*

{only available when your VIM has the |+autocmd| and |+multi_byte| feature}

PROVIDES						*fencdefault-provides*

Augroups:
fencdefault
	All of the autocmds provided by this plugin is located in
	"fencdefault".  To disable in a certain instance of VIM, hit the
	following command: >

		:autocmd! fencdefault

SETTINGS						*fencdefault-settings*

DEFAULT
	When "g:fencdefault_default" doesn't exist, a value of 'encoding' is
	used as default.

Variables:
g:fencdefault_default
	A name of default encoding.  Specify in String.  See |encoding-values|
	for valid values.  With an invalid value, an error will occur at the
	writing the file.  E.g.: >

		" OK
		let g:fencdefault_default = 'sjis'
		let g:fencdefault_default = 'shift_jis'

		" NG
		let g:fencdefault_default = 'shiftjis'

DISABLES						*fencdefault-disables*

Variables:
g:loaded_fencdefault
	When exists, does nothing.  Use to disable this plugin.


==============================================================================

Author
	janus_wel <janus.wel.3@gmail.com>
Copyright
	(c) 2014 by janus_wel
License
	This material may be distributed only subject to the terms and
	conditions set forth in the Open Publication License, v1.0 or later
	(the latest version is presently available at
	http://www.opencontent.org/openpub/).

vim:tw=78:ts=8:noet:ft=help:norl:
