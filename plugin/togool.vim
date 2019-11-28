"         
"         ,----,                                            
"       ,/   .`|                                            
"     ,`   .'  :                                    ,--,    
"   ;    ;     /                                  ,--.'|    
" .'___,/    ,' ,---.              ,---.    ,---. |  | :    
" |    :     | '   ,'\  ,----._,. '   ,'\  '   ,'\:  : '    
" ;    |.';  ;/   /   |/   /  ' //   /   |/   /   |  ' |    
" `----'  |  .   ; ,. |   :     .   ; ,. .   ; ,. '  | |    
"     '   :  '   | |: |   | .\  '   | |: '   | |: |  | :    
"     |   |  '   | .; .   ; ';  '   | .; '   | .; '  : |__  
"     '   :  |   :    '   .   . |   :    |   :    |  | '.'| 
"     ;   |.' \   \  / `---`-'| |\   \  / \   \  /;  :    ; 
"     '---'    `----'  .'__/\_: | `----'   `----' |  ,   /  
"                      |   :    :                  ---`-'   
"                       \   \  /                            
"                        `--`-'                             
let g:togool_extras  = get(g:, 'togool_extras', [[],[]])
let g:togool_bools   = get(g:, "togool_bools", 
      \ [['1', 'true',  'True',  'y', 'Y', 'yes', 'Yes'] + g:togool_extras[0],
      \  ['0', 'false', 'False', 'n', 'N', 'no',  'No' ] + g:togool_extras[1]])
let g:togool_map     = get(g:, 'togool_map', 1)
let g:togool_map_val = get(g:, 'togool_map_val', '<C-b>')

function! Togool()
  let val = expand('<cword>')
  let outdex = -1
  for i in [0, 1]
    let index = index(g:togool_bools[i], val)
    if index != -1
      let outdex = !i
      break
    endif
  endfor
  if outdex == -1
    echom '"' . val . '" not in bool list'
  else
    exec 'normal! viwc' . g:togool_bools[outdex][index]
  endif
endfunction

command! -nargs=0 Togool call Togool()

if g:togool_map
  exec 'nnoremap ' . g:togool_map_val . ' :Togool<CR>'
  exec 'inoremap ' . g:togool_map_val . ' :Togool<CR>a'
endif
