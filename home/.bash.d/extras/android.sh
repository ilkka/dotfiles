# Android sdk location
# TODO: works only on OS X
ANDROID_HOME="$HOME/Library/Android/sdk"
if [[ -d $ANDROID_HOME ]]; then
  export ANDROID_HOME
  export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
fi
