karmaTestPort = 17425 + Math.floor(Math.random() * 50)

# Start these browsers, currently available:
# - Chrome
# - ChromeCanary
# - Firefox
# - Opera
# - Safari (only Mac)
# - PhantomJS
# - IE (only Windows)
browsers = ['PhantomJS']

plugins = [
  'karma-phantomjs-launcher'
  'karma-coverage'
  'karma-jasmine'
]

if process.env.MULTIPLE_BROWSERS
  console.info "adding chrome and firefox"
  browsers.push('Chrome', 'Firefox')
  plugins.push('karma-chrome-launcher', 'karma-firefox-launcher')

module.exports = (config) ->
  config.set
    basePath: './'

    frameworks: ['jasmine']

    files: [
      'app/bower_components/jquery/dist/jquery.js'
      'app/bower_components/mousetrap/mousetrap.min.js'
      'app/bower_components/sugar/release/sugar.min.js'
      'app/out/tests/tests.js'
    ]

    exclude: []
    port: karmaTestPort
    logLevel: config.LOG_INFO # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    browsers: browsers
    plugins: plugins
    autoWatch: true
    singleRun: false
    colors: true

    preprocessors:
      'app/out/tests/tests.js': 'coverage'

    reporters: ['progress', 'coverage']

    coverageReporter:
      reporters:
        [
          { type: 'text-summary', dir: '.tmp/coverage/' }
          { type: 'text', dir: '.tmp/coverage/' }
        ]


# Uncomment the following lines if you are using grunt's server to run the tests
# proxies: '/': 'http://election-market.dev:9000/'
# URL root prevent conflicts with the site root
# urlRoot: '_karma_'

#junitReporter:
#  outputFile: 'test_out/unit.xml'
#  suite: 'unit'
