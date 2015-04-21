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

      copyTmp:
        files: ['.tmp/{,*/}{,*/}*.{js,css}']
        tasks: ['copy:tmp']

    clean:
      dist:
        files: [
          dot: true
          src: [
            '.tmp'
            'dist/{,*/}*'
            '!dist/.git{,*/}*'
          ]
        ]
      server: '.tmp'

    coffee:
      options:
        sourceMap: true
        sourceRoot: ''
      dist:
        files: [
          expand: true
          cwd: 'app/scripts'
          src: '{,*/}{,*/}*.coffee'
          dest: '.tmp/scripts'
          ext: '.js'
        ]

    ts:
      default:
        src: ["**/*.ts", "!node_modules/**/*.ts"]

    compass:
      options:
        sassDir: 'app/styles'
        cssDir: '.tmp/styles'
        generatedImagesDir: '.tmp/images/generated'
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

    copy:
      tmp:
        files: [
          {
            expand: true
            dot: true
            cwd: '.tmp'
            dest: 'app/out'
            src: [
              '{,*/}{,*/}{,*/}*.js'
              '{,*/}{,*/}{,*/}*.css'
            ]
          }
        ]
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: 'app'
            dest: 'dist'
            src: [
              'others/{,*/}{,*/}{,*/}*.html'
              'others/{,*/}{,*/}{,*/}*.css'
              'others/{,*/}{,*/}{,*/}*.js'
              'others/{,*/}{,*/}{,*/}*.png'
              'manifest.json'
              '_locales/{,*/}{,*/}*.json'
            ]
          }
        ]
      styles:
        expand: true
        cwd: 'app/styles'
        dest: '.tmp/styles/'
        src: '{,*/}*.css'

    concurrent:
      server: [
        'coffee:dist'
        'compass:server'
      ]
      test: [
        'coffee'
        'compass'
      ]
      dist: [
        'coffee'
        'compass:dist'
      ]

  grunt.registerTask 'serve', 'Compile then start a connect web server', (target) ->
    grunt.task.run [
      'clean:server'
      'concurrent:server'
      'watch'
    ]

  grunt.registerTask 'default', [
    'serve'
  ]
