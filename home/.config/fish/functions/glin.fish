# Defined in /var/folders/s7/2ypm2j2j7m1_71jb9wx02tsh0000gq/T//fish.5b2Asb/glin.fish @ line 1
function glin
	git log --oneline --decorate --graph HEAD..(git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))
end
