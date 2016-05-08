# encoding: UTF-8
require 'minitest/autorun'
require './lib/pyer/properties.rb'

class TestProperties < Minitest::Test
  TP = 'test.properties'

  def setup
    @file = File.new(TP, 'w')
  end

  def teardown
    File.unlink(TP)
  end

  def init_props(s)
    @file.write(s)
    @file.close
  end

  def test_simple_key
    init_props 'key=value'
    pp = Properties.new(TP)
    assert_equal(pp.key, 'value')
    assert_equal(pp.count, 1)
  end

  def test_with_spaces
    init_props 'key = value '
    pp = Properties.new(TP)
    assert_equal(pp.key, 'value')
    assert_equal(pp.count, 1)
  end

  def test_multi_line
    init_props "key1=value\nkey2=value"
    pp = Properties.new(TP)
    assert_equal(pp.key1, 'value')
    assert_equal(pp.key2, 'value')
    assert_equal(pp.count, 2)
  end

  def test_several_equal_symbols
    init_props 'key=x=y=z'
    pp = Properties.new(TP)
    assert_equal(pp.key, 'x=y=z')
    assert_equal(pp.count, 1)
  end

  def test_sharp_comment
    init_props '# key=value'
    pp = Properties.new(TP)
    assert_equal(pp.count, 0)
  end
end
