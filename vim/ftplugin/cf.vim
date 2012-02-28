" Vim script file					vim600:fdm=marker:
" FileType:   ColdFusion
" Maintainer: Devin Weaver <vim (at) tritarget.com>
" Location:   http://www.vim.org/scripts/script.php?script_id=301

" This is a wrapper script to add extra CF support.
" Original script can be seen in xml-plugin documentation.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.

let b:html_mode = 1

"if !exists("*XmlAttribCallback")
"	function XmlAttribCallback( xml_tag )
"		if a:xml_tag ==? "table"
"			return "cellpadding=\"0\" cellspacing=\"0\" border=\"0\""
"		elseif a:xml_tag ==? "link"
"			return "href=\"/site.css\" rel=\"StyleSheet\" type=\"text/css\""
"		else
"			return 0
"		endif
"	endfunction
"endif

" On to loading xml.vim
runtime bundle/xmledit/ftplugin/xml.vim
