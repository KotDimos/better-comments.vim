# Better Comments

Расширение Better Comments поможет создавать в коде более понятные комментарии.

![BetterComments example](./img/bettercomments-example.png)

* `*` - важная информация.
* `?` - вопрос.
* `!` - важное предупреждение.
* `TODO` - требуется доделать/реализовать.


# Возможная конфигурация Vim.

Включение BetterComments по команде `\r`.

    nnoremap <buffer> <localleader>r :call bettercomments#Enable()<cr>

Автоматический запуск во всех файлах.

    autocmd BufReadPost * call bettercomments#Enable()

Автоматический запуск только в определённых файлах.

    autocmd BufReadPost *.py call bettercomments#Enable()

Базовые цвета.

    let g:other_color_guifg = 'green'
    let g:information_color_guifg = 'yellow'
    let g:question_color_guifg = 'blue'
    let g:attention_color_guifg = 'red'
    let g:todo_color_guifg = 'cyan'

Изменение цвета.

Изменение цвета на базовый цвет.

    let g:other_color_guifg = 'magenta'

Изменение цвета на hex цвет.

    let g:other_color_guifg = '#6632a8'

Доступные стандартные цвета.

* Black
* DarkBlue
* DarkGreen
* DarkCyan
* DarkRed
* DarkMagenta
* Brown, DarkYellow
* LightGray, LightGrey, Gray, Grey
* DarkGray, DarkGrey
* Blue, LightBlue
* Green, LightGreen
* Cyan, LightCyan
* Red, LightRed
* Magenta, LightMagenta
* Yellow, LightYellow
* White
