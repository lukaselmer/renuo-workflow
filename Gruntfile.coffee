# Generated on 2014-12-23 using generator-angular 0.10.0
'use strict'

module.exports = (grunt) ->
  require('load-grunt-tasks') grunt
  require('time-grunt') grunt

  appConfig =
    app: require('./bower.json').appPath
    dist: 'dist'

  grunt.initConfig
    yeoman: appConfig

    watch:
      ts:
        files: ['app/scripts/{,*/}{,*/}*.ts']
        tasks: ['newer:ts:dist']
      coffee:
        files: ['app/scripts/{,*/}{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: ['newer:coffee:dist']
      coffeeTest:
        files: ['test/spec/{,*/}{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: [
          'newer:coffee:test'
          'karma'
        ]
      compass:
        files: ['app/styles/{,*/}*.{scss,sass}']
        tasks: [
          'compass:server'
        ]
      gruntfile:
        files: ['Gruntfile.coffee']

    clean:
      dist:
        files: [
          dot: true
          src: [
            'app/out'
            'dist/{,*/}*'
            '!dist/.git{,*/}*'
          ]
        ]
      server: 'app/out'

    ts:
      dist:
        src: 'app/scripts/{,*/}{,*/}*.ts'
        out: 'app/out/scripts/app.js' # we could also use the outDir: 'app/out/scripts'
        target: 'es6'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''
      dist:
        files: [
          expand: true
          cwd: 'app/scripts'
          src: '{,*/}{,*/}*.coffee'
          dest: 'app/out/scripts'
          ext: '.js'
        ]

    compass:
      options:
        sassDir: 'app/styles'
        cssDir: 'app/out/styles'
        generatedImagesDir: 'app/out/images/generated'
        imagesDir: 'app/images'
        javascriptsDir: 'app/scripts'
        importPath: 'app/bower_components'
        httpImagesPath: '/images'
        httpGeneratedImagesPath: '/images/generated'
        relativeAssets: false
        assetCacheBuster: false
        raw: 'Sass::Script::Number.precision = 10\n'
      dist:
        options:
          generatedImagesDir: 'dist/images/generated'
      server:
        options:
          debugInfo: true

      styles:
        expand: true
        cwd: 'app/styles'
        dest: 'app/out/styles/'
        src: '{,*/}*.css'

    concurrent:
      server: [
        'coffee:dist'
        'ts:dist'
        'compass:server'
      ]
      test: [
        'coffee'
        'compass'
      ]

  grunt.registerTask 'serve', 'Compile then start a connect web server', ->
    grunt.task.run [
      'clean:server'
      'concurrent:server'
      'watch'
    ]

  grunt.registerTask 'default', [
    'serve'
  ]
