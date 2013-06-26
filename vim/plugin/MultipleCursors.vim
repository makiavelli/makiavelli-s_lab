"Multiple cursor main file

"Function list
"	MultipleCursors() -> function to start the multiple cursors plugin
"	MultipleCursorsOff() -> function to power-off the multiple cursors plugin
"	GetCursorXY() -> function to get current coords of cursor
"	SaveCursorXY() -> function to save the current cursor position into coords window


"Global vars
"	g:cursor_list_bufnr

function! MultipleCursors()
	" - splitting current window

	8new
	let g:cursor_list_bufnr = winbufnr(0)
endfunction
call MultipleCursors()

function! GetCursorXY()
	" Function to get the current coord of cursor

	return getpos(".")
endfunction
"call GetCursorXY()

function! GetSavedCoords()
	"Function to retrieve the buffer from the coords window

	" - switching to previously coords window buffer (g:cursor_list_bufnr)
	" - read all line with getline(1, \"$\")
	" - return list of all lines

	if !exists("s:cursor_coords")
		let s:cursor_coords = 0
	endif
	"TODO: se non si riesce a leggere il contenuto della finestra, il buffer va salvato
	let s:cursor_coords = getbufline(bufwinnr(g:cursor_list_bufnr)), 1, "$")
	echo "buffer id of coords saved: " . g:cursor_list_bufnr
	echo "related window numer: " . bufwinnr(g:cursor_list_bufnr)
	echo "buffer retrieved: " . s:cursor_coords

	return 1
endfunction

function! SaveCursorXY()
	"writing the cursor X(col) and Y(row) inside opened tab 

	let cursor_xy = GetCursorXY()
	let b:current_window_bufnr = winbufnr(0)

	"if current buffer is equal to g:cursor_list_bufnr, then cursor coords won't be saved
	if b:current_window_bufnr != g:cursor_list_bufnr
	endif

	echo "current buff id: " . b:current_window_bufnr
	echo "cursor window buff id: " . g:cursor_list_bufnr

endfunction
"call SaveCursorXY()

