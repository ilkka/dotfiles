# Defined in - @ line 1
function cat
    if command -q batcat
        batcat $argv
    else
        bat $argv
    end
end
