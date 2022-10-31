let g:delimiter_filetype = {
    \ 'cpp'                 :   {'left' : '/\/', 'right' : '$'},
    \ 'c'                   :   {'left' : '/\/', 'right' : '$'},
    \ 'cs'                  :   {'left' : '/\/', 'right' : '$'},
    \ 'sh'                  :   {'left' : '#', 'right' : '$'},
    \ 'javascript'          :   {'left' : '/\/', 'right' : '$'},
    \ 'typescript'          :   {'left' : '/\/', 'right' : '$'},
    \ 'python'              :   {'left' : '#', 'right' : '$'},
    \ 'vim'                 :   {'left' : '"', 'right' : '$'},
    \ 'java'                :   {'left' : '/\/', 'right' : '$'},
    \ 'php'                 :   {'left' : '/\/', 'right' : '$'},
    \ 'go'                  :   {'left' : '/\/', 'right' : '$'},
    \ 'dart'                :   {'left' : '/\/', 'right' : '$'},
    \ 'scala'               :   {'left' : '/\/', 'right' : '$'},
    \ 'dockerfile'          :   {'left' : '#', 'right' : '$'},
    \ 'yaml.ansible'        :   {'left' : '#', 'right' : '$'},
    \ 'yaml.docker-compose' :   {'left' : '#', 'right' : '$'},
    \ 'yaml'                :   {'left' : '#', 'right' : '$'},
    \ 'puppet'              :   {'left' : '#', 'right' : '$'},
    \ 'awk'                 :   {'left' : '#', 'right' : '$'},
    \ 'sql'                 :   {'left' : '--', 'right' : '$'},
    \ 'terraform'           :   {'left' : '#', 'right' : '$'},
    \ 'ruby'                :   {'left' : '#', 'right' : '$'},
    \ 'kotlin'              :   {'left' : '/\/', 'right' : '$'},
    \ 'r'                   :   {'left' : '#', 'right' : '$'},
    \ 'rust'                :   {'left' : '/\/', 'right' : '$'},
    \ 'nginx'               :   {'left' : '#', 'right' : '$'},
    \ 'markdown'            :   {'left' : '<!--', 'right' : '-->'},
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


if exists('g:delimiter_filetype_custom')
    call extend(g:delimiter_filetype, g:delimiter_filetype_custom)
endif

function! bettercomments#Enable()
    if &filetype == ''
        echo "BetterComments: file doesn't have file type"
        return 1
    endif

    if !has_key(g:delimiter_filetype, &filetype)
        echo 'BetterComments: not found file type in list'
        return 2
    endif

    let comment_symbol_start = g:delimiter_filetype[&filetype]['left']
    let comment_symbol_end = g:delimiter_filetype[&filetype]['right']
    let start_pattern = '\v\c\s*\' . comment_symbol_start
    let end_pattern = comment_symbol_end
    let information_pattern = '\s*\*' 
    let question_pattern = '\s*\?' 
    let attention_pattern = '\s*\!' 
    let todo_pattern = '\s*(todo:|todo)' 
    
    execute 'syntax region BetterCommentsOther start=/' . start_pattern . '/ end=/' . end_pattern . '/'
    execute 'highlight BetterCommentsOther ctermfg=' . g:other_color_ctermfg
    execute 'highlight BetterCommentsOther guifg=' . g:other_color_guifg

    execute 'syntax region BetterCommentsInformation start=/' . start_pattern . information_pattern . '/ end=/' . end_pattern . '/'
    execute 'highlight BetterCommentsInformation ctermfg=' . g:information_color_ctermfg
    execute 'highlight BetterCommentsInformation guifg=' . g:information_color_guifg

    execute 'syntax region BetterCommentsQuestion start=/' . start_pattern . question_pattern . '/ end=/' . end_pattern . '/'
    execute 'highlight BetterCommentsQuestion ctermfg=' . g:question_color_ctermfg
    execute 'highlight BetterCommentsQuestion guifg=' . g:question_color_guifg

    execute 'syntax region BetterCommentsAttention start=/' . start_pattern . attention_pattern . '/ end=/' . end_pattern  . '/'
    execute 'highlight BetterCommentsAttention ctermfg=' . g:attention_color_ctermfg
    execute 'highlight BetterCommentsAttention guifg=' . g:attention_color_guifg

    execute 'syntax region BetterCommentsTODO start=/' . start_pattern . todo_pattern . '/ end=/' . end_pattern . '/'
    execute 'highlight BetterCommentsTODO ctermfg=' . g:todo_color_ctermfg
    execute 'highlight BetterCommentsTODO guifg=' . g:todo_color_guifg
    
endfunction

function! bettercomments#Disable()

    syntax clear BetterCommentsOther
    syntax clear BetterCommentsInformation
    syntax clear BetterCommentsQuestion
    syntax clear BetterCommentsAttention
    syntax clear BetterCommentsTODO
    
endfunction
