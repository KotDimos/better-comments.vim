function s:InitVariable(var, value)
    if !exists(a:var)
        execute 'let ' . a:var . ' = ' . string(a:value)
    endif
endfunction

" guifg variables
call s:InitVariable('g:other_color_guifg', 'green')
call s:InitVariable('g:information_color_guifg', 'yellow')
call s:InitVariable('g:question_color_guifg', 'blue')
call s:InitVariable('g:attention_color_guifg', 'red')
call s:InitVariable('g:todo_color_guifg', 'cyan')

" ctermfg variables
call s:InitVariable('g:other_color_ctermfg', 'green')
call s:InitVariable('g:information_color_ctermfg', 'yellow')
call s:InitVariable('g:question_color_ctermfg', 'blue')
call s:InitVariable('g:attention_color_ctermfg', 'red')
call s:InitVariable('g:todo_color_ctermfg', 'cyan')

call s:InitVariable('g:other_color_enable', '1')
call s:InitVariable('g:information_color_enable', '1')
call s:InitVariable('g:question_color_enable', '1')
call s:InitVariable('g:attention_color_enable', '1')
call s:InitVariable('g:todo_color_enable', '1')

call s:InitVariable('g:disable_messages', '0')

command! -nargs=0 BetterCommentsEnable call bettercomments#Enable()
command! -nargs=0 BetterCommentsDisable call bettercomments#Disable()



