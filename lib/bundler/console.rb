# frozen_string_literal: true

require "bundler/console/version"

module Bundler
  module Console
    class Command
      Plugin::API.command("console", self)

      def exec(_name, args)
        if args.any?
          Bundler.require(:default, *args.map!(&:to_sym))
        else
          Bundler.require
        end

        ARGV.clear
        get_console(Bundler.settings[:console] || "irb").start
      end

      private

      def get_console(name)
        require name
        get_constant(name)
      rescue LoadError
        Bundler.ui.error("Couldn't load console #{name}, falling back to irb")
        require "irb"
        get_constant("irb")
      end

      def get_constant(name)
        const_name = { "pry" => :Pry, "ripl" => :Ripl, "irb" => :IRB }[name]
        Object.const_get(const_name)
      rescue NameError
        Bundler.ui.error("Could not find constant #{const_name}")
        exit 1
      end
    end
  end
end
