cp app.pem app/key.pem
#/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --pack-extension=app --pack-extension-key=app.pem
zip -r app.zip app
echo "please upload the app.zip to https://chrome.google.com/webstore/developer/dashboard"
echo "hit [Enter] to open the finder and the dashboard"
open .
open https://chrome.google.com/webstore/developer/dashboard
rm app/key.pem

