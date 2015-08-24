module.exports = (grunt) ->
  grunt.initConfig    
    sass: 
      dist:
        options:
          style: 'expanded'
          bundleExec: true 
        files: 
          'public/css/roessle.css': 'css/roessle.scss'
      
  grunt.loadNpmTasks 'grunt-contrib-sass'
  
  grunt.registerTask 'default', [ 'sass' ]