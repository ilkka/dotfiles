" Add the following lines to your ~/.vimrc file or save them to a file
" in ~/.vim/plugin/ directory.

command! -complete=file -nargs=* Bzr call s:RunShellCommand('bzr '.<q-args>)

" Other VCS tools
command! -complete=file -nargs=* Git call s:RunShellCommand('git '.<q-args>)
command! -complete=file -nargs=* Hg call s:RunShellCommand('hg '.<q-args>)
command! -complete=file -nargs=* Svn call s:RunShellCommand('svn '.<q-args>)

" Run any shell command
command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

" Shell commands may launch $EDITOR so we need to set it to something
" that works inside Vim.
let $EDITOR = '/opt/local/bin/gvim --nofork'

function! s:RunShellCommand(cmdline)
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   call setline(1,a:cmdline)
   call setline(2,substitute(a:cmdline,'.','=','g'))
   execute 'silent $read !'.escape(a:cmdline,'()%#')
   setlocal nomodifiable
   1
   if search('\m\C^--- .*\n+++ .*\n@@','n')
       setlocal filetype=diff
   endif
   if a:cmdline =~ '\m\C^git '
       2match Statement /\v\C<commit \x{7,}>/
   elseif a:cmdline =~ '\m\C^bzr log'
       2match Statement /\v-{50,}/
   endif
endfunction
