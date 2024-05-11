if command -v gdu-go
  function gdu --wraps='gdu-go' --description 'alias gdu gdu-go'
    gdu-go $argv
  end
end
