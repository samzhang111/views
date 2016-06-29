#!/usr/bin/env ruby
require 'thor'

class Views < Thor

  desc 'new NAME', 'create a new view NAME'
  def new(name)
    files = DirectoryGetter.map_files
    ViewWriter.write(files)
  end
end

class DirectoryGetter
  def self.map_files
    Hash.new(self.list_files.collect { |f| [f.split('/')[-1], f.split('/')[:-1].join("/")] })
  end

  def self.list_files
    Dir['**/*'].select { |elem| File.file? elem }
  end
end

class ViewWriter
end

Views.start(ARGV)
