# Defined in - @ line 2
function glout
	git log --oneline --decorate --graph $argv (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD))..HEAD
end
