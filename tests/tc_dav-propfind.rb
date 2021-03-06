# -*- coding: utf-8 -*-
require 'test_helper'
require 'rubygems'
require 'davclient'
require 'davclient/davcli'
require 'test/unit'
require 'test/zentest_assertions'

class TestPropfind < Test::Unit::TestCase

  def props(*args)
    out, err = util_capture do
      DavCLI.propfind(*args)
    end
    return [out.string, err.string]
  end

  def test_propfind_library_call
    $DEBUG = false
    url = "https://vortex-dav.uio.no/brukere/thomasfl/"
    props = WebDAV.propfind(url)
    assert props.to_s.size > 1000

    props = WebDAV.propfind("..")
    assert props.to_s.size > 1000

    url = "https://vortex-dav.uio.no/brukere/"
    props = WebDAV.propfind("../../brukere/")
    assert props.to_s.size > 1000

  end

  def test_propfind_command_line
    url = "https://vortex-dav.uio.no/brukere/thomasfl/"
    out, err = props([url])
    assert out.size > 10000
  end


end
