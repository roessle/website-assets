module.exports = (grunt) ->
  grunt.initConfig
  
    copy: 
      dist: 
        files: [ {
          expand: true,
          src: [ 'CNAME' ],
          dest: 'dist/',
          cwd: 'contrib/'
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
  
    sass: 
      dist:
        options:
          style: 'expanded'
          bundleExec: true 
        files: 
          'dist/css/roessle.css': 'css/roessle.scss'
      
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-gh-pages'
  
  grunt.registerTask 'default', [ 'build' ]
  grunt.registerTask 'build', [ 'sass', 'coffee', 'copy:dist' ]
  grunt.registerTask 'deploy', [ 'build', 'gh-pages' ]
  