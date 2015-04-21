# Renuo Workflow

## Summary

Contains the chrome extension to enhance the Renuo workflow, see /app.

Use ```grunt serve``` for development.

## Setup

```
git clone
npm install -g tsd@next
npm install -g grunt-cli
tsd reinstall --save --overwrite
```

## Converting Coffeescript to Typescript

```
npm install -g coffee-script-to-typescript
```

## Deployment

* Download the app.pem from here: https://redmine.renuo.ch/attachments/download/1926/app.pem
* Increase the version number in manifest.json.
* Use pack.sh to pack the extension.
* Upload it to here: https://chrome.google.com/webstore/developer/dashboard

## Dependencies / Type Definitions

Install a new dependency (e.g. jquery): ```tsd install jquery --save```

Install existing dependencies:

```
tsd rebundle
tsd reinstall
```

More info: https://github.com/DefinitelyTyped/tsd
