let s:N1 = [ '#2d2d2d' , '#99cc99' , 232 , 154 ] 
let s:N2 = [ '#ffcc66' , '#45413b' , 222 , 238 ]
let s:N3 = [ '#f99157' , '#2d2d2d' , 121 , 235 ]
let s:N4 = [ '#515151' , 241 ]                  

let s:I1 = [ '#2d2d2d' , '#99cccc' , 232 , 39  ]
let s:I2 = [ '#ffcc66' , '#009999' , 222 , 27  ]
let s:I3 = [ '#009999' , '#2d2d2d' , 39  , 235 ]

let s:V1 = [ '#2d2d2d' , '#f99157' , 232 , 214 ]
let s:V2 = [ '#2d2d2d' , '#ffcc66' , 16  , 221 ]
let s:V3 = [ '#2d2d2d' , '#b88853' , 16  , 137 ]
let s:V4 = [ '#c7915b' , 173 ]                   

let s:PA = [ '#ffcc66' , 222 ]                   
let s:RE = [ '#f2777a' , 211 ]                   

let s:file = [ '#f99157' , s:N3[1] , 196 , s:N3[3] , '' ]


let g:airline#themes#tomorrow_night_eighties#normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3, s:file)
let g:airline#themes#tomorrow_night_eighties#normal_modified = {
      \ 'mode_separator' : [ s:N1[1]   , s:N4[0]   , s:N1[3]   , s:N4[1]   , 'bold' ] ,
      \ 'info'           : [ s:N2[0]   , s:N4[0]   , s:N2[2]   , s:N4[1]   , ''     ] ,
      \ 'info_separator' : [ s:N4[0]   , s:N2[1]   , s:N4[1]   , s:N2[3]   , 'bold' ] ,
      \ 'statusline'     : [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }
let g:airline#themes#tomorrow_night_eighties#inactive = {
      \ 'mode'           : [ s:N2[1]   , s:N3[1]   , s:N2[3]   , s:N3[3]   , ''     ] }


let g:airline#themes#tomorrow_night_eighties#insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3, s:file)
let g:airline#themes#tomorrow_night_eighties#insert_modified = {
      \ 'info_separator' : [ s:I2[1]   , s:N2[1]   , s:I2[3]   , s:N2[3]   , 'bold' ] ,
      \ 'statusline'     : [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }
let g:airline#themes#tomorrow_night_eighties#insert_paste = {
      \ 'mode'           : [ s:I1[0]   , s:PA[0]   , s:I1[2]   , s:PA[1]   , ''     ] ,
      \ 'mode_separator' : [ s:PA[0]   , s:I2[1]   , s:PA[1]   , s:I2[3]   , ''     ] }


let g:airline#themes#tomorrow_night_eighties#replace = copy(airline#themes#tomorrow_night_eighties#insert)
let g:airline#themes#tomorrow_night_eighties#replace.mode           = [ s:I1[0] , s:RE[0] , s:I1[2] , s:RE[1] , '' ]
let g:airline#themes#tomorrow_night_eighties#replace.mode_separator = [ s:RE[0] , s:I2[1] , s:RE[1] , s:I2[3] , '' ]
let g:airline#themes#tomorrow_night_eighties#replace_modified = g:airline#themes#tomorrow_night_eighties#insert_modified


let g:airline#themes#tomorrow_night_eighties#visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3, s:file)
let g:airline#themes#tomorrow_night_eighties#visual_modified = {
      \ 'info_separator' : [ s:V2[1]   , s:V4[0]   , s:V2[3]   , s:V4[1]   , 'bold' ] ,
      \ 'statusline'     : [ s:V3[0]   , s:V4[0]   , s:V3[2]   , s:V4[1]   , ''     ] }
