let g:delimiter_filetype = {
    \ 'cpp'                 :   {'left' : '/\/'},
    \ 'c'                   :   {'left' : '/\/'},
    \ 'cs'                  :   {'left' : '/\/'},
    \ 'sh'                  :   {'left' : '#'},
    \ 'javascript'          :   {'left' : '/\/'},
    \ 'typescript'          :   {'left' : '/\/'},
    \ 'python'              :   {'left' : '#'},
    \ 'vim'                 :   {'left' : '"'},
    \ 'java'                :   {'left' : '/\/'},
    \ 'php'                 :   {'left' : '/\/'},
    \ 'go'                  :   {'left' : '/\/'},
    \ 'dart'                :   {'left' : '/\/'},
    \ 'scala'               :   {'left' : '/\/'},
    \ 'dockerfile'          :   {'left' : '#'},
    \ 'yaml.ansible'        :   {'left' : '#'},
    \ 'yaml.docker-compose' :   {'left' : '#'},
    \ 'yaml'                :   {'left' : '#'},
    \ 'ini'                 :   {'left' : '#'},
    \ 'puppet'              :   {'left' : '#'},
    \ 'awk'                 :   {'left' : '#'},
    \ 'sql'                 :   {'left' : '--'},
    \ 'terraform'           :   {'left' : '#'},
    \ 'ruby'                :   {'left' : '#'},
    \ 'kotlin'              :   {'left' : '/\/'},
    \ 'r'                   :   {'left' : '#'},
    \ 'rust'                :   {'left' : '/\/'},
    \ 'nginx'               :   {'left' : '#'},
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
        if g:disable_messages == 0
            echo "BetterComments: file doesn't have file type"
        endif

        return 1
    endif

    if !has_key(g:delimiter_filetype, &filetype)
        if g:disable_messages == 0
            echo 'BetterComments: not found file type in list'
        endif

        return 2
    endif

    let comment_symbol_start = g:delimiter_filetype[&filetype]['left']
    let comment_symbol_end = get(g:delimiter_filetype[&filetype], 'right', '$')

    let start_pattern = '\v\c\s*\' . comment_symbol_start
    let end_pattern = comment_symbol_end

    let information_pattern = '\s*\*'
    let question_pattern = '\s*\?'
    let attention_pattern = '\s*\!'
    let todo_pattern = '\s*(todo:|todo)'

    if g:other_color_enable != 0
        execute 'syntax region BetterCommentsOther start=/' . start_pattern . '/ end=/' . end_pattern . '/'
        execute 'highlight BetterCommentsOther ctermfg=' . g:other_color_ctermfg
        execute 'highlight BetterCommentsOther guifg=' . g:other_color_guifg
    endif

    if g:information_color_enable != 0
        execute 'syntax region BetterCommentsInformation start=/' . start_pattern . information_pattern . '/ end=/' . end_pattern . '/'
        execute 'highlight BetterCommentsInformation ctermfg=' . g:information_color_ctermfg
        execute 'highlight BetterCommentsInformation guifg=' . g:information_color_guifg
    endif

    if g:question_color_enable != 0
        execute 'syntax region BetterCommentsQuestion start=/' . start_pattern . question_pattern . '/ end=/' . end_pattern . '/'
        execute 'highlight BetterCommentsQuestion ctermfg=' . g:question_color_ctermfg
        execute 'highlight BetterCommentsQuestion guifg=' . g:question_color_guifg
    endif

    if g:attention_color_enable != 0
        execute 'syntax region BetterCommentsAttention start=/' . start_pattern . attention_pattern . '/ end=/' . end_pattern  . '/'
        execute 'highlight BetterCommentsAttention ctermfg=' . g:attention_color_ctermfg
        execute 'highlight BetterCommentsAttention guifg=' . g:attention_color_guifg
    endif

    if g:todo_color_enable != 0
        execute 'syntax region BetterCommentsTODO start=/' . start_pattern . todo_pattern . '/ end=/' . end_pattern . '/'
        execute 'highlight BetterCommentsTODO ctermfg=' . g:todo_color_ctermfg
        execute 'highlight BetterCommentsTODO guifg=' . g:todo_color_guifg
    endif

endfunction

function! bettercomments#Disable()

    syntax clear BetterCommentsOther
    syntax clear BetterCommentsInformation
    syntax clear BetterCommentsQuestion
    syntax clear BetterCommentsAttention
    syntax clear BetterCommentsTODO

endfunction
