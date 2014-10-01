ab __java <C-r>%<Esc>:s,.*/,,<CR>:s,.java$,,<CR>:s,.*,package##import org.apache.log4j.Logger;##/**# *# * # *# * @author Brian Hammond# *# */#public class & {#\tprivate static final Logger LOGGER = Logger.getLogger( &.class );#};,<CR>:%s,#,\r,g<CR>_bh_repackage<CR>/^public<CR>
" from john
map _jt_format_paragraph   !}fmt<CR>
map _jt_show_line_numbers  :set invnu<cr>

map _bh_sout_each   :s,[a-zA-Z0-9_]*, + " &='" + & + "'",g
map _bh_sout_stop   ISystem.out.println( "" <Esc>A );<Esc>/asdfasdfsdf<Esc><C-L>
map _bh_sout        <Esc>_bh_sout_each<Esc>_bh_sout_stop<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general purpose stuff
map _bh_calc <Esc>:s/[$,]*//g<CR>V!bc -l<CR>
map _bh_trim <Esc>:%s,^[\t ]*,,g<CR>:%s,[\t ]*$,,g<CR>

function! _bh_trim( s )
    return substitute( substitute( substitute( a:s, '^[\t ]*', '', 'g' ), '[\t ]*$', '', 'g' ), '[ \t][ \t]*', ' ', 'g' )
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  __                               
" /\_\     __     __  __     __     
" \/\ \  /'__`\  /\ \/\ \  /'__`\   
"  \ \ \/\ \L\.\_\ \ \_/ |/\ \L\.\_ 
"  _\ \ \ \__/.\_\\ \___/ \ \__/.\_\
" /\ \_\ \/__/\/_/ \/__/   \/__/\/_/
" \ \____/                          
"  \/___/   specific hooks
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" repackage based on filename
"map _bh_repackage  <Esc>/^package<Cr>C%<C-r>%<Esc>:s,.*/java/,,<Cr>:s,/[^/]*$,;,<Cr>:s,/,.,g<Cr>:s,^,package ,<Cr>
map _bh_repackage  <Esc>/^package<Cr>C%:r!pwd<C-r>%<Esc>:s,.*/java/,,<Cr>:s,/[^/]*$,;,<Cr>:s,/,.,g<Cr>:s,^,package ,<Cr>

" start new java file
map _bh_java_new   <Esc>i<C-r>%<Esc>:s,.*/,,<CR>:s,.java$,,<CR>:s,.*,package##/**# *# * # *# * @author Brian Hammond# *# */#public class & {#};,<CR>:%s,#,\r,g<CR>_bh_repackage<CR>/^public<CR>A<CR>

" convert url or filename to jar to maven2 dependency
map _bh_m2_dep     <Esc>:s,.*maven2/,,<CR>:s,/[^/]*$,,<CR>:s,^\(.*\)/\([^/]*\)/\([^/]*\)$,\t\t<dependency>!\t\t\t<groupId>\1<#groupId>!\t\t\t<artifactId>\2<#artifactId>!\t\t\t<version>\3<#version>!\t\t<#dependency>!,<CR>:s,/,.,g<CR>:s,#,/,g<CR>:s,!,\r,g<CR><CR>

" getters and setters
map _bh_java_gs <Esc>$by$A <Esc>pb~:s,^[ \t]*\([A-Z][A-Za-z0-9_]*.*\)[\t ][\t ]*\([A-Za-z0-9_][A-Za-z0-9_]*\)[\t ][\t ]*\([A-Za-z0-9_][A-Za-z0-9_]*\)$,\tprivate \1 \2_;\r\r\tpublic \1 get\3() {\r\t\treturn this.\2_;\r\t}\r\r\tpublic void set\3( \1 \2 ) {\r\t\tthis.\2_ = \2;\r\t}\r<CR>

" new 
map _bh_java_new_obj <Esc>:s,^\([ \t]*\)\(.*\)[ \t]*$,\1\2 \2 = new \2();,<CR>^/=<CR>b~

map _bh_java_logger <Esc>Aimport org.slf4j.Logger;<CR>import org.slf4j.LoggerFactory;<CR>private transient Logger logger_;<CR><CR>public Logger getLogger() {<CR>return (<CR>null == this.logger_<CR>? this.logger_ = LoggerFactory.getLogger( this.getClass() )<CR>: this.logger_<CR>);<CR>}<CR><CR>public void setLogger( Logger logger ) {<CR>this.logger_ = logger;<CR>}<CR><CR><CR>

" http://www.ibm.com/developerworks/linux/library/l-vim-script-2/index.html
" http://blog.golden-ratio.net/2008/02/vim-introduction-to-vimrc/
" http://en.wikibooks.org/wiki/Learning_the_vi_editor/Vim/VimL_Script_language

""""""""""""""""""""""""""

map _bh_pws <Esc>:s,\([[:punct:]]\)\([^[:punct:] ]\),\1 \2,g;<CR>:s,\([^[:punct:] ]\)\([[:punct:]]\),\1 fart \2,g<CR>

