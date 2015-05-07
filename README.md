# Renuo Workflow

## Summary

Contains the chrome extension to enhance the Renuo workflow, see /app.

Use

```sh
grunt serve
```

for development.

## Setup

```sh
git clone git@git.renuo.ch:renuo/renuo-workflow.git
npm install -g tsd@next
npm install -g grunt-cli
npm install -g karma-cli
tsd reinstall --save --overwrite
```

## Converting Coffeescript to Typescript

```sh
npm install -g coffee-script-to-typescript
```

## Deployment

* Download the app.pem from here: https://redmine.renuo.ch/attachments/download/1926/app.pem
* Increase the version number in manifest.json, bower.json, package.json (TODO: automate this).
* Use pack.sh to pack the extension.
* Upload it to here: https://chrome.google.com/webstore/developer/dashboard

## Dependencies / Type Definitions

Install a new dependency (e.g. jquery)

```sh
tsd install jquery --save
```

Install existing dependencies:

```sh
tsd rebundle
tsd reinstall
```

More info: https://github.com/DefinitelyTyped/tsd

## Tests

Use 

```sh
grunt test
```

## Concepts

### Issue Sorting and Priority

There are 2 different priorities in the system.

* The human readable *Priority* (e.g. Normal, High, Urgent, etc.)
** Is shared and entered by the customer
** Is relative in each project
* The numerical priority *NP* 
** This priority is used to plan sprints (the company backlog, across multiple projects)
** Enables drag'n'drop functionality

The key problem is that for the product backlog (what will be done next week) we need the numerical priority.
However, a customer doesn't want to see that all his tickets are on "Low" priority because they will be planned next
week. On the other hand, it would be nice if the NP and the priority would be in sync.

We do the following:

* Every NP must be distinct, so the issues can be ordered
* Every priority is assigned to a NP when the issue is created (e.g. Low = between 100 and 300, Normal between 300 and 
500, etc.)
* When a priority is changed, the NP is not changed (for now)
* When a issue is dragged around, only the NP is changed, not the priority (for now)
** The new NP will be in the middle of the two jammed issues NP's. If these values are too close to each other, there
will be a warning in the user interface (has to be resolved manually)

## CI

https://ci.renuo.ch/projects/42
