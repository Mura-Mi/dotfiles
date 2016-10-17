#! /usr/bin/ruby

require('date')

def mkdir_if_not_exists(dirname)
  Dir.mkdir(dirname) unless Dir.exists?(dirname)
end

workdir = "/Users/#{ENV['USER']}/work"
mkdir_if_not_exists(workdir)

Dir.glob(File.join(workdir, '*')).each do |dir|
  Dir.rmdir(dir) if Dir[File.join(dir, '*')].empty?
end

dailydir = File.join(workdir, Date.today.strftime('%Y%m%d'))
mkdir_if_not_exists(dailydir)
