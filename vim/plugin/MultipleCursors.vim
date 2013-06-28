"MultipleCursor plugin - Main file

"Function list
"	MultipleCursors() -> function to start the multiple cursors plugin
"	MultipleCursorsOff() -> function to power-off the multiple cursors plugin
"	GetCursorXY() -> function to get current coords of cursor
"	SaveCursorXY() -> function to save the current cursor position into coords window

"Global vars
	" base window buffer id

" Current working window functions
	function! SetBaseWindowBufferId()
		" Function to set current working window buffer id into global var

		if !exists("g:base_window_buffer_id")
			let g:base_window_buffer_id = 0
		endif
		let g:base_window_buffer_id = winbufnr(0)
	endfunction

	function! GetBaseWindowBufferId()
		" Function to retrieve the working window buffer id

		return g:base_window_buffer_id
	endfunction

" Coords window functions
	function! SetCoordsWindowBufferId()
		" Function to set coords window buffer id into global var

		if !exists("g:coords_list_bufnr")
			let g:coords_list_bufnr = 0
		endif
		let g:coords_list_bufnr = winbufnr(0)
	endfunction

	function! GetCoordsWindowBufferId()
		" Function to get coords window buffer id

		return g:coords_list_bufnr
	endfunction

" Common text window functions
	function! SetCommonTextWindowBufferId()
		" Function to set common window buffer id into global var

		if !exists("g:common_text_bufnr")
			let g:common_text_bufnr = 0
		endif
		let g:common_text_bufnr = winbufnr(0)
	endfunction

	function! GetCommonTextWindowBufferId()
		" Function to get common text window buffer id

		return g:common_text_bufnr
	endfunction

"
"
" MultipleCursors plugin main functions
"
"

function! MultipleCursors()
	" - Function to create coords window and common text window

	" creating coords window and saving buffer number associated with new window created
	8new
	call SetCoordsWindowBufferId()

	" creating common text window and save buffer number associated with new window created
	100vne
	call SetCommonTextWindowBufferId()

	" move cursor to base window
	exe bufwinnr(GetBaseWindowBufferId()) . "wincmd w"
endfunction
" call MultipleCursors()

function! GetCursorXY()
	" Function to get the current coord of cursor

	" [bufnum, lnum, col, off]
	" retrieve current cursor position in base window
	let l:current_cursor_position = getpos(".")

	" convert list of position retrieved in a string like this, "line,column
	let l:coords_string = l:current_cursor_position[1] . "," . l:current_cursor_position[2]

	return l:coords_string
endfunction
"call GetCursorXY()

function! GetSavedCoords()
	" Function to retrieve the buffer from the coords window

	" - switching to previously coords window buffer (GetCoordsWindowBufferId())
	" - read all line with getline(1, \"$\")
	" - switching to previously window
	" - return list of all lines
	" saving current windows number
	" let g:current_window_number = winnr()

	" switching to coord list window
	exe bufwinnr(GetCoordsWindowBufferId()) . "wincmd w"

	" let l:coords_coords = getbufline(bufwinnr(GetCoordsWindowBufferId())), 1, "$")
	" l:coords_coords = getline(1, \"$")
	" retrieving all coords from buffer

	" clear var to saving the cursor coords
	if !exists("l:cursor_coords")
		let l:cursor_coords = []
	endif
	let l:cursor_coords = getline(1, "$")
	" echo \"buffer id of coords saved: " . GetCoordsWindowBufferId()
	" echo \"related window numer: " . bufwinnr(GetCoordsWindowBufferId())
	" echo \"coords: " . l:coords_coords

	" switching to previously window
	exe bufwinnr(GetBaseWindowBufferId()) . "wincmd w"

	return l:cursor_coords
endfunction

function! SaveCursorXY()
	" Function to write (or append) the cursor X(col) and Y(row) inside coords buffer

	if !exists("l:coords_xy")
		let l:coords_xy = ""
	endif
	let l:coords_xy = GetCursorXY()
	echo "string retrived: ". l:coords_xy

	"if current buffer is equal to  base window buffer id, then cursor coords could be saved
	if winbufnr(0) == GetBaseWindowBufferId()
		" retrieving a list of saved coords
		" if !exists("l:saved_coords_list")
			" let l:saved_coords_list = []
		" endif
		" let l:saved_coords_list = GetSavedCoords()

		" echo \"coords retrieved"
		" echo l:saved_coords_list
		" echo \"cursor current coords"
		" echo l:coords_xy
		" switching to coords list window and append new coords retrieved to coords list
		exe bufwinnr(GetCoordsWindowBufferId()) . "wincmd w"
		call append(0, l:coords_xy)
		" call add(l:saved_coords_list, l:coords_xy)

		" return to base window
		exe bufwinnr(GetBaseWindowBufferId()) . "wincmd w"
	endif

	" echo \"current buff id: " . b:current_window_bufnr
	" echo \"cursor window buff id: " . GetCoordsWindowBufferId()

endfunction
"call SaveCursorXY()

function! WriteCommonText()
	" Function to write common text in all of saved coords
endfunction

function! ClearMultipleCursors()
	" Function to clear coords window/buffer and common text window/buffer
endfunction

function! InitMultipleCursorPlugin()
	" Function to init the MultipleCursorPlugin

	call SetBaseWindowBufferId()
	call MultipleCursors()
endfunction