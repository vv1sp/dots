""""""""""""""""
""Make script""
""""""""""""""""
fun! SetMkfile()
  let filemk = "Makefile"
  let dirmk  = "build/"
  let pathmk = "./"
  let depth  = 1
  while depth < 4
    if filereadable(pathmk . dirmk . filemk)
       let pathmk = pathmk . dirmk 
       echo pathmk
       return pathmk
    endif
    if filereadable(pathmk . filemk)
      return pathmk
    endif
    let depth += 1
    let pathmk = "../" . pathmk
  endwhile
  return "."
endf
command! -nargs=* Make | let $mkpath = SetMkfile() | make <args> -C $mkpath | cwindow 10

