
require 'benchmark'
require 'rubygems'
require 'rufus/libmemcached'

Benchmark.benchmark(' ' * 20 + Benchmark::Tms::CAPTION, 20) do |b|

  c = Rufus::LibMemcached::Cache.new('localhost:3001')

  b.report('set') do
    10_000.times { |i| c.set(i.to_s, i.to_s) }
  end
  b.report('get') do
    10_000.times { |i| c.get(i.to_s) }
  end

  c.close
end

