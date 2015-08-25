module.exports = (grunt) ->
  
  mozjpeg = require('imagemin-mozjpeg')
  
  grunt.initConfig
  
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
  
    coffee:
      compile:
        files:
          'dist/js/roessle.js': 'js/roessle.coffee'
    
    'gh-pages':
      options: 
        base: 'dist'
      src: [ '**' ]
      travis:
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
          'dist/css/roessle.css': 'css/roessle.scss'

  grunt.loadNpmTasks 'grunt-compile-handlebars'      
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-gh-pages'
  
  grunt.registerTask 'default', [ 'build' ]
  grunt.registerTask 'build', [ 'sass', 'coffee', 'copy:*', 'imagemin:*', 'compile-handlebars:*' ]
  grunt.registerTask 'deploy', [ 'build', 'gh-pages' ]
  