# Typographic Hotkeys

Extend default Windows keyboard with special typographic symbols like –, —, ™, ℠, ©, ®, €, ≠, ±, ≤, ≶ and other. Script enables **Mac OS X special characters shortcuts**, **Linux compose keys**, **HTML symbol codes**, **MS Office**-like autocorrection and other enhancements.

* Basic typograpy «», „‟, “”, –, —, … (__Thin space!__)
* Math ±, ≤, ≥, ×, …
* Currencies €, ¥, £, … (__Rouble sign supported!__ `[rur]` → ⃏)
* Shapes ●, ▪, |, …
* Symbols
* Arrows ↑,→,↓,←
* Fractions
* Special numbers

TODO:
* all possible symbols
* mac shortcuts
* readme
* numerous tests
* pr: habrahabr, typographic community, authors, questions in forums, official forum, 

Ideas:
*rgba to rgb, to hex, to hsl by just select and click hotkey
*some utf symbol to hmtl notion, like select © → `\&copy\;`

## Installation
1. Download and install <a href="http://www.autohotkey.com/">Autohotkey</a>™
2. Download <a href="http://dmitry-ivanov.me/playground/windows_typographic_hotkeys/TypographicHotkeys.ahk">TypographicHotkeys.ahk</a>, put it anywhere (i. e. _My Documents_) and open it with Autohotkey™
3. Get started with `Alt + -`, `Ctrl + Alt + -`, `(c)`, `Alt + →↓←↑`, `Ctrl + Alt + →↓←↑` 

## Usage
There are three different ways of inserting characters.

1. **Mac OS X Shortcuts** way. Use <a href="http://www.nouilles.info/keyboard_shortcuts.html">OS X shortcuts for special characters</a>, just as if you were on Mac, but with `⌘` changed to `Ctrl`. For example, <kbd>Alt</kbd> + <kbd>-</kbd> = `–`, <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>-</kbd> = `—`, …
2. **Linux and Solaris Compose Keys** way. Symbols are inserted by means of typing some characters while <kbd>Compose Key</kbd> being pressed. <kbd>Compose Key</kbd> is assigned to the most rarely used <kbd><a href="http://en.wikipedia.org/wiki/Menu_key">Menu Key</a></kbd> (also known as _Console Menu Key_, just next to the <kbd>Right Alt</kbd>.).
3. **HTML Symbol Codes** way. Use common <a href="http://www.w3schools.com/tags/ref_symbols.asp">HTML Symbol Codes</a> next way: `[Some_HTML_Symbol_Name]`. For example, `[beta]` will be changed to `β`, and `[mdash]` will be changed to `—`.
4. Additional enhancements and autocorrections:
 * `(c)` → `©`
 * `(r)` → `®`
 * <kbd>Alt</kbd> + <kbd>↑, →, ↓, ←</kbd> → `↑`, `→`, `↓`, `←`
 * <kbd>Alt</kbd> + <kbd>Space</kbd> → ` ` (thin space)
 * `...` → `…`
…

## List of supported characters

### Basic typography
* — Em dash, `Alt + Ctrl + -` or `[---]`
* – En dash, `Alt + -`
* «», “”, „‟ as `Modifier + [` and `Modifier + ]`
* **Thin space** on `Alt + space`!
* … as `...`
* ± ∓ as `+-`, `-+`
* ≈ as `Alt + ~`
* © as `(c)`
* ® as `(r)`
* ™ as `[tm]`
* ℠ as `[sm]`
* ° as `[deg]`
* ‽ as `?!` and `!?`
* ⁂ as `***`

### Math symbols
* ≠≡꞊ on `Modifier += `

### Shapes

### Symbols

### Currency
* €, ¥, … as `[EUR]`, `[JPY]` and other <a href="http://en.wikipedia.org/wiki/Currency_code">currency codes</a>
* €, ¥, … as `[e-]`, `[y-]` and other letter abbrs.

### Fractions & Numbers
* ½, ⅓ … as `1/2`, `1/3`
* ①, ⑵, ⒊ as `[1]`, `(2)`, '[3.]'

### Arrows 
* ←↑→↓ = `Alt + ←, ↑, →, ↓`. 
* Try to use modifiers
* Rouble sign (so far only in <a href="http://www.paratype.com/public/">Public Type Family</a>) as `[rur]`
* I'm tired. Maybe later I will document full list.