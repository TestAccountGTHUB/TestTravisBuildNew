#create a new directory that will contain out generated apk
  mkdir $HOME/buildApk/
  #copy generated apk from build folder to the folder just created
  echo -e "Debug Folder\n"
  ls app/build/outputs/apk/debug/
  cp -R app/build/outputs/apk/debug/app-debug.apk $HOME/buildApk/
  echo -e "Build APK Folder\n"
  ls $HOME/buildApk/
  #go to home and setup git
  echo -e "Before Clone At Home Folder \n"
  cd $HOME
  ls
  git config --global user.email "trythisemail123@gmail.com"
  git config --global user.name "TestAccountGTHUB"
  #clone the repository in the buildApk folder
  git clone --quiet --branch=master  https://TestAccountGTHUB:$GITHUB_API_KEY@github.com/TestAccountGTHUB/TestRepo  master > /dev/null
  #go into directory and copy data we're interested
  echo -e "After Clone At Home Folder \n"
  ls
  echo -e "Master Folder \n "

  cp -R $HOME/buildApk/app-debug.apk $HOME/master/
  cd master
  grep -i "tom" .travis.yml
  sed -Ei 's/Android|IOS/Android/g' .travis.yml
  ls
  #add, commit and push files
  git add -f .
  git remote rm origin
  git remote add origin https://TestAccountGTHUB:$GITHUB_API_KEY@github.com/TestAccountGTHUB/TestRepo.git
  git add -f .
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed [skip ci] "
  git push -fq origin master > /dev/null
  echo -e "Done\n"