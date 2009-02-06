
= rufus-libmemcached

ruby-ffi based interface to libmemcached (http://tangent.org/552/libmemcached.html)

NOTE : for a far more mature lib see http://github.com/fauna/memcached (the 'memcached' gem)


== installation

  sudo gem install ffi rufus-libmemcached


== usage

  require 'rubygems'
  require 'rufus/libmemcached'

  c = Rufus::LibMemcached::Cache.new('localhost:3001')

  c['key'] = 'value'

  c['key']
    # => 'value'

  c.close
    # don't forget that


== memcached and libmemcached install

(coming soon)


== dependencies

  the ruby gem ffi


== mailing list

On the rufus-ruby list[http://groups.google.com/group/rufus-ruby] :

    http://groups.google.com/group/rufus-ruby


== issue tracker

http://rubyforge.org/tracker/?atid=18584&group_id=4812&func=browse


== irc

irc.freenode.net #ruote


== source

http://github.com/jmettraux/rufus-libmemcached

  git clone git://github.com/jmettraux/rufus-libmemcached.git


== credits

many thanks to the authors of memcached, libmemcached and to the authors of ruby-ffi

  http://danga.com/memcached
  http://tangent.org/552/libmemcached.html
  http://kenai.com/projects/ruby-ffi


== author

John Mettraux, jmettraux@gmail.com
http://jmettraux.wordpress.com


== the rest of Rufus

http://rufus.rubyforge.org


== license

MIT

