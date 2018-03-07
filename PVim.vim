Drew Neil, Practical Vim, 2nd ed, 2015
123 tips
:set syntax=javascript
:set hls | :noh
{*|#} search forward|backward the keyword under cursor

## ******************************
## Chap. 1. The Vim Way
## ******************************
## Tip 1. meet the dot command
line one
line two
line three
line four
-------------------------------------------
{>g|j|.|j.}
-------------------------------------------
	line one
		line two
			line three
				line four

## Tip 2. Don't Repeat Yourself
var foo = 1
var bar = 'a'
var foobar = foo + bar
-------------------------------------------
{A;^c|j|.|j.}
-------------------------------------------
var foo = 1;
var bar = 'a';
var foobar = foo + bar;

## Tip 3. Take One Step Back, Then Three Forward
var foo = "method("+argument1+","+argument2+")";
-------------------------------------------
{f+|s+^c|;|.|;.|;.}
-------------------------------------------
var foo = "method(" + argument1 + "," + argument2 + ")";

## Tip 4. Act, Repeat, Reverse
-------------------------------------------
{@:} repeat the last ExCommand
{&} repeat the last :substitute command
-------------------------------------------

## Tip 5. Find and Replace by Hand
...We're waiting for content before the site can go live...
...If you are content with this, let's go ahead with it...
...We'll launch as soon as we have the content...
-------------------------------------------
{*|cwcopy^c|n|.}
-------------------------------------------
...We're waiting for copy before the site can go live...
...If you are content with this, let's go ahead with it...
...We'll launch as soon as we have the copy...

## Tip 6. Meet the Dot Formula
The Ideal: One Keystroke to Move, One Keystroke to Execute

##############################################################
## Part I. Modes
##############################################################
## ******************************
## Chap. 2. Normal Mode
## ******************************
## Tip 7. Pause with Your Brush Off the Page
## Tip 8. Chunk Your Undos
## Tip 9. Compose Repeatable Changes
The end is nigh
-------------------------------------------
{$dbx} {$bdw} {$daw}
-------------------------------------------
The end is

## Tip 10. Use Counts to Do Simple Arithmetic
.blog, .news { background-image: url(/sprite.png); }
.blog { background-position: 0px 0px }
-------------------------------------------
{yyp|cW.news^c|180<C-x>}
-------------------------------------------
.blog, .news { background-image: url(/sprite.png); }
.blog { background-position: 0px 0px }
.news { background-position: -180px 0px }

## Tip 11. Don't Count If You Can Repeat
Delete more than one word
-------------------------------------------
{d2w|2dw|dw.}
-------------------------------------------
Delete one word

I have a couple of questions.
-------------------------------------------
{c3wsome more^c}
-------------------------------------------
I have some more questions.

$ git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

## ******************************
## Chap. 3. Insert Mode
## ******************************
## Tip 13. Make Corrections Instantly from Insert Mode
{<C-h>|<C-w>|<C-u>}

## Tip 14. Get Back to Normal Mode
{^c|<C-[>|<C-o>}
{<C-o>zz}  # redraws the screen with the current line in the middle of the screen

## Tip 15. Paste from a Register Without Leaving Insert Mode
Practical Vim, by Drew Neil
Read Drew Neil's
-------------------------------------------
{yt,|jA |<C-r>0|.^c}
-------------------------------------------
Practical Vim, by Drew Neil
Read Drew Neil's Practical Vim.

## Tip 16. Do Back-of-the-Envelope Calculations in Place
6 chairs, each costing $35, totals $
-------------------------------------------
{A|<C-r>=6*35<CR>}
-------------------------------------------
6 chairs, each costing $35, totals $210

## Tip 17. Insert Unusual Characters by Character Code
{<C-v>u00bf|ga|<C-v><Tab>}

## Tip 18. Insert Unusual Characters by Digraph
{<C-k>?I|:digraph}

## Tip 19. Overwrite Existing Text with Replace Mode

typing in insert mode extends the line. But in Replace mode
the line length doesn't change.
-------------------------------------------
{f.|r, b}
-------------------------------------------
typing in insert mode extends the line, but in Replace mode
the line length doesn't change.
{gr} # virtual replace Mode, counts tabstop as spaces

## chap. 4. visual Mode
## Tip 20. grok visual Mode
{c-g}  # toggle between Visual and Select modes

## tip 21. define a Visual Selection
Select from here to here.
-------------------------------------------
{vbb|o|e}
-------------------------------------------

## Tip 22. Repeat Line-Wise Visual Commands
def fib(n):
	a, b = 0, 1
	while a < n:
print a,
a, b = b, a+b
fib(42)
-------------------------------------------
:set shiftwidth=4 softtabstop=4 expandtab
{Vj|>.}
-------------------------------------------
def fib(n):
	a, b = 0, 1
	while a < n:
        print a,
        a, b = b, a+b
fib(42)

## Tip 23. Prefer Operators to Visual Commands Where Possible
<a href="#">one</a>
<a href="#">two</a>
<a href="#">three</a>
-------------------------------------------
{vit|U|j.|j.}  # imperfect  {gUit|j.|j.}
-------------------------------------------
<a href="#">ONE</a>
<a href="#">TWO</a>
<a href="#">THREE</a>

## Tip 24. Edit Tabular Data with Visual-Block Mode
Chapter             Page
Normal mode           15
Insert mode           31
Visual mode           44
-------------------------------------------
{<C-v>3j|x...|gv|r||yyp|Vr-}
-------------------------------------------
Chapter      |  Page
--------------------
Normal mode  |    15
Insert mode  |    31
Visual mode  |    44

## Tip 25. Change Columns of Text
li.one   a{ background-image: url('/images/sprite.png'); }
li.two   a{ background-image: url('/images/sprite.png'); }
li.three a{ background-image: url('/images/sprite.png'); }
-------------------------------------------
{<C-v>jje|c|components^[}
-------------------------------------------
li.one   a{ background-image: url('/components/sprite.png'); }
li.two   a{ background-image: url('/components/sprite.png'); }
li.three a{ background-image: url('/components/sprite.png'); }

## Tip 26. Append After a Ragged Visual Block
var foo = 1
var bar = 'a'
var foobar = foo + bar
-------------------------------------------
{$|<C-v>jj$|A;|^[}
-------------------------------------------
var foo = 1;
var bar = 'a';
var foobar = foo + bar;

## Chap. 5. Command-Line Mode
## Tip 27. Meet Vim's Command Line

## Tip 28. Execute a Command on One or More Consecutive Lines
<!DOCTYPE html>
<html>
    <head><title>Practical Vim</title></head>
    <body><h1>Practical Vim</h1></body>
</html>
-------------------------------------------
{:216,219p} {.,$p} {%p} {:'<,'>p}
{/<html>/,/<\/html>/p}
{/<html>/+1,/<\/html>/-1p}
{.,.+3p}
-------------------------------------------

## Tip 29. Duplicate or Move Lines Using ':t' and ':m' Commands
Shopping list
    Hardware Store
        Buy new hammer
    Beauty Parlor
        Buy nail polish remover
        Buy nails
-------------------------------------------
{:242t.} {Vjj|:'<,'>m243}  # :t copy To, :m move to
-------------------------------------------
Shopping list
    Beauty Parlor
        Buy nail polish remover
        Buy nails
    Hardware Store
        Buy nails
        Buy new hammer

## Tip 30. Run Noraml Mode Commands Across a Range
var foo = 1
var bar = 'a'
var baz = 'z'
var foobar = foo + bar
var foobarbaz = foo + bar + baz
-------------------------------------------
{A;^c|jV4<CR>|:'<,'>normal .}
-------------------------------------------
var foo = 1;
var bar = 'a';
var baz = 'z';
var foobar = foo + bar;
var foobarbaz = foo + bar + baz;

## Tip 31. Repeat the Last Ex Command
@: @@  # repeat : command
<C-o>  # (In Normal mode) go back to the previous record in the jump list

## Tip 32. Tab-Complete Your Ex Commands
:command<C-d><Tab>
:colorscheme <C-d>
set wildmenu
set wildmode=full

## Tip 33. Insert the Current Word at the Command Prompt
var tally;
for (tally=1; tally <= 10; tally++) {
    // do something with tally
};
-------------------------------------------
{*(cursor is on tally)|cwcounter^c|:278,280s//<C-r><C-w>/g}
-------------------------------------------
var counter;
for (counter=1; counter <= 10; counter++) {
    // do something with counter
};

## Tip 34. Recall Commands from History
q:    # open the command-line window with history of Ex Commands
q/    # ... with history of searches
<C-f> # switch from Command-Line mode to tge command-line window

write
!ruby %
-------------------------------------------
{A ||^c|J|:s/write/update}
-------------------------------------------
update | !ruby %

## Tip 35. Run Commands in the Shell
<C-z>|$jobs|$fg (in the shell) or
:shell|$exit

## rename *.c *.bla
$vim
:r !ls *.c
:%s/\(.*\).c/mv & \1.bla
:w !sh    # input the content of the buffer to the shell

first name,last name,email
john,smith,john@example.com
drew,neil,drew@vimcasts.org
jane,doe,jane@example.com
-------------------------------------------
{:313,315!sort -t',' -k2}  # :[range]!{filter}
-------------------------------------------
first name,last name,email
jane,doe,jane@example.com
drew,neil,drew@vimcasts.org
john,smith,john@example.com

!{motion}  # drops into Command-Line mode and prepopulates the [range]
!G         # :.,$!

## Tip 36. Run Multiple Ex Commands as a Batch
<ol>
  <li>
    <a href="/episodes/show-invisibles/">
      Show invisibles
    </a>
  </li>
  <li>
    <a href="/episodes/tabs-and-spaces/">
      Tabs and Spaces
    </a>
  </li>
</ol>
-------------------------------------------
:g/href/j
:v/href/d
:%norm A: http://vimcasts.org
:%norm yi"$p
:%s/\v^[^\>]+\>\s//g
-------------------------------------------
<ol>
  <li>
    <a href="/episodes/show-invisibles/">
      Show invisibles
    </a>
  </li>
  <li>
    <a href="/episodes/tabs-and-spaces/">
      Tabs and Spaces
    </a>
  </li>
</ol>

# save into batch.vim
# open several html files to apply  $vim *.html
:argdo source batch.vim

##############################################################
## Part II. Files
##############################################################
## ******************************
## Chap. 6. Manage Multiple Files
## ******************************
## Tip 37. Track Open Files with the Buffer List
:ls
:bn :bp :bf :bl   # buffer next, previous, first, last
<C-^>  # toggle between active and alternate buffers
]b [b [B ]B       # unimpaired.vim
:bd[elete]

## Tip 38. Group Buffers into a Collection with the Argument List
:args
:args index.html app.js
:args **/*.js **/*.css    # globs, ** recurse downward into subdirectories
:args `cat .chapters`     # backtick expansion

## Tip 39. Manage Hidden Files
:qa[ll]!
:wa[ll]
:wn[ext]    # write current file and start editing the next file
:set hidden

## Tip 40. Divide Your Workspace into Split Windows
^ws           # Split horizontally
^wv           # split Vertically
:sp {file}    # split horizontally loading {file}
:vsp {file}   # split vertically loading {file}
^ww           # cycle between open windows
^wc :clo[se]  # close the active window
^wo :on[ly]   # keep only the active window
[N]w^_        # set height to [N] columns
[N]w^|        # set width to [N] columns
:set mouse=a

## Tip 41. Organize Your Window Layouts With Tab Pages
:tabe {filename}      # tabedit, open the file in a new tab
^wt                   # move the current window into its own tab
:tabc                 # tabclose
:tabo                 # tabonly, keep the active tab page, closing all others
{N}gt :tabn[ext] {N}  # goto tab {N}

## ******************************
## Chap. 7. Open Files and Save Them to Disk
## ******************************
## Tip 42. Open a File by Its Filepath Using ':edit'
:pwd
:e %:h<Tab>   # expands to the full path of the current file's directory

## Tip 43. Open a File by Its Filename Using ':find'
$ cd ~/D/w/PVcode/files/mvc
:set path+=app/**
:find Main.js<Tab>

## Tip 44. Explore the File System with netrw
$vim .
:e.
:Ex :Vex :Sex  # netrw Vertical, horizontal Split
let g:netrw_list_hide='.DS_Store'   # .vimrc
1^g   # shows the full path of the current file

## Tip 45. Save Files to Nonexistent Directories
^g   # echoes the name and status of the current file
:e madeup/dir/doesnotexist.yet
:w    # E212: Can't open file for writing
:!mkdir -p %:h  # -p to create intermediate directories
:w

## Tip 46. Save a File as the Super User
$ ls -al /etc/ | grep hosts
$ whoami
$ vim /etc/hosts
:w!       # E212: Can't open file for writing
:w !sudo tee % > /dev/null  # receives the contents of the buffer as standard input

##############################################################
## Part III. Getting Around Faster
##############################################################
## ******************************
## Chap. 8. Navigate Inside Files with Motions
## ******************************
## Tip 47. Keep Your Fingers on the Home Row

## Tip 48. Distinguish Between Real Lines and Display Lines
gj gk g0 g^ g$  # prefix g to act on display lines

## Tip 49. Move Word-Wise
Go fast
-------------------------------------------
{ea|er}   # ea append at the end of the current word
-------------------------------------------
Go faster

gea  # append at the end of the previous word

e.g. we're going too slow   # try moving with www and WW
-------------------------------------------
{cw|you}, {cW|it's}
-------------------------------------------
e.g. you're going too slow
e.g. it's going too slow


## Tip 50. Find by Character
Find the first occurrence of {char} and move to it.
-------------------------------------------
{fx|fo|fc|;;;,}
-------------------------------------------

I've been expecting you, Mister Bond.
-------------------------------------------
{f,dt.}   # find , delete till .
-------------------------------------------
I've been expecting you.

## Tip 51. Search to Navigate
search for your target
it only takes a moment
to get where you want
-------------------------------------------
{/ta<CR>|/tak<CR>}
-------------------------------------------

This phrase takes time but
eventually gets to the point.
-------------------------------------------
{ft|v|/ge<CR>|h|d}
{ft|d/ge<CR>}        # The search command is an exclusive motion.
-------------------------------------------
This phrase gets to the point.

## Tip 52. Trace Your Selection with Precision Text Objects
var tpl = [
  '<a href="{url}">{title}</a>'
]
-------------------------------------------
{/ur<CR>|vi}|a"|i>|it|at|a]}
-------------------------------------------

'<a href="{url}">{title}</a>'
-------------------------------------------
{fl|ci"#^c|citclick here^c}
-------------------------------------------
'<a href="#">click here</a>'

## Tip 53 Delete Around, or Change Inside
Improve your writing by deleting excellent adjectives.
-------------------------------------------
{fx|daw}, {fx|ciwmost}
-------------------------------------------
Improve your writing by deleting adjectives.
Improve your writing by deleting most adjectives.

## Tip 54. Mark Your Place and Snap Back to It
mm `m   # mark m, move to m
``      # last jump position
`.      # last change
`^      # last insertion
`[, `]` # start, end of last change or yank
`<, `>  # start, end of visual selection

## Tip 55. Jump Between Matching Parentheses
console.log([{'a':1},{'b':2}])
-------------------------------------------
{f(%h%l%}  # % jump between opening and closing sets of parentheses
-------------------------------------------

cities = %w{London Berlin New\ York}
-------------------------------------------
{f%|dt{|%r]|``r[}   # dt{ delete till {   # try ^o
-------------------------------------------
cities = [London Berlin New\ York]

# Enable matchit.vim plugin, % jump between matching pairs of keywords
set nocompatible
filetype plugin on
runtime macros/matchit.vim

# surround.vim
cities = ["London", "Berlin", New York]
-------------------------------------------
{fN|vee|S"}  # surround selection with "
-------------------------------------------
cities = ["London", "Berlin", "New York"]
{London}
-------------------------------------------
{f[|cs[{}   # change [] to {}
{cs}]}      # change {} to []
-------------------------------------------
cities = {"London", "Berlin", "New York"}
[London]

## ******************************
## Chap. 9. Navigate Between Files with Jumps
## ******************************
## Tip 56. Traverse the Jump List
:jumps
^o backward, ^i forward

## Tip 57. Traverse the Change List
:changes
g;    # backward, g, forward
`.    # jump to the last change
`^    # jump to the last insertion
gi    # `^ and back into Insert mode

## Tip 58. Jump to the Filename Under the Cursor
~/z9/env.vim
gf    # go to file

:set suffixesadd+=.rb
:set path?

## Tip 59. Snap Between Files Using Global Marks
m{A~Z} `{A-Z}  # to mark and jump between files
mM `M

##############################################################
## Part IV. Registers
##############################################################
## ******************************
## Chap. 10. Copy and Paste
## ******************************
## Tip 60. Delete, Yank, and Put with Vim's Unnamed Register
Practica lvim
-------------------------------------------
{$|F xp}    # xp  transpose the next two characters
-------------------------------------------
Practical vim

2) line two
1) line one
3) line three
-------------------------------------------
{ddp}       # ddp  transpose the order of this line and its successor
-------------------------------------------
1) line one
2) line two
3) line three

## Tip 61. Grok Vim's Register
collection = getCollection();
process(somethingInTheWay, target);
-------------------------------------------
{yiw|jww|diw|"0P}     # yank register 0
{yiw|jww|"_diw|P}     # black hole register _
{"ayiw|jww|diw|"aP}   # named register a..z
-------------------------------------------
collection = getCollection();
process(collection, target);
:reg "0
:h quote_alpha
* When we use an uppercase letter, it appends to the specified register.

The System Clipboard ("+) and Selection ("*) Registers
only work when xterm_clipboard feature was enabled.
"%  name of the current file
"#  name of the alternate file
".  last inserted text
":  last Ex Command
"/  last search pattern

## Tip 62. Replace a Visual Selection with a Register
collection = getCollection();
process(somethingInTheWay, target);
-------------------------------------------
{yiw|jww|ve|p}  try {u|gv|p} - not working
-------------------------------------------
collection = getCollection();
process(collection, target);

I like chips and fish.
-------------------------------------------
{fc|de|mm|ww|ve|p|`m|P}   # swap two words
-------------------------------------------
I like fish and chips.

## Tip 63. Paste from a Register
collection = getCollection();
process(somethingInTheWay, target);
-------------------------------------------
{yiw|jww|ciw^r0}
-------------------------------------------
collection = getCollection();
process(collection, target);

<table>

  <tr>
    <td>Symbol</td>
    <td>Name</td>
  </tr>

</table>
-------------------------------------------
{/tr|yap|gP}  # gP leaves the cursor positioned on the second duplicate
-------------------------------------------
<table>

  <tr>
    <td>Symbol</td>
    <td>Name</td>
  </tr>

  <tr>
    <td>Symbol</td>
    <td>Name</td>
  </tr>

</table>

## Tip 64. Interact with the System Clipboard
:set pastetoggle=<F5>

## ******************************
## Chap. 11. Macro
## ******************************
## Tip 65. Record and Execute a Macro
foo = 1
bar = 'a'
foobar = foo + bar
-------------------------------------------
{qa|A;Ivar |q}{j|@a|j@@}
-------------------------------------------
var foo = 1;
var bar = 'a';
var foobar = foo + bar;

## Tip 66. Normalize, Strike, Abort
:set vb t_vb=[?5h$<100>[?5l   # visual bell

## Tip 67. Play Back with a Count
x = "("+a+","+b+","+c+","+d+","+e+")";
-------------------------------------------
{f+|s + ^[|qq;.q|22@q}  # abort when a motion fails
-------------------------------------------
x = "(" + a + "," + b + "," + c + "," + d + "," + e + ")";

## Tip 68. Repeat a Change on Contiguous Lines
1. one
2. two
3. three
4. four
-------------------------------------------
{qa|0f.|r)|w~|jq|3@a}  # ~ toggles the case
-------------------------------------------
1) One
2) Two
3) Three
4) Four

1. one
2. two
// break up the monotony
3. three
4. four
-------------------------------------------
{qa|0f.|r)|w~q|jV3j|:'<,'>norm @a<CR>} # in parallel
-------------------------------------------
1) One
2) Two
// break up the monotony
3) Three
4) Four

## Tip 69. Append Commands to a Macro
1. one
2. two
-------------------------------------------
{qa|0f.|r)|w~q}{qA|jq|@a}   # append
-------------------------------------------
1) One
2) Two

## Tip 70. Act Upon a Collection of Files
# ...[end of copyright notice]
class Animal
  # implementation
end
-------------------------------------------
:cd ~/D/w/PVcode/macros/ruby_module
:args *.rb
:args
:first
{qa|gg/class<CR>|Omodule Rank^[|j>G|Goend^[|q}
:edit!
:argdo norm @a
-------------------------------------------
# ...[end of copyright notice]
module Rank
  class Animal
    # implementation
  end
end  

# source macros/rc.vim
set nocompatible
filetype plugin indent on
set hidden
if has("autocmd")
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

## Tip 71. Evaluate an Iterator to Number Items in a List
partridge in a pear tree
turtle doves
French hens
calling birds
golden rings
-------------------------------------------
:let i=1
{qa|I^r=i<CR> ^[}
:let i+=1
{q|jV3j}
:'<,'>norm @a
-------------------------------------------
1) partridge in a pear tree
2) turtle doves
3) French hens
4) calling birds
5) golden rings

## Tip 72. Edit the Contents of a Macro
1. One
2. Two
3. three
4. four
-------------------------------------------
:let @a='0f.r)w~j'  # ~ toggles the case
{"aP|0f~|svU^[}     # Paste a and edit the macro
{0|"ay$|dd}         # save to a and delete
  or
:let @a=substitute(@a, '\~', 'vU', 'g')
-------------------------------------------
1) One
2) Two
3) Three
4) Four

##############################################################
## Part V. Patterns
##############################################################
## ******************************
## Chap. 12. Matching Patterns and Literals
## ******************************
## Tip 73. Tune the Case Sensitivity of Search Patterns
:set ic     # ignorecase
:set scs    # smartcase, including uppercase char makes case sensitive
\c  \C      # ignore case, case sensitive PER search

## Tip 74. Use the \v Pattern Switch for Regex Searches
body    { color: #3c3c3c; }
a       { color: #0000EE; }
strong  { color: #000; }

/#\([0-9a-fA-F]\{6}\|[0-9a-fA-F]\{3}\)  # [ doesn't need to escape. Escape only for opening {
/\v#([0-9a-fA-F]{6}|[0-9a-fA-F]{3})     # \v very magic pattern matching
/\v#(\x{6}|\x{3})     # :h /character-classes

## Tip 75. Use the \V Literal Switch for Verbatim Searches
The N key searches backward...
...the \v pattern switch (a.k.a. very magic search)...

/a.k.a.     # "backward" a false positive match
/a\.k\.a\.  # cancel out the special meaning of . by escaping it
/\Va.k.a.   # Very nomagic

## Tip 76. Use Parentheses to Capture Submatches

I love Paris in the
the springtime.    # {vipJ} joins two lines

/\v<(\w+)\_s+\1>    # \1 the captured text with the submatch ()
                    # \_s white space or a line break

/\v(And|D)rew Neil        # use parentheses for grouping
/\v%(And|D)rew Neil       # do not capture to \1
/\v(%(And|D)rew) (Neil)   # replace first and last name
:%s//\2, \1/g

## Tip 77. Stake the Boundaries of a Word

the problem with these new recruits is that
they don't keep their boots clean.

/the      # matches not only 'the' but also 'these', 'they' and 'their'
/\v<the>  # <> word boundary delimiters, zero-width
*, #      # seach forward, backward for the word under the cursor with <>
g*, g#    # " without <>

## Tip 78. Stake the Boundaries of a Match

Match "quoted words"---not quote makrs.

/\v"[^"]+"        # [^"]+ one or more characters anything but a quote
/\v"\zs[^"]+\ze"  # \zs, \ze start and end of the match, excludes "

## Tip 79. Escape Problem Characters

Search items: [http://vimdoc.net/search?q=/\\][s]
...
[s]: http://vimdoc.net/search?q=/\\
-------------------------------------------
{0fv|"uyi[|/\V^ru<CR>}
{/\V^r=}
=escape(@u, getcmdtype().'\')     # getcmdtype() returns / or ?
-------------------------------------------

/\Vhttp:\/\/vimdoc.net\/search?q=\/\\\\

## ******************************
## Chap. 13. Search
## ******************************
## Tip 80. Meet the Search Command
gn/gN  moves cursor to the next/previous match and then enables Visual mode with selection

## Tip 81. Highlight Search Matches
:set hls  (or :se hls!)   # highlight on
:set nohls                # highlight off
:noh                      # mute the search highlighting temporarily
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

## Tip 82. Preview the First Match Before Execution
The car was the color of a carrot.
/carr^r^w   # ^r^w autocompletes the search field

## Tip 83. Offset the Cursor to the End of a Search Match
Aim to learn a new programming lang each year.
Which lang did you pick up last year?
Which langs would you like to learn?
-------------------------------------------
/lang/e             # place cursor at the end of the match
{a|uage^[|n.|n.}
-------------------------------------------
Aim to learn a new programming language each year.
Which language did you pick up last year?
Which languages would you like to learn?

//e   # modify the last search with an offset

## Tip 84. Operate on a Complete Search Match
class XhtmlDocument < XmlDocument; end
class XhtmlTag < XmlTag; end
-------------------------------------------
/\vX(ht)?ml\C
{gUgn|...}
-------------------------------------------
class XHTMLDocument < XMLDocument; end
class XHTMLTag < XMLTag; end

## Tip 85. Create Complex Patterns by Iterating upon Search History
This string contains a 'quoted' word.
This string contains 'two' quoted 'words.'
This 'string doesn't make things easy.'
-------------------------------------------
/\v'.+'             # .+  greedy match
/\v'[^']+'          # [^']+ any char except '
/\v'([^']|'\w)+'    # '\w  ' followed immediately by a letter
/\v'(([^']|'\w)+)'  # submatch
%s//"\1"/g
-------------------------------------------
This string contains a "quoted" word.
This string contains "two" quoted "words."
This "string doesn't make things easy."

/\v'[^']+' 
-------------------------------------------
q/                      # summon command-line window
{f[|c%(^r")^[|i|'\w^[}  # mordal editing
-------------------------------------------
/\v'([^']|'\w)+' 

## Tip 86. Count the Matches for the Current Pattern
var buttons = viewport.buttons;
viewport.buttons.previous.show();
viewport.buttons.next.show();
viewport.buttons.index.hide();
-------------------------------------------
/\<buttons\>
:%s///gn          # n flag suppresses the usual behavior
:vimgrep //g 
:cope
:cnext
:cprev
-------------------------------------------

## Tip 87. Search for the Current Word in Visual Mode
She sells sea shells by the sea shore.
* command searches for the word under the curser

The following snippet of Vim script makes * command search for the current selection.

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

## ******************************
## Chap. 14. Substitution
## ******************************
## Tip 88. Meet the Substitute Command
:[range]s/{pattern}/{replacement string}/{flags}

## Tip 89. Find and Replace Every Match in a File
When the going gets tough, the tough get going.
If you are going through hell, keep going.
-------------------------------------------
:s/going/rolling
:s/going/rolling/g
:%s/going/rolling
-------------------------------------------
When the rolling gets tough, the tough get rolling.
If you are rolling through hell, keep rolling.

## Tip 90. Eyeball Each Substitution
...We're waiting for content before the site can go live...
...If you are content with this, let's go ahead with it...
...We'll launch as soon as we have the content...
-------------------------------------------
:%s/content/copy/gc
-------------------------------------------

## Tip 91. Reuse the Last Search Pattern
:%s/^r//"\1"/g  # copy search register to leave the command history

## Tip 92. Replace with the Contents of a Register
:%s//^r0/g      # pass by value
:%s//\=@0/g     # pass by reference

:let @/='Pragmatic Vim'
:let @a='Practical Vim'
:%s//\=@a/g

## Tip 93. Repeat the Previous Substitute Command
g&          # repeat a line-wise substitution across the entire file
:%s//~/&    # equivalent to g&

mixin = {
  appyName: function(config) {
    return Factory(config, this.getName());
  },
}
-------------------------------------------
{/a<CR>|Vjj|yP}
:%s/Name/Number/g
{u|gv}              # gv rehighlights the last selection
:'<,'>&&            # repeat the last :substitute command reusing the flags
-------------------------------------------
mixin = {
  appyName: function(config) {
    return Factory(config, this.getName());
  },
  appyNumber: function(config) {
    return Factory(config, this.getNumber());
  },
}

## Tip 94. Rearrange CSV Fields Using Submatches
last name,first name,email
neil,drew,drew@vimcasts.org
doe,john,john@example.com
-------------------------------------------
/\v^([^,*),([^,*),([^,*)$    # ([^,*)  zero or more consecutive non-commas
:%s//\3,\2,\1
-------------------------------------------
email,first name,last name
drew@vimcasts.org,drew,neil
john@example.com,john,doe

## Tip 95. Perform Arithmetic on the Replacement
<h2>Heading number 1</h2>
<h3>Number 2 heading</h3>
<h4>Another heading</h4>
-------------------------------------------
/\v\<\/?h/zs\d
:s//\=submatch(0)-1/g
-------------------------------------------
<h1>Heading number 1</h1>
<h2>Number 2 heading</h2>
<h3>Another heading</h3>

## Tip 96. Swap Two or More Words
The dog bit the man.
-------------------------------------------
let swapper={"dog":"man", "man":"dog"}
echo swapper["dog"]
echo swapper["man"]
\v(<man>|<dog>)
%s//\={"dog":"man", "man":"dog"}[submatch(1)]/g
-------------------------------------------
* Try Abolish.vim
:%s/{man,dog}/{dog,man}/g

## Tip 97. Find and Replace Across Multiple Files
Pragmatic Bookshelf ... Pragmatic Vim {within multiple files}
-------------------------------------------
/Pragmatic\ze Vim
:vimgrep // **/*.txt
:copen                            # open quickfix window
:set hidden
:cfdo %s//Practical/g | update    # | is a command separator
-------------------------------------------
Pragmatic Bookshelf ... Practical Vim

## ******************************
## Chap. 15. Global Commands
## ******************************
## Tip 98. Meet the Global Command
:[range] global[!] /{pattern}/ [cmd]

## Tip 99. Delete Lines Containing a Pattern
<ol>
  <li>
    <a href="/episodes/show-invisibles/">
      Show Invisibles
    </a>
  </li>
  <li>
    <a href="/episodes/tabs-and-spaces/">
      Tabs and Spaces
    </a>
  </li>
  <li>
    <a href="/episodes/whitespace-preferences-and-filetypes/">
      Whitespace preferences and filetypes
    </a>
  </li>
</ol>
-------------------------------------------
/\v\<\/?\w+>      # \/? an optional /
:g//d             # delete any lines with tag
-------------------------------------------
      Show Invisibles
      Tabs and Spaces
      Whitespace preferences and filetypes
      
-------------------------------------------
:v/href/d         # delete each line that doesn't contain href
-------------------------------------------
    <a href="/episodes/show-invisibles/">
    <a href="/episodes/tabs-and-spaces/">
    <a href="/episodes/whitespace-preferences-and-filetypes/">

## Tip 100. Collect TODO Items in a Register
Markdown.dialects.Gruber = {
  lists: function() {
    // TODO: Cache this regexp for certain depts.
    function regex_for_depth(depth) { /* implementation */ }
  },
  "`": function inlineCode( text ) {
    var m = text.match( /(`+)(([\s\S]*?)\1)/ );
    if ( m && m[2] )
      return [ m[1].length + m[2].length ];
    else {
      // TODO: No matching end code found - warn!
      return [ 1, "`" ];
    }
  }
}
-------------------------------------------
:g/TODO
:qaq              # clear reg a
:reg a
:g/TODO/yank A    # append to reg a
:reg a
:g/TODO/t$        # append to the end of the file
-------------------------------------------
    // TODO: Cache this regexp for certain depts.
      // TODO: No matching end code found - warn!

## Tip 101. Alphabetize the Properties of Each Rule in a CSS File
html {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
body {
  line-height: 1.5;
  color: black;
  background: white;
}
-------------------------------------------
{ggf{|vi{}
:'<,'>sort
:g/{/ .+1,/}/-1 sort      # For every line that matches
:g/{/sil .+1,/}/-1 >      # :silent mutes the messages
-------------------------------------------
:g/{start}/ .,{finish} [cmd]   # For each range of lines, run the specified [cmd].

##############################################################
## Part VI. Tools
##############################################################
## ******************************
## Chap. 16. Index and Navigate Source Code with ctags
## ******************************
## Tip 102. Meet ctags
$ sudo apt-get install exuberant-ctags  # for ubuntu
For mac, download source from ctags.sourceforge.net
$ tar xzvf ctags-5.8.tar.gz
$ cd ctags-5.8
$ ./configure
$ make
$ sudo make install
$ which -a ctags
/usr/local/bin/ctags  # this should come first, otherwise modify $PATH order
/usr/bin/ctags

$ cd ~/D/w/PVcode/ctags
$ ctags *.rb

## Tip 103. Configure Vim to Work with ctags
:set tags?    # where Vim should look to find a tag file
tags=./tags,tags
$!ctags -R
:nnoremap <f5> :!ctags -R<CR>
:autocmd BufWritePost * call system("ctags -R")

## Tip 104. Navigate Keyword Definitions with Vim's Tag Navigation Commands
^]  :tag
g^] :tjump
^t  :pop
:tjump /phone$

## ******************************
## Chap. 17. Compile Code and Navigate Errors with the Quickfix List
## ******************************
## Tip 105. Compile Code Without Leaving Vim
$ cd ~/D/w/PVcode/quickfix/wakeup
:make

## Tip 106. Browse the Quickfix List
:copen
:cclose
:cc N     # jump to Nth item

## Tip 107. Recall Results from a Previous Quickfix List
:colder   # recall an older version of the quickfix list
:cnewer

## Tip 108. Customize the External Compiler
$ npm install nodelint -g
:setlocal makeprg=NODE_DISABLE_COLORS=1\ nodelint\ %
:setglobal errorformat?
:args $VIMRUNTIME/compiler/*.vim

## ******************************
## Chap. 18. Search Project-Wide with grep, vimgrep, and Others
## ******************************
## Tip 109. Call grep Without Leaving Vim
:grep -ir Waldo *   # i case-insensitive, r recursive, (n line number: default flag)

## Tip 110. Customize the grep Program
:set grepprg?
  grepprg=grep -n $* /dev/null
:set grepformat?
  grepformat=%f:%l:%m,%f:%l%m,%f  %l%m    # %f filename, %l line number, %m text
:h errorformat

$ sudo apt-get install ack-grep
$ sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

$ brew install ack

$ ack --nogroup --column Waldo *

:set grepprg=ack\ --nogroup\ --column\ $*
:set grepformat=%f:%l:%c:%m

# install fugitive.vim that adds a custom :Ggrep command that executes git-grep

## Tip 111. Grep with Vim's Internal Search Engine
$ cd ~/D/w/PVcode/grep/quotes
:vim[grep] /going/g *.txt

:args *.txt
:vim /going/g ##

/[Dd]on't
:vim //g *.txt

:vim //g ##     or :vim /^r//g ## (to preserve the pattern in the command history)

## ******************************
## Chap. 19. Dial X for Autocompletion
## ******************************
## Tip 112. Meet Vim's Keyword Autocompletion
:set inf[ercase]  # the case of the match is adjusted depending on the typed text

She sells sea shells by the sea.
-------------------------------------------
{^n} {^p}   # generic keywords
{^x^n}      # current buffer keywords
-------------------------------------------

## Tip 113. Work with the Autocomplete Pop-Up Menu
-------------------------------------------
{^e}      # exit from autocompletion
{^n^p}    # filter the word in real time
{^x^o^p}  # live filtering on omni auto completion
{^x^f^p}  # " on filename completion
-------------------------------------------

## Tip 114. Understand the Source of Keywords
:set complete?          # customizing the generic autocompletion
  complete=.,w,b,u,t,i  # :h complete
-------------------------------------------
{^x^i}    # included files  :set include?
{^x^]}    # tag files
-------------------------------------------

## Tip 115. Autocomplete Words from the Dictionary
The antidi
-------------------------------------------
:set spell
{^x^k}    # from the dictionary
-------------------------------------------
The antidisestablishmentarianism

## Tip 116. Autocomplete Entire Lines
.top {
  background-color: #ef66ef; }
.bottom {
-------------------------------------------
{^x^l}    # whole-line autocompletion
-------------------------------------------
.top {
  background-color: #ef66ef; }
.bottom {
  background-color: #ef66ef; }

## Tip 117. Autocomplete Sequences of Words
Here's the "hyperlink" for the Vim tutor:
<vimref href="http://vimhelp.appspot.com/usr_01.txt.html#tutor">tutor</vimref>

For more information on autocompletion see:
<vimr
-------------------------------------------
a{^x^p}{^x^p}{^p}{^x^p}{^x^p}
-------------------------------------------
<vimref href="http://vimhelp.appspot.com/usr_01.txt.html#insert">ins-completion</vimref>

## Tip 118. Autocomplete Filenames
:pwd
:cd ~/D/w/PVcode/
s{^x^f}
:cd -

## Tip 119. Autocomplete with Context Awareness
:set omnifunc=csscomplete#CompleteCSS
h1 { ba
-------------------------------------------
{^x^o}    # omni-completion
-------------------------------------------
h1 { background-color: 

# in ~/.vimrc
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss   set ft=scss.css

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss       setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php            setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType c              setlocal omnifunc=ccomplete#Complete
augroup END

## ******************************
## Chap. 20. Find and Fix Typos with Vim's Spell Checker
## ******************************
## Tip 120. Spell Check Your Work
Yoru mum has a moustache.
-------------------------------------------
:set spell
[s ]s   # jump backward and forward between flagged words
z=      # a list of suggested corrections
1z=     # use the 1st suggestion
-------------------------------------------

## Tip 121. Use Alternate Spelling Dictionaries
:set spelllang=en_us    # local to buffer, American English
:set spelllang=fr       # download

## Tip 122. Add Words to the Spell File
~/.vim/spell/en.utf-8.add
zg    # add the word under the cursor to a spell file
zw    # mark as misspelled
zug   # reverts the zg or zw command

:setl spelllang=en_us
:setl spellfile= ~/.vim/spell/en.utf-8.add
:setl spellfile+= ~/z9/jargon.utf-8.add     # 2zg to add to the second spell file

## Tip 123. Fix Spelling Errors from Insert Mode
Yoru mum has a moustache.
^xs

## ******************************
## Chap. 21. Now What?
## ******************************
## Appendix 1. Customize Vim to Suit to Your Preferences
:set ic&    # & reset any option to its default value
:set ic?
:set ts=2 sts=2 sw=2 et   # tabstop softtabstop shiftwidth expandtab
:setl ts=4                # applies to the active buffer only
:bufdo setl ts=4
:windo setl number        # line numbering for every window
:e $MYVIMRC               # $MYVIMRC="/Users/jianak/.vimrc"
:so $MYVIMRC

if has("autocmd")
  filetype on
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet
endif

:h ftplugin-name      # filetype plugin, to apply lots of settings to a particular kind of file
# ~/.vim/after/ftplugin/javascript.vim
setlocal ts=4 sts=4 sw=4 noet
compiler nodelint

## ******************************
:set list listchars=tab:>-,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
:set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
:set list listchars=tab:»·,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
:set list listchars=tab:>-,eol:¶
" The command :dig displays other digraphs you can use.

# to change all the existing tabs to spaces
:retab

## iTerm2
Cmd+/         Show cursor position
Option+Cmd+i  Simultaneous input on each session
Option+Cmd+/  Directories list you visit frequently
$ open .      Opens current folder in finder

## ******************************
Neovim
$brew install neovim
" Share vim's config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

