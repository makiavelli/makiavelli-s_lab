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

function! SaveCursorXY()
	"writing the cursor X(col) and Y(row) inside opened tab 

	let cursor_xy = GetCursorXY()
	let b:current_window_bufnr = winbufnr(0)

	"if current buffer is equal to g:cursor_list_bufnr, then cursor coords won't be saved
	if b:current_window_bufnr != g:cursor_list_bufnr
		"append the retrieved cursor coords from those previously saved
		if !exists("s:cursor_coords")
			let s:cursor_coords = 0
		endif
		"TODO: se non si riesce a leggere il contenuto della finestra, il buffer va salvato
		let s:cursor_coords = getbufline(bufname(winbufnr(g:cursor_list_bufnr)), 1, "$")
		echo "from buffer : " . bufname(winbufnr(g:cursor_list_bufnr))
		echo s:cursor_coords
	endif

	echo "current buff id: " . b:current_window_bufnr
	echo "cursor window buff id: " . g:cursor_list_bufnr

endfunction
call SaveCursorXY()

finish
