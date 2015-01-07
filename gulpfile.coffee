gulp = require 'gulp'
coffee = require 'gulp-coffee'

paths = {}
paths.src = __dirname + '/src'
paths.dest = __dirname + '/lib'

gulp.task 'coffee', () ->

	gulp.src paths.src + '/**/*.coffee'
	.pipe coffee()
	.pipe gulp.dest paths.dest

gulp.task 'default', ['coffee']
