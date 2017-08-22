# Defined in - @ line 2
function glin
	git log --oneline --decorate --graph $argv HEAD..(git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))
end
