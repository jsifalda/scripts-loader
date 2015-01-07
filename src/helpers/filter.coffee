path = require 'path'

module.exports = (name, endings = 'js|coffee') ->

	pattern = "(\.(#{ endings })$)"
	regex = new RegExp pattern, 'i'

	return regex.test(path.extname(name))
