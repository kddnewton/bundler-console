# frozen_string_literal: true

require 'test_helper'

require 'irb'
$LOAD_PATH.unshift File.expand_path('../consoles', __dir__)

class ConsoleTest < Minitest::Test
  class ConsoleDouble
    def start
      @started = true
    end

    def started?
      @started
    end
  end

  def test_version
    refute_nil ::Bundler::Console::VERSION
  end

  def test_start
    with_console('ripl') { Bundler::Console::Command.new.exec(nil, []) }
    assert Ripl.started?
  end

  def test_start_with_groups
    IRB.stub(:start, nil) do
      Bundler::Console::Command.new.exec(nil, %i[foo])
    end

    assert Object.const_defined?(:Net)
    refute Object.const_defined?(:Pry)
  end

  def test_failure_to_require
    called = false

    with_console('foobar') do
      IRB.stub(:start, -> { called = true }) do
        Bundler::Console::Command.new.exec(nil, [])
      end
    end

    assert called
  end

  def test_failure_to_load
    command = Bundler::Console::Command.new
    console = ConsoleDouble.new

    with_console('pry') do
      command.stub(:exit, ->(*) { console }) do
        command.exec(nil, [])
      end
    end

    assert console.started?
  end

  private

  def with_console(name, &block)
    Bundler.stub(:settings, console: name, &block)
  end
end
