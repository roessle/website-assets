module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)
  mozjpeg = require('imagemin-mozjpeg')

  webpack = require('webpack')
  webpackConfig = require('./webpack.config.js')

  grunt.initConfig

    autoprefixer:
      dist:
        options:
          browsers: ['last 5 versions', '> 1% in DE', 'ie >= 8']
          map: true
        files:
          'dist/css/roessle-prefixed.css': ['dist/css/roessle-sass.css']
          'dist/css/dirs21-prefixed.css': ['dist/css/dirs21-sass.css']
          'dist/css/gurado-prefixed.css': ['dist/css/gurado-sass.css']
          'dist/css/roessle-bootstrap-prefixed.css': ['dist/css/roessle-bootstrap-sass.css']

    clean: [
      'dist'
    ]

    copy:
      contrib:
        files: [ {
          expand: true
          src: [ 'CNAME' ]
          dest: 'dist/'
          cwd: 'contrib/'
        } ]
      'images-backgrounds':
        files: [ {
          expand: true
          src: [ 'images/backgrounds/*.{png,jpg}' ]
          dest: 'dist/'
        } ]
      logos:
        files: [ {
          expand: true
          src: [ 'images/logos/*.png' ]
          dest: 'dist/'
        } ]
      favicons:
        files: [ {
          expand: true
          src: [ 'images/favicons/*.png' ]
          dest: 'dist/'
        } ]
      css:
        files:
          'dist/css/roessle.css': ['dist/css/roessle-prefixed.css']
          'dist/css/dirs21.css': ['dist/css/dirs21-prefixed.css']
          'dist/css/gurado.css': ['dist/css/gurado-prefixed.css']
          'dist/css/roessle-bootstrap.css': ['dist/css/roessle-bootstrap-prefixed.css']
      'gurado-example':
        files:
          'dist/gurado-example.html': ['gurado-example.html']
          'dist/css/gurado-example.css': ['gurado-example.css']
          'dist/js/gurado-example.js': ['gurado-example.js']

    coffee:
      compile:
        files:
          'dist/js/gurado.js': 'js/gurado.coffee'

    'gh-pages':
      options:
        base: 'dist'
        user:
          name: "Github actions"
          email: "41898282+github-actions[bot]@users.noreply.github.com"
      src: [ '**' ]
      ci:
        options:
          repo: 'git@github.com:roessle/website-assets-deployment.git'
          silent: false
        src: [ '**' ]

    'compile-handlebars':
      html:
        files: [{
            expand: true
            src: '*.hbs'
            dest: 'dist/'
            ext: '.html'
        }]
        templateData: {
          'hero-images': grunt.file.expand('images/hero-images/*.jpg')
        }

    'http-server':
      dist:
        root: 'dist/'
        port: 9000
        host: "0.0.0.0"
      dev:
        root: 'dist/'
        port: 9000
        runInBackground: true

    imagemin:
      'hero-images':
        options:
          optimizationLevel: 7
          use: [ mozjpeg() ]
        files: [ {
          expand: true
          src: [ 'hero-images/*.{png,jpg,gif}' ]
          cwd: 'dist/images-responsive/'
          dest: 'dist/images/'
        }, {
          expand: true
          src: [ 'hero-images/*.{png,jpg,gif}' ]
          cwd: 'images/'
          dest: 'dist/images/'
        }]

    responsive_images:
      'hero-images':
        options:
          engine: 'im'
          sizes: [
            {
              name: 'sm'
              width: 991
            },{
              name: 'md'
              width: 1199
            },{
              name: 'lg'
              width: 2500
            }
          ]
        files: [ {
          expand: true
          src: [ 'hero-images/*.{png,jpg,gif}' ]
          cwd: 'images/'
          dest: 'dist/images-responsive/'
        } ]

    sass:
      dist:
        options:
          style: 'expanded'
          bundleExec: false
        files:
          'dist/css/roessle-sass.css': 'css/roessle.scss'
          'dist/css/dirs21-sass.css': 'css/dirs21.scss'
          'dist/css/gurado-sass.css': 'css/gurado.scss'
          'dist/css/roessle-bootstrap-sass.css': 'css/roessle-bootstrap.scss'

    webpack:
      options: webpackConfig
      build: {}

    watch:
      css:
        files: [ 'css/**/*.scss' ]
        tasks: [ 'build:css' ]
      js:
        files: [ 'js/**/*.js' ]
        tasks: [ 'build:js' ]
      html:
        files: [ '*.hbs' ]
        tasks: [ 'build:html' ]
      'gurado-example':
        files: [ 'gurado-example.*' ]
        tasks: [ 'build:gurado-example' ]

  grunt.registerTask 'default', [ 'build' ]
  grunt.registerTask 'build:gurado-example', [ 'newer:copy:gurado-example' ]
  grunt.registerTask 'build:css', [ 'sass', 'newer:autoprefixer', 'newer:copy:css' ]
  grunt.registerTask 'build:js', [ 'newer:coffee', 'webpack:build' ]
  grunt.registerTask 'build:images', [ 'newer:copy:images-backgrounds', 'newer:copy:logos', 'newer:copy:favicons', 'newer:responsive_images', 'newer:imagemin' ]
  grunt.registerTask 'build:html', [ 'compile-handlebars' ]
  grunt.registerTask 'build:contrib', [ 'newer:copy:contrib' ]
  grunt.registerTask 'build', [ 'build:css', 'build:js', 'build:images', 'build:html', 'build:contrib', 'build:gurado-example' ]
  grunt.registerTask 'deploy', [ 'clean', 'build', 'gh-pages' ]
  grunt.registerTask 'serve', [ 'build', 'http-server:dist' ]
  grunt.registerTask 'dev', [ 'build', 'http-server:dev', 'watch' ]
