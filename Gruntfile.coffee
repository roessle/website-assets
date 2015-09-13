module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)
  mozjpeg = require('imagemin-mozjpeg')

  grunt.initConfig

    autoprefixer:
      dist:
        options:
          browsers: ['last 5 versions', '> 1% in DE', 'ie >= 8']
          map: true
        files:
          'dist/css/roessle-prefixed.css': ['dist/css/roessle-sass.css']

    copy:
      contrib:
        files: [ {
          expand: true,
          src: [ 'CNAME' ],
          dest: 'dist/',
          cwd: 'contrib/'
        } ]
      'images-backgrounds':
        files: [ {
          expand: true,
          src: [ 'images/backgrounds/*.png' ],
          dest: 'dist/'
        } ]
      logos:
        files: [ {
          expand: true,
          src: [ 'images/logos/*.png' ],
          dest: 'dist/'
        } ]
      css:
        files:
          'dist/css/roessle.css': ['dist/css/roessle-prefixed.css']

    coffee:
      compile:
        files:
          'dist/js/roessle.js': 'js/roessle.coffee'

    'gh-pages':
      options:
        base: 'dist'
      src: [ '**' ]
      ci:
        options:
          repo: 'https://' + process.env.GH_TOKEN + '@github.com/roessle/website-assets-deployment.git',
          silent: true
        src: [ '**' ]

    'compile-handlebars':
      html:
        files: [{
            expand: true
            src: '*.hbs'
            dest: 'dist/'
            ext: '.html'
        }],
        templateData: {
          'hero-images': grunt.file.expand('images/hero-images/*.jpg')
        }

    'http-server':
      dist:
        root: 'dist/'
        port: 9000
        host: "0.0.0.0"

    imagemin:
      'hero-images':
        options:
          optimizationLevel: 7
          use: [ mozjpeg() ]
        files: [ {
          expand: true
          src: [ 'images/hero-images/*.{png,jpg,gif}' ]
          dest: 'dist/'
        } ]

    sass:
      dist:
        options:
          style: 'expanded'
          bundleExec: true
        files:
          'dist/css/roessle-sass.css': 'css/roessle.scss'

  grunt.registerTask 'default', [ 'build' ]
  grunt.registerTask 'build', [ 'newer:sass', 'newer:autoprefixer', 'newer:coffee', 'newer:copy', 'newer:imagemin', 'newer:compile-handlebars' ]
  grunt.registerTask 'deploy', [ 'build', 'gh-pages' ]
  grunt.registerTask 'serve', [ 'build', 'http-server' ]
