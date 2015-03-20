cp app.pem app/key.pem
#/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --pack-extension=app --pack-extension-key=app.pem
echo "Zip the dir ./app. I will open a finder for you. Hit [Enter] when you're ready"
read
open .
echo "Ok, ready when you are"
read
rm app/key.pem

