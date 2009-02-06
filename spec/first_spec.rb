
#
# Specifying rufus-libmemcached
#
# Fri Feb  6 23:47:59 JST 2009
#

require File.dirname(__FILE__) + '/spec_base'

describe 'rufus-libmemcached' do

  #before do
  #end

  it 'should work' do

    c = Rufus::LibMemcached::Cache.new('localhost:3001')

    s = Time.now.to_s
    c['toto'] = s
    c['toto'].should.equal(s)

    c.free
  end

end

