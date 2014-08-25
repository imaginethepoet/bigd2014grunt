module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),

  # TODO Resources are in separate file
  # TODO Compile less into css
  # TODO Use coffeescript and compile to javascript
  # TODO Run a quick webserver to see results
  # TODO Watch for changes in less and css automatically


    less:
      development:
        src: "resources/less/app.less"
        dest: "assets/css/app.css"
        options:
          compress: true
          yuicompress: true
          optimization: 2          


    coffee:
      all:
        expand: true,
        flatten: true,
        cwd: 'resources/coffee/',
        src: ['app.coffee'],
        dest: 'assets/js',
        ext: '.js'       



    # lets start up a headless websever with node and connect
    connect:
      server:
        options:
          protocol:'http'
          port:8000
          keepalive: false
          base:'.'
          #base:''

  # lets watch all the stuff going on for live changes.

     watch:
      options:
        atBegin:true
        livereload: true
      css:
        files: ["resources/less/**/*.less", "resources/**/*.less"] 
        tasks: ["less"]

      coffee:
        files: ["resources/coffee/**/*.coffee"]
        tasks: ["coffee"]


    grunt.loadNpmTasks "grunt-contrib-less"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-connect"




  
  grunt.registerTask('default', ['connect','watch']);



