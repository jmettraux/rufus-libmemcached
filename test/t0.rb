
require 'rubygems'
require 'rufus/libmemcached/lib'

RLL = Rufus::LibMemcached::Lib

p RLL.memcached_lib_version

c = RLL.memcached_create(nil)
s = RLL.memcached_servers_parse('localhost:3001')
RLL.memcached_server_push(c, s)
RLL.memcached_server_list_free(s)

s = Time.now.to_s
p s

RLL.memcached_set(c, 'toto', 4, s, s.length, 3600, 0)

string_length = MemoryPointer.new :int
flags = MemoryPointer.new :uint32
error = MemoryPointer.new :int
p RLL.memcached_get(c, 'toto', 4, string_length, flags, error)

RLL.memcached_free(c)