function! _bh_java_concrete( type )
    return a:type
endfunction

"todo: pass type
function! _bh_template_GettersAndSetters() 
    let decl = ""
    if "java" == g:_bh_CurrentLanguage
        let decl = decl . "\tpublic :type: get:Lame:() {\n"
        let decl = decl . "\t\treturn this.:name:_;\n"
        let decl = decl . "\t}\n"
        let decl = decl . "\t\n"
        let decl = decl . "\tpublic void set:Lame:( :type: :name: ) {\n"
        let decl = decl . "\t\tthis.:name:_ = :name:;\n"
        let decl = decl . "\t}\n"
    endif
    return decl
endfunction

function! _bh_template_VariableDeclaration()
    let decl = ""
    if "java" == g:_bh_CurrentLanguage
        let decl = "\tprivate :type: :name:_;"
    endif
    return decl
endfunction

""""""""""""""""""""""""""

function! _bh_TemplateReplace( decl, var )
    let name = a:var[ 0 ]
    let Name = a:var[ 1 ]
    let type = a:var[ 2 ]
    let s = substitute( substitute( substitute( a:decl, ':type:', type, 'g' ), ':name:', name, 'g' ), ':Lame:', Name, 'g' )
    return substitute( s, ':concrete:', _bh_java_concrete( type ), 'g' )
endfunction

function! _bh_PullVariables(first,last)
    let varz = []
    for linenum in range(a:first, a:last)
        let line = _bh_trim( getline(linenum) )
        let name = substitute( line, '.* ', '', 'g' )
        let Name = toupper( name[ 0 ] ) . name[ 1: ]
        let type = substitute( line, ' ' . name . '$', '', 'g' )
        :call add( varz, [ name, Name, type ] )
    endfor
    return varz
endfunction

function! _bh_GettersAndSetters()  range
    let varz = _bh_PullVariables(a:firstline, a:lastline)

    let i = 0
    for linenum in range(a:firstline, a:lastline)
        call setline( linenum, _bh_TemplateReplace( _bh_template_VariableDeclaration(), varz[ i ] ) )
        let i = i + 1
    endfor

    let i = 0
    let last = a:lastline 
    for var in varz
        call append( last, "" )
        let last = last + 1
        for line in split( _bh_TemplateReplace( _bh_template_GettersAndSetters(), varz[ i ] ), "\n" )
            call append( last, line )
            let last = last + 1
        endfor
        let i = i + 1
    endfor
endfunction

" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
function! _bh_JavaInfo() 
    let value = substitute( getline('.'), '[|"<>~!`'."'".']', '', 'g' )
    botright new
    execute '$read !m2_javap.sh '.value.' | grep -v ^m2_'
endfunction

function! _bh_java_shout_at() 
    call append( line("."), "" )
    call append( line("."), "System.out.println( \"HACKAT:\" + " . line(".") . " );" )
    call append( line("."), "" )
endfunction

map _bh_java_out <Esc>:s,^[ \t]*,,<CR>:s,[ \t]*$,,<CR>:s/\([^ \t]*\)/+ ", \1:" + \1/g<CR>:s,.*,LOGGER.debug( "{"& + "}" );<CR>:s/"{"+ ", /"{/<CR>

function! JavaMode()
    map  #5 <Esc>:'<,'>call _bh_GettersAndSetters()<CR>
    map  #6 <Esc>_bh_java_new<CR>
    map  #7 <Esc>_bh_repackage<CR>
    map  #8 <Esc>_bh_java_out<CR>
    map #12 <Esc>:call _bh_JavaInfo()<CR>

    map! #5 <Esc>:'<,'>call _bh_GettersAndSetters()<CR>
    map! #6 <Esc>_bh_java_new<CR>
    map! #7 <Esc>_bh_repackage<CR>
    map! #8 <Esc>_bh_java_out<CR>
    map! #12 <Esc>:call _bh_JavaInfo()<CR>

    "map  #8 <Esc>:call _bh_java_shout_at<CR>
    "map! #8 <Esc>:call_bh_java_shout_at<CR>
    "echo "JavaMode is go: 5=gs 6=new 7=repack 8=newObj"
endfunction

function! PythonMode() 
    execute "set sta"
    execute "set et"
    execute "set sts=4"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Depending on the file extention enable different macros on
" F5-F8
" todo: use autofunction thing...
function! SupahMode() 
    let filename  = expand("%:t")
    let extension = expand("%:e")
    let g:_bh_CurrentLanguage = extension
    if extension == "java"
        :call JavaMode()
    endif
    if extension == "py"
        :call PythonMode()
    endif
    "if extension == "xml"
    "    :call XmlMode()
    "endif
    if filename == "log4j.xml"
        :call Log4JMode()
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Depending on the file extention enable different macros on
    " F5-F8
    :call SupahMode()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
