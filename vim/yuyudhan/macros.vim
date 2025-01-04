" vim/yuyudhan/macros.vim

" Similar to insertnums functionality of Sublime Text
command! -range AddNumber call AddNumberFunction(<line1>, <line2>)

function! AddNumberFunction(start, end)
    let i = 1
    for lnum in range(a:start, a:end)
        call setline(lnum, getline(lnum) . ' ' . i)
        let i += 1
    endfor
endfunction

" Ensure an extra blank line at the end of the file when saving
autocmd BufWritePre * call EnsureBlankLineAtEOF()

" Function to add a blank line at the end if missing
function! EnsureBlankLineAtEOF()
    if getline('$') !=# ''
        call append('$', '')
    endif
endfunction

" Copy the relative path of the current file to the clipboard
command! CopyRelativePath call CopyRelativePathFunction()

function! CopyRelativePathFunction()
    let @+ = expand('%')
    echo "Relative path copied to clipboard: " . expand('%')
endfunction

" Copy the absolute path of the current file to the clipboard
command! CopyAbsolutePath call CopyAbsolutePathFunction()

function! CopyAbsolutePathFunction()
    let @+ = expand('%:p')
    echo "Absolute path copied to clipboard: " . expand('%:p')
endfunction

