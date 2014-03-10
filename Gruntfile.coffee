
module.exports = (grunt) ->
    'use strict'

    grunt.initConfig

        clean: ['dist/']

        copy:
            main:
                files: [
                    {
                        src: ['index.html', 'assets/img/*']
                        dest: 'dist/'
                        expand: true
                    }
                ]

        coffee:
            main:
                expand: true
                cwd: 'assets/js/'
                src: ['**/*.coffee']
                ext: '.js'
                dest: 'dist/assets/js/'

        connect:
            server:
                options:
                    hostname: "localhost"
                    port: 8080
                    base: "dist/"
                    livereload: true

        less:
            main:
                options:
                    paths: ["assets/less"]
                files:
                    "dist/assets/css/style.min.css": "assets/less/app.less"

        uglify:
            main:
                options:
                    beautify: true
                    preserveComments: true;
                files:
                    'dist/assets/js/scripts.min.js': [
                        'vendor/bower/bootstrap/js/transition.js'
                        'vendor/bower/bootstrap/js/alert.js'
                        'vendor/bower/bootstrap/js/button.js'
                        'vendor/bower/bootstrap/js/carousel.js'
                        'vendor/bower/bootstrap/js/collapse.js'
                        'vendor/bower/bootstrap/js/dropdown.js'
                        'vendor/bower/bootstrap/js/modal.js'
                        'vendor/bower/bootstrap/js/tooltip.js'
                        'vendor/bower/bootstrap/js/popover.js'
                        'vendor/bower/bootstrap/js/scrollspy.js'
                        'vendor/bower/bootstrap/js/tab.js'
                        'vendor/bower/bootstrap/js/affix.js'

                        'assets/js/*.js'
                        'dist/assets/js/*.js'
                    ]

        watch:
            options:
                livereload: true
            less:
                files: ['assets/css/*', 'assets/less/*']
                tasks: ['less']
            copy:
                files: ['index.html']
                tasks: ['clean', 'coffee', 'uglify', 'less', 'copy']
            uglify:
                files: ['assets/js/*']
                tasks: ['clean', 'coffee', 'uglify', 'less', 'copy']

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-connect'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', [
        'clean', 'coffee', 'uglify', 'less', 'copy'
    ]

    grunt.registerTask 'default', [
        'clean', 'coffee', 'uglify', 'less', 'copy', 'connect', 'watch'
    ]
