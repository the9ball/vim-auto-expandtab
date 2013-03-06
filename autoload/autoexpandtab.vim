if exists( 'g:loaded_autoload_autoexpandtab' ) && g:loaded_autoload_autoexpandtab
	finish
endif
let g:loaded_autoload_autoexpandtab = 1

function! autoexpandtab#enable()
	augroup plugin-auto-expandtab
		au!
		au BufEnter * call s:CheckExpandTab()
	augroup END
	call s:CheckExpandTab()
endfunction

function! autoexpandtab#disable()
	augroup plugin-auto-expandtab
		au!
	augroup END
endfunction

" インデントタイプの判定
function! s:CountMatch(expr)
	silent! redir => l:result
	silent! execute '%s/' . a:expr . '/&/gne'
	silent! redir END

	if '' == l:result
		" 1つもなかった
		return 0
	endif

	" 結果をパースして個数だけを返す
	let l:list = split( substitute( l:result, '\n', '', 'g' ), ' ' )
	return l:list[0]
endfunction
function! s:CheckExpandTab()
	let l:indent='^'
	for l:i in range( 1, &tabstop )
		let l:indent = l:indent . ' '
	endfor
	let l:linespc = s:CountMatch( l:indent )
	let l:linetab = s:CountMatch( '^\t' )
	if str2nr( l:linetab ) < str2nr( l:linespc )
		set expandtab
	else
		set noexpandtab
	endif
	unlet l:indent
endfunction

