module Sprockets
  module Rails
    class Task < Rake::SprocketsTask
      def output
        if app
          File.join(Rails.public_path, app.config.assets.prefix)
        else
          super
        end
      end
    end
  end
end