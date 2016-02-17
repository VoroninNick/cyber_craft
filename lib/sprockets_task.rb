require "sprockets/rails/task"

module Sprockets
  module Rails
    class Task
      def output
        #if app
        File.join(::Rails.public_path, ::Rails.application.config.assets.prefix)
        #else
        #  super
        #end
      end
    end
  end
end