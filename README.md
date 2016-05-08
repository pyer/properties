Properties
==========

[![Gem Version](https://badge.fury.io/rb/pyer-properties.svg)](https://badge.fury.io/rb/pyer-properties)
[![Build Status](https://travis-ci.org/pyer/properties.svg?branch=master)](https://travis-ci.org/pyer/properties)

This Properties class provides a simple way to get values from a properties file.

Format of properties file
-------------------------

    key1 = value1
    key2=value2
    # comment
    ; another comment

Using properties class
----------------------

    require 'pyer/properties'
    prop = Properties 'path/file.properties'
    print prop.key1       # => "value1"
    print prop.key2       # => "value2"
    print prop.unknown    # => nil

Installation
------------

    gem install pyer-properties

Build
-----

Building pyer-properties gem is a rake task.

    rake build
