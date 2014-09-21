" vim plugin file
" Filename:     fencdefault.vim
" Maintainer:   janus_wel <janus.wel.3@gmail.com>
" License:      MIT License {{{1
"   See under URL.  Note that redistribution is permitted with LICENSE.
"   https://github.com/januswel/fencdefault.vim/blob/master/LICENSE

" preparation {{{1
" check if this plugin is already loaded or not
if exists('loaded_fencdefault')
    finish
endif
let loaded_fencdefault = 1

" check vim has required features
if !(has('autocmd') && has('multi_byte'))
    finish
endif

" reset the value of 'cpoptions' for portability
let s:save_cpoptions = &cpoptions
set cpoptions&vim

" main {{{1
" functions
function! s:ResetFileEncoding2Default()
    try
        let def = s:GetDefault()
    catch
        echoerr v:exception
    endtry
    if               &fileencoding !=# def
                \ && search('[^\x01-\x7e]', 'n') == 0
        let &fileencoding = def
    endif
endfunction

function! s:GetDefault()
    if exists('g:fencdefault_default')
        if type(g:fencdefault_default) == 1
            return g:fencdefault_default
        else
            throw 'g:fencdefault_default must be String'
        endif
    endif
    return &encoding
endfunction

" autocmds
augroup fencdefault
    autocmd! fencdefault

    autocmd BufReadPost * call s:ResetFileEncoding2Default()
augroup END

" post-processing {{{1
" restore the value of 'cpoptions'
let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions

" }}}1
" vim: ts=4 sw=4 sts=0 et fdm=marker fdc=3
