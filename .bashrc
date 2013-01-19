export PATH=$PATH:~/gems/bin
if [ -z "$GEM_PATH" ]
then
  export GEM_PATH=~/gems
else
  export GEM_PATH=$GEM_PATH:~/gems
fi
export GEM_HOME=~/gems