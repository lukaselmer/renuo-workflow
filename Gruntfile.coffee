# Generated on 2014-12-23 using generator-angular 0.10.0
'use strict'

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
protractorTestPort = 17325 + Math.floor(Math.random() * 50)
module.exports = (grunt) ->

  # Load grunt tasks automatically
  require('load-grunt-tasks') grunt

  # Time how long tasks take. Can help when optimizing build times
  require('time-grunt') grunt

  # Configurable paths for the application
  appConfig =
    app: require('./bower.json').appPath or 'app'
    dist: 'dist'

  # Define the configuration for all the tasks
  grunt.initConfig

  # Project settings
    yeoman: appConfig

  # Watches files for changes and runs tasks based on the changed files
    watch:
      #bower:
      #  files: ['bower.json']
      #  tasks: ['wiredep']
      coffee:
        files: ['<%= yeoman.app %>/scripts/{,*/}{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: ['newer:coffee:dist']
      coffeeTest:
        files: ['test/spec/{,*/}{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: [
          'newer:coffee:test'
          'karma'
        ]
      compass:
        files: ['<%= yeoman.app %>/styles/{,*/}*.{scss,sass}']
        tasks: [
          'compass:server'
          'autoprefixer'
        ]
      #slim:
      #  files: ['**/*.slim']
      #  tasks: ['slim']
      gruntfile:
        files: ['Gruntfile.coffee']

      #livereload:
      #  options:
      #    livereload: '<%= connect.options.livereload %>'
      #  files: [
      #    '<%= yeoman.app %>/{,*/}{,*/}{,*/}*.html'
      #    '.tmp/styles/{,*/}*.css'
      #    '.tmp/scripts/{,*/}{,*/}*.js'
      #    '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
      #  ]

  # Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
    coffeelint:
      app: ['<%= yeoman.app %>/scripts/{,*/}{,*/}*.coffee', 'Gruntfile.coffee']
      options:
        configFile: 'coffeelint.json'
      tests:
        files:
          src: ['test/spec/{,*/}{,*/}*.coffee']
        options:
          configFile: 'coffeelint_test.json'

  # Empties folders to start fresh
    clean:
      dist:
        files: [
          dot: true
          src: [
            '.tmp'
            '<%= yeoman.dist %>/{,*/}*'
            '!<%= yeoman.dist %>/.git{,*/}*'
          ]
        ]
      server: '.tmp'

  # Add vendor prefixed styles
    autoprefixer:
      options:
        browsers: ['last 1 version']
      dist:
        files: [
          expand: true
          cwd: '.tmp/styles/'
          src: '{,*/}*.css'
          dest: '.tmp/styles/'
        ]

  # Automatically inject Bower components into the app
  #  wiredep:
  #    app:
  #      src: ['<%= yeoman.app %>/index.html']
  #      ignorePath: /\.\.\//
  #    sass:
  #      src: ['<%= yeoman.app %>/styles/{,*/}*.{scss,sass}']
  #      ignorePath: /(\.\.\/){1,2}bower_components\//

  # Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: true
        sourceRoot: ''
      dist:
        files: [
          expand: true
          cwd: '<%= yeoman.app %>/scripts'
          src: '{,*/}{,*/}*.coffee'
          dest: '.tmp/scripts'
          ext: '.js'
        ]
      test:
        files: [
          expand: true
          cwd: 'test/spec'
          src: '{,*/}{,*/}*.coffee'
          dest: '.tmp/spec'
          ext: '.js'
        ]

  # Compiles Sass to CSS and generates necessary files if requested
    compass:
      options:
        sassDir: '<%= yeoman.app %>/styles'
        cssDir: '.tmp/styles'
        generatedImagesDir: '.tmp/images/generated'
        imagesDir: '<%= yeoman.app %>/images'
        javascriptsDir: '<%= yeoman.app %>/scripts'
        #fontsDir: '<%= yeoman.app %>/styles/fonts'
        importPath: './bower_components'
        httpImagesPath: '/images'
        httpGeneratedImagesPath: '/images/generated'
        #httpFontsPath: '/styles/fonts'
        relativeAssets: false
        assetCacheBuster: false
        raw: 'Sass::Script::Number.precision = 10\n'
      dist:
        options:
          generatedImagesDir: '<%= yeoman.dist %>/images/generated'
      server:
        options:
          debugInfo: true

    #slim:
    #  dist:
    #    files: [{
    #      expand: true
    #      cwd: '<%= yeoman.app %>/views'
    #      src: ['**/*.slim']
    #      dest: '.tmp/views/'
    #      ext: '.html'
    #    }]

  # Renames files for browser caching purposes
    #filerev:
    #  dist:
    #    src: [
    #      '<%= yeoman.dist %>/scripts/{,*/}{,*/}*.js'
    #      '<%= yeoman.dist %>/styles/{,*/}*.css'
    #      '<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
    #      '!<%= yeoman.dist %>/images/surveys/*.{png,jpg,jpeg,gif,webp,svg}'
    #      '<%= yeoman.dist %>/styles/fonts/*'
    #    ]


  # Reads HTML for usemin blocks to enable smart builds that automatically
  # concat, minify and revision files. Creates configurations in memory so
  # additional tasks can operate on them
    useminPrepare:
      #html: '<%= yeoman.app %>/index.html'
      options:
        dest: '<%= yeoman.dist %>'
        flow:
          html:
            steps:
              js: ['concat', 'uglifyjs']
              css: ['cssmin']
            post: {}

  # Performs rewrites based on filerev and the useminPrepare configuration
    usemin:
      #html: ['<%= yeoman.dist %>/{,*/}{,*/}*.html']
      css: ['<%= yeoman.dist %>/styles/{,*/}*.css']
      options:
        assetsDirs: ['<%= yeoman.dist %>', '<%= yeoman.dist %>/images']

  # The following *-min tasks will produce minified files in the dist folder
  # By default, your `index.html`'s <!-- Usemin block --> will take care of
  # minification. These next options are pre-configured if you do not wish
  # to use the Usemin blocks.
  # cssmin: {
  #   dist: {
  #     files: {
  #       '<%= yeoman.dist %>/styles/main.css': [
  #         '.tmp/styles/{,*/}*.css'
  #       ]
  #     }
  #   }
  # },
  # uglify: {
  #   dist: {
  #     files: {
  #       '<%= yeoman.dist %>/scripts/scripts.js': [
  #         '<%= yeoman.dist %>/scripts/scripts.js'
  #       ]
  #     }
  #   }
  # },
  # concat: {
  #   dist: {}
  # },
    imagemin:
      dist:
        files: [
          expand: true
          cwd: '<%= yeoman.app %>/images'
          src: '{,*/}*.{png,jpg,jpeg,gif}'
          dest: '<%= yeoman.dist %>/images'
        ]
    svgmin:
      dist:
        files: [
          expand: true
          cwd: '<%= yeoman.app %>/images'
          src: '{,*/}*.svg'
          dest: '<%= yeoman.dist %>/images'
        ]
    #htmlmin:
    #  dist:
    #    options:
    #      collapseWhitespace: true
    #      conservativeCollapse: true
    #      collapseBooleanAttributes: true
    #      removeCommentsFromCDATA: true
    #      removeOptionalTags: true
    #        files: [
    #          expand: true
    #          cwd: '<%= yeoman.dist %>'
    #          src: [
    #            '*.html'
    #            'views/{,*/}{,*/}*.html'
    #          ]
    #          dest: '<%= yeoman.dist %>'
    #        ]

  # ng-annotate tries to make the code safe for minification automatically
  # by using the Angular long form for dependency injection.

  # Replace Google CDN references
  #  cdnify:
  #    dist:
  #      html: ['<%= yeoman.dist %>/*.html']

  # Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: '<%= yeoman.app %>'
            dest: '<%= yeoman.dist %>'
            src: [
              #'*.{ico,png,txt}'
              'others/{,*/}{,*/}{,*/}*.html'
              'others/{,*/}{,*/}{,*/}*.css'
              'others/{,*/}{,*/}{,*/}*.js'
              'others/{,*/}{,*/}{,*/}*.png'
              'manifest.json'
              '_locales/{,*/}{,*/}*.json'
            ]
          }
          #{
          #  expand: true
          #  cwd: '.tmp/images'
          #  dest: '<%= yeoman.dist %>/images'
          #  src: ['generated/*']
          #}
          #{
          #  expand: true
          #  cwd: '.'
          #  src: 'bower_components/bootstrap-sass-official/assets/fonts/bootstrap/*'
          #  dest: '<%= yeoman.dist %>'
          #}
        ]
      styles:
        expand: true
        cwd: '<%= yeoman.app %>/styles'
        dest: '.tmp/styles/'
        src: '{,*/}*.css'

  # Run some tasks in parallel to speed up the build process
    concurrent:
      server: [
        'coffee:dist'
        #'slim:dist'
        'compass:server'
      ]
      test: [
        'coffee'
        'compass'
      ]
      dist: [
        'coffee'
        'slim:dist'
        'compass:dist'
        'imagemin'
        'svgmin'
      ]

  # Test settings
    karma:
      unit:
        configFile: 'test/karma.conf.coffee'
        singleRun: true

    protractor:
      options:
        configFile: 'test/protractor.conf.coffee'
        keepAlive: false
        noColor: false
        args:
          baseUrl: 'http://127.0.0.1:' + protractorTestPort + '/'
      all: {}

  grunt.registerTask 'serve', 'Compile then start a connect web server', (target) ->
    grunt.task.run [
      'clean:server'
      #'wiredep'
      'concurrent:server'
      'autoprefixer'
      #'connect:livereload'
      'watch'
    ]

  grunt.registerTask 'test', [
    'clean:server'
    'concurrent:test'
    'autoprefixer'
    # TODO: fixme: doesn't work on the CI server (works without the bootstrap CSS?!)
    #'connect:protractor',
    #'protractor',
    'karma'
  ]
  grunt.registerTask 'test:unit', [
    'clean:server'
    'concurrent:test'
    'autoprefixer'
    'karma'
  ]
  grunt.registerTask 'test:e2e', [
    'clean:server'
    'concurrent:test'
    'autoprefixer'
    'connect:protractor'
    'protractor'
  ]
  grunt.registerTask 'pre-build', [
    'clean:dist'
    #'wiredep'
    'useminPrepare'
  ]
  grunt.registerTask 'build', [
    'concurrent:dist'
    'autoprefixer'
    'concat'
    'copy:dist'
    #'cdnify'
    'cssmin'
    'uglify'
    'filerev'
    'usemin'
    'htmlmin'
  ]
  grunt.registerTask 'lint', [
    'coffeelint'
    'newer:jshint'
  ]
  grunt.registerTask 'lint-test', [
    'lint'
    'test'
  ]
  grunt.registerTask 'default', [
    'lint-test'
    'pre-build'
    'build'
  ]
  grunt.registerTask 'deploy-develop', [
    'lint-test'
    'pre-build'
    'build'
  ]
  grunt.registerTask 'deploy-master', [
    'lint-test'
    'pre-build'
    'build'
  ]
  grunt.registerTask 'deploy-testing', [
    'lint-test'
    'pre-build'
    'build'
  ]
