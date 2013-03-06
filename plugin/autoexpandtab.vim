if exists( 'g:loaded_plugin_autoexpandtab' ) && g:loaded_plugin_autoexpandtab
    finish
endif
let g:loaded_plugin_autoexpandtab = 1

if !exists( 'g:autoexpandtab_auto_enable' )
    let g:autoexpandtab_auto_enable = 1
endif

if g:autoexpandtab_auto_enable
    call autoexpandtab#enable()
else
    call autoexpandtab#disable()
endif

