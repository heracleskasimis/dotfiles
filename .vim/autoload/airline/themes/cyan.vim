" vim-airline cyan theme

let g:airline#themes#cyan#palette = {}

let g:airline#themes#cyan#palette.accents = {
      \ 'red': [ '#ffffff' , '' , 231 , '' , '' ],
      \ }

let s:N1 = [ '#343434' , '#a0a0a0' , 237 , 248 ]
let s:N2 = [ '#343434' , '#b3b3b3' , 237 , 250 ]
let s:N3 = [ '#343434' , '#c7c7c7' , 237 , 252 ]
let g:airline#themes#cyan#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#cyan#palette.normal_modified = {
      \ 'airline_c': [ '#ff0044' , '#ffe0e9' , 13 , 250, '' ] ,
      \ }


let s:I1 = [ '#eeeeee' , '#09644f' , 255 , 4  ]
let s:I2 = [ '#343434' , '#a3a3a3' , 237 , 249 ]
let s:I3 = [ '#343434' , '#b0b0b0' , 237 , 250 ]
let g:airline#themes#cyan#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#cyan#palette.insert_modified = {
      \ 'airline_c': [ '#343434' , '#ffe0e9' , 13 , 252, '' ] ,
      \ }
let g:airline#themes#cyan#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#09644f' , s:I1[2] , 4 , '' ] ,
      \ }


let g:airline#themes#cyan#palette.replace = copy(g:airline#themes#cyan#palette.insert)
let g:airline#themes#cyan#palette.replace.airline_a = [ s:I1[0] , '#ff2121' , s:I1[2] , 196 , '' ]
let g:airline#themes#cyan#palette.replace.airline_z = [ s:I1[0] , '#ff2121' , s:I1[2] , 196 , '' ]
let g:airline#themes#cyan#palette.replace_modified = g:airline#themes#cyan#palette.insert_modified

let s:V1 = [ '#ffffff' , '#000000' , 15 , 16 ]
let s:V2 = [ '#343434' , '#a3a3a3' , 237 , 249 ]
let s:V3 = [ '#343434' , '#b0b0b0' , 237 , 250 ]
let g:airline#themes#cyan#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#cyan#palette.visual_modified = {
      \ 'airline_c': [ '#343434' , '#ffe0e9' , 237 , 216 , '' ] ,
      \ }

let s:IA = [ '#777777' , '#c7c7c7' , 244 , 251 , '' ]
let g:airline#themes#cyan#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#cyan#palette.inactive_modified = {
      \ 'airline_c': [ '#ff0044' , '' , 1 , '' , '' ] ,
       \ }

let g:airline#themes#cyan#palette.tabline = {
      \ 'airline_tab':      ['#343434', '#b3b3b3',  237, 250, ''],
      \ 'airline_tabsel':   ['#ffffff', '#004b9a',  231, 31 , ''],
      \ 'airline_tabtype':  ['#343434', '#a0a0a0',  237, 248, ''],
      \ 'airline_tabfill':  ['#343434', '#c7c7c7',  237, 251, ''],
      \ 'airline_tabmod':   ['#343434', '#ffe0e9',  237, 216, ''],
      \ }

let s:WI = [ '#eeeeee', '#ff0044', 255, 9 ]
let g:airline#themes#cyan#palette.normal.airline_warning = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]
let g:airline#themes#cyan#palette.normal.airline_error = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]

let s:WII = [ '#eeeeee', '#b60020', 255, 9 ]
let g:airline#themes#cyan#palette.inactive.airline_warning = [
     \ s:WII[0], s:WII[1], s:WII[2], s:WII[3]
     \ ]
let g:airline#themes#cyan#palette.inactive.airline_error = [
     \ s:WII[0], s:WII[1], s:WII[2], s:WII[3]
     \ ]

let g:airline#themes#cyan#palette.inactive.airline_z_to_airline_warning = [
     \ s:WII[1], s:WII[0], s:WII[3], s:WII[2]
     \ ]
let g:airline#themes#cyan#palette.inactive.airline_z_to_airline_error = [
     \ s:WII[1], s:WII[0], s:WII[3], s:WII[2]
     \ ]

let g:airline#themes#cyan#palette.normal_modified.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.insert.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.insert_modified.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.visual.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.visual_modified.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.replace.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.replace_modified.airline_warning =
    \ g:airline#themes#cyan#palette.normal.airline_warning

let g:airline#themes#cyan#palette.normal_modified.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.insert.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.insert_modified.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.visual.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.visual_modified.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.replace.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

let g:airline#themes#cyan#palette.replace_modified.airline_error =
    \ g:airline#themes#cyan#palette.normal.airline_error

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#cyan#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#343434' , '#c7c7c7' , 237 , 251 , ''     ] ,
      \ [ '#343434' , '#b3b3b3' , 237 , 250 , ''     ] ,
      \ [ '#eeeeee' , '#000000' , 255 , 16 , ''     ] )
