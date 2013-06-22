echo "Fuck the world!\n\n"

"First loop
echo "First loop:\n"
let i = 1
while i < 5
	echo "i is: " i
	let i += 1
endwhile

"Second loop
echo "Second loop:\n"
for i in range(1, 4)
	echo "i is: " i
endfor

"Numbers type
let num = -0x28 "\-40 in decimal
echo "print numbers are always in decimal: " num

"Playing with vars
let global_var = "All scripts can read this!"
let s:script_var = "Only this script can read this!"

echo "global_var: " global_var
echo "script_var: " s:script_var

"This will cause an error
"unlet global_var
"echo \"global_var deleted: " global_var

source /tmp/vim_script/script0_extended.vim"
