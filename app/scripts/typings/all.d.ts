/// <reference path="tsd/tsd.d.ts" />
/// <reference path="chrome.d.ts" />

interface Window{
  define(definition:string, dependencies:string[], fuc): boolean;
}
