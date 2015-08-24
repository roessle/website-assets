module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'public/js/roessle.js': 'js/roessle.coffee'
  
    sass: 
      dist:
        options:
          style: 'expanded'
          bundleExec: true 
        files: 
          'public/css/roessle.css': 'css/roessle.scss'
      
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  
  grunt.registerTask 'default', [ 'sass', 'coffee' ]