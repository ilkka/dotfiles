# Defined in /var/folders/s7/2ypm2j2j7m1_71jb9wx02tsh0000gq/T//fish.pSZiiO/glout.fish @ line 2
function glout
	git log --oneline --decorate --graph (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))..HEAD
end
