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
        files: ['app/scripts/{,*/}{,*/}*.ts', '!app/scripts/{,*/}{,*/}*Spec.ts']
        tasks: ['ts:scripts']
      tsTest:
        files: ['app/scripts/{,*/}{,*/}*.ts']
        tasks: ['ts:tests', 'karma:unit']
      compass:
        files: ['app/styles/{,*/}*.{scss,sass}']
        tasks: ['compass:server']
      gruntfile:
        files: ['Gruntfile.coffee']

    clean:
      dist: 'dist'
      server: 'app/out'

    ts:
      scripts:
        src: ['app/scripts/{,*/}{,*/}*.ts', '!app/scripts/{,*/}{,*/}*Spec.ts']
        out: 'app/out/scripts/app.js'
        options:
          target: 'es6'
      tests:
        src: ['app/scripts/{,*/}{,*/}*.ts']
        out: 'app/out/tests/tests.js'
        options:
          target: 'es6'

    copy:
      dist:
        files: [
          {
            cwd: 'app/'
            expand: true
            src: [
              'manifest.json'
              'icons/**'
              'others/**'
              'bower_components/**'
              'out/scripts/**'
              'out/styles/**'
            ]
            dest: 'dist/'
          }
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
      server:
        options:
          debugInfo: true

      styles:
        expand: true
        cwd: 'app/styles'
        dest: 'app/out/styles/'
        src: '{,*/}*.css'

    karma:
      unit:
        configFile: 'karma.conf.coffee'
        singleRun: true

    concurrent:
      server: [
        'ts:scripts'
        'ts:tests'
        'compass:server'
      ]
      test: [
        'ts:scripts'
        'ts:tests'
        'compass'
      ]

  grunt.registerTask 'serve', 'Compile then start a connect web server', ->
    grunt.task.run [
      'clean:server'
      'concurrent:server'
      'watch'
    ]

  grunt.registerTask 'default', ['serve']

  grunt.registerTask 'dist', [
    'clean:server'
    'concurrent:server'
    'clean:dist'
    'copy:dist'
  ]

  grunt.registerTask 'test', [
    'concurrent:test'
    'karma'
    'watch'
  ]

  grunt.registerTask 'ci', [
    'concurrent:test'
    'karma'
  ]
