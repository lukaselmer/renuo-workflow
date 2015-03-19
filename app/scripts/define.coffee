'use strict'

throw new Exception('window.define is already defined!') if window.define or window.defineStore

window.define = (name, dependencies, func) ->
  window.defineStore ||= {}
  window.defineStore.register ||= {}
  window.defineStore.active ||= {}

  throw "name #{name} is already taken" if window.defineStore.register[name]
  window.defineStore.register[name] = [dependencies, func]

  unless window.defineStore.loadDependency
    loadSingleDependency = (dependencyName) ->
      throw "Dependency #{dependencyName} not found" unless window.defineStore.register[dependencyName]

      return window.defineStore.active[dependencyName] if window.defineStore.active[dependencyName]

      [innerDependencies, innerFunc] = window.defineStore.register[dependencyName]
      loadedDependencies = innerDependencies.map (dependency) -> loadSingleDependency(dependency)

      window.defineStore.active[dependencyName] = innerFunc.apply(this, loadedDependencies)
      window.defineStore.active[dependencyName]

    window.defineStore.loadDependency = loadSingleDependency
