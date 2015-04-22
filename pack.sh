grunt dist
cp app.pem dist/key.pem
#/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --pack-extension=app --pack-extension-key=app.pem
zip -r dist.zip dist
echo "please upload the dist.zip to https://chrome.google.com/webstore/developer/edit/cbdponefdfobikfhoflfnmmcmmoogleo"
echo "hint: hit the Upload Updated Package button"
read -p "hit [Enter] to open the finder and the dashboard"
open .
open https://chrome.google.com/webstore/developer/edit/cbdponefdfobikfhoflfnmmcmmoogleo
rm dist/key.pem
