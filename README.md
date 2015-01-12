# Scripts Loader (Gulp.js tasks loader/manifest)
Walk directory recursive and load all the scripts from there. (Super helpful when you want to separate your big gulp file into standalone tasks and load each task very easily.)

# Usage
This example will demonstrate how to use **scripts-loader** with Gulp.js.
**Folder structure**
```
-
--src
--node_modules
--gulp
---tasks
----client
-----app.coffee
-----lib.coffee
----server
-----app.coffee
-----lib.coffee
----default.coffee
---index.coffee
---config.coffee
---dictionaries.coffee
--test
--gulpfile.coffee
```
*Yes. Gulp.js finally supports coffee syntax for gulpfile configuration.*

### gulpfile.coffee
```coffee
require './gulp' # will load gulp/index.coffee
```

### gulp/index.coffee (SCRIPTS-LOADER SETTINGS)
```coffee
scriptsLoader = require 'scripts-loader'

config = require './config'

scriptsLoader.load config.root + '/gulp/tasks', {
    verbose : false # dump paths of loaded files into console
    endings : 'js|coffee' # filter which scripts you want to load
}
```

### gulp/config.coffee
```coffee
config = {
    env : null # can we setup easily by another gulp task
    root : __dirname + '/..' # root path
}

module.exports = config
```

### gulp/tasks/client/lib.coffee (GULP TASK DECLERATION)
```coffee
gulp = require 'gulp'
bowerFiles = require 'main-bower-files'
concat = require 'gulp-concat'

dictionaries = require '../../dictionaries' # define all the needed paths in gulp taks env
config = require '../../config'

gulp.task 'client/lib', ->

    gulp.src bowerFiles(env: config.env)
        .pipe(concat("1_lib.js"))
        .pipe(gulp.dest(dictionaries.dest.public + '/js/'))
```


### gulp/tasks/default.coffee
```coffee
gulp = require 'gulp'

gulp.task 'default', ['server/lib', 'server/app', 'client/lib', 'client/app']
```


# Motivation
Yeah... We've got 2015 today. 
And I still can see gulpfile.js files which have more than 1k lines per file over the internet.
And that makes me a little bit worried because we've got such great tools but we don't using them in a good way (fortunately we can see an exceptions and that is great of course). 

Above I suggest how to separate huge gulpfile into standalone tasks and make building process clean and easily understandable.

**Plus you can use this library for quick load all of gulp files.**

**Thanks for your pull requests and questions!!**

**Created by [JSifalda](http://jsifalda.name)**
