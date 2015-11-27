# add cask bin paths (for caskroom emacs-mac for example)
EXCLUDE=emacs
if [[ -d /opt/homebrew-cask ]]; then
    export PATH="$(find /opt/homebrew-cask -type d -path '*/Contents/MacOS/bin'|egrep -v ${EXCLUDE}|tr '\n' :)$PATH"
fi
