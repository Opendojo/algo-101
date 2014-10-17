{exec, spawn} = require 'child_process'

task 'build', 'Build project from *.coffee to *.js', ->
  cwd = process.cwd()
  process.chdir './'
  exec 'coffee -b -m --output */js/ */coffee/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
  process.chdir cwd

task 'sbuild', 'Build project from *.coffee to *.js', ->
  cwd = process.cwd()
  process.chdir './'
  exec 'coffee -b -m --output */js/ */coffee/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
  process.chdir cwd

task 'coffeelint', 'Coffielint the application', ->
  exec 'coffeelint -r -f coffeelint.config */coffee/', (err, stdout, stderr) ->
    if err && err.code is 1
      console.log "Failed"
    else
      console.log "Success"
    console.log stdout + stderr

task 'watch', 'Cake watch', ->
  cwd = process.cwd()
  process.chdir './'
  spawn 'coffee', ['-cbwo','*/js/','*/coffee/'], stdio: [0..2]
  process.chdir cwd