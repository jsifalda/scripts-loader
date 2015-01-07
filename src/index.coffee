file = require 'file'

filter = require './helpers/filter'

scriptLoader = {

	get : (path, options = {}) ->

		tasks = []

		file.walkSync path, (dir, b, files, d) ->
			
			if files and files.length
				for file in files
					
					if filter file, options.endings
						tasks.push dir + '/' + file

		return tasks
	
	load : (path, options = {}) ->

		verbose = if options.verbose and options.verbose == true then true else false

		tasks = scriptLoader.get path, options

		for task in tasks
			if verbose
				console.log "Load script #{ task }"
			require task

}


module.exports = scriptLoader
