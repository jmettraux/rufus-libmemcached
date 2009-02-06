#
#--
# Copyright (c) 2009, John Mettraux, jmettraux@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#++
#

#
# "made in Japan"
#
# jmettraux@gmail.com
#

require 'rufus/libmemcached/lib'

module Rufus::LibMemcached

  class Cache

    def initialize (servers)
      @c = lib.memcached_create(nil)
      s = lib.memcached_servers_parse(servers)
      lib.memcached_server_push(@c, s)
      lib.memcached_server_list_free(s)
    end

    def get (key)
      string_length = MemoryPointer.new :int
      flags = MemoryPointer.new :uint32
      error = MemoryPointer.new :int
      lib.memcached_get(@c, 'toto', 4, string_length, flags, error)
    end

    alias :[] :get

    def set (key, value, opts={})
      timeout = opts[:timeout] || 3600
      lib.memcached_set(@c, key, key.length, value, value.length, timeout, 0)
    end

    alias :[]= :set

    def free
      lib.memcached_free(@c)
    end

    alias :close :free

    protected

    def lib
      Rufus::LibMemcached::Lib
    end
  end
end

