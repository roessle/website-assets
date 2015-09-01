module.exports = (grunt) ->
  
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
          repo: 'https://' + process.env.GH_TOKEN + '@github.com/roessle/website-assets.git',
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

  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-compile-handlebars'      
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-gh-pages'
  
  grunt.registerTask 'default', [ 'build' ]
  grunt.registerTask 'build', [ 'sass', 'autoprefixer', 'coffee', 'copy:*', 'imagemin:*', 'compile-handlebars:*' ]
  grunt.registerTask 'deploy', [ 'build', 'gh-pages' ]
  
