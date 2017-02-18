function! s:get_vim_type()
  let vim8 = has('patch-8.0.0039') && has('job') && has('lambda')
  if has('nvim')
    let type = 'neo'
  elseif vim8
    let type = 'vim8'
  else
    let type = 'vim'
  endif
  return type
endfunction

function! jobproc#system(command)
  let type = s:get_vim_type()
  if type ==# 'neo'
    call s:system_nvim(a:command)
  elseif type ==# 'vim8'
    call s:system_vim8(a:command)
  else
    echomsg 'Unsupport job types in jobproc#system, required vim8 or nvim'
    return -1
  endif
  return 0
endfunction

function! s:callback()
  " do nothining
endfunction

function! s:on_error()
  echomsg "Fail to execute a shell command in jobproc#system" 
endfunction

function! s:system_nvim(command)
  let job = jobstart(a:command, {
        \ 'on_stdout': function('s:callback'),
        \ 'on_stderr': function('s:on_error'),
        \ 'on_exit': function('s:callback'),
        \})
endfunction

function! s:system_vim8(command)
  let job = job_start(a:command, {
        \ 'out_cb' : {job,data->s:callback()},
        \ 'err_cb' : {job,data->s:on_error()},
        \ 'exit_cb' : {job,data->s:callback()},
        \ 'mode' : 'raw',
        \})
endfunction
