#!/bin/zsh

# Exec grunt lints and tests
grunt lint
RC=$?
if [ ! $RC -eq 0 ]; then
  echo 'grunt lint failed!'
  exit 1
fi

grunt test
RC=$?
if [ ! $RC -eq 0 ]; then
  echo 'grunt test failed!'
  exit 1
fi


