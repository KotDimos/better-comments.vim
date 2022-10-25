let g:delimiter_filetype = {
    \ 'cpp'         :   {'left_comment' : '/\/'},
    \ 'c'           :   {'left_comment' : '/\/'},
    \ 'cs'          :   {'left_comment' : '/\/'},
    \ 'sh'          :   {'left_comment' : '#'},
    \ 'javascript'  :   {'left_comment' : '/\/'},
    \ 'python'      :   {'left_comment' : '#'},
    \ 'vim'         :   {'left_comment' : '"'},
    \ }


" this is a comment
" * this is a comment
"* this is a comment
" ? this is a comment
"? this is a comment
" ! this is a comment
"! this is a comment
"! this is a comment
" todo: this is a comment 
" TODO: this is a comment 
"todo: this is a comment 
"TODO: this is a comment 
" todo this is a comment 
" TODO this is a comment 
"todo this is a comment 
" Todo this is a comment 


function! bettercomments#Enable()
    if &filetype == ''
        echo "BetterComments: file doesn't have file type"
        return 1
    endif

    if !has_key(g:delimiter_filetype, &filetype)
        echo 'BetterComments: not found file type in list'
        return 2
    endif

    let comment_symbol = g:delimiter_filetype[&filetype]['left_comment']
    let start_pattern = '\v\c\s*\' . comment_symbol
    let information_pattern = '\s*\*' 
    let question_pattern = '\s*\?' 
    let attention_pattern = '\s*\!' 
    let todo_pattern = '\s*(todo:|todo)' 
    
    execute 'syntax region BetterCommentsOther start=/' . start_pattern . '/ end=/$/'
    execute 'highlight BetterCommentsOther ctermfg=' . g:other_color_ctermfg
    execute 'highlight BetterCommentsOther guifg=' . g:other_color_guifg

    execute 'syntax region BetterCommentsInformation start=/' . start_pattern . information_pattern . '/ end=/$/'
    execute 'highlight BetterCommentsInformation ctermfg=' . g:information_color_ctermfg 
    execute 'highlight BetterCommentsInformation guifg=' . g:information_color_guifg
    
    execute 'syntax region BetterCommentsQuestion start=/' . start_pattern . question_pattern . '/ end=/$/'
    execute 'highlight BetterCommentsQuestion ctermfg=' . g:question_color_ctermfg 
    execute 'highlight BetterCommentsQuestion guifg=' . g:question_color_guifg

    execute 'syntax region BetterCommentsAttention start=/' . start_pattern . attention_pattern . '/ end=/$/'
    execute 'highlight BetterCommentsAttention ctermfg=' . g:attention_color_ctermfg
    execute 'highlight BetterCommentsAttention guifg=' . g:attention_color_guifg
 
    execute 'syntax region BetterCommentsTODO start=/' . start_pattern . todo_pattern . '/ end=/$/'
    execute 'highlight BetterCommentsTODO ctermfg=' . g:todo_color_ctermfg
    execute 'highlight BetterCommentsTODO guifg=' . g:todo_color_guifg

endfunction

function! bettercomments#Disable()

    highlight clear BetterCommentsOther 
    highlight clear BetterCommentsInformation
    highlight clear BetterCommentsQuestion
    highlight clear BetterCommentsAttention
    highlight clear BetterCommentsTODO
    
endfunction