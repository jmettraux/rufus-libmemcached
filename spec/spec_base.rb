
#
# Specifying rufus-libmemcached
#
# Fri Feb  6 23:46:58 JST 2009
#

%w{ lib }.each do |path|
  path = File.expand_path(File.dirname(__FILE__) + '/../' + path)
  $: << path unless $:.include?(path)
end

require 'rubygems'
require 'bacon'

Bacon.summary_on_exit

require 'rufus/libmemcached'

