
module.exports = (grunt) ->
    'use strict'

    grunt.initConfig

        clean: ['dist/']

        copy:
            main:
                files: [
                    {
                        src: ['*.js']
                        dest: 'dist/'
                    }
                ]

        coffee:
            main:
                expand: true
                src: ['*.coffee']
                ext: '.js'
                dest: 'dist/'

    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'default', [
        'clean', 'copy', 'coffee'
    ]
