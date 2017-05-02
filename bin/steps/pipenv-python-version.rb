#!/usr/bin/env ruby

require 'json'

# Detect Python-version with Pipenv.

build_dir = ARGV[0]

Dir.chdir(build_dir) do
  if File.exist?('Pipfile.lock') && !File.exist?('runtime.txt')
    pipfile_lock = JSON.load('Pipfile.lock')
    python_version = pipfile_lock['_meta']['requires']['python_version']

    if python_version.match /^\d\.\d+$/
      File.write('runtime.txt', "python-#{python_version}.x")
    end
  end
end
