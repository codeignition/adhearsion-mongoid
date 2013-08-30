module Adhearsion
  module Mongoid

    ##
    # Adhearsion Plugin that defines the Mongoid configuration options
    # and includes a hook to start the Mongoid service in Adhearsion initialization process
    class Plugin < Adhearsion::Plugin
      extend ActiveSupport::Autoload

      autoload :Service, 'adhearsion/mongoid/plugin/service'

      # Configure models path ('lib/models' by default) and Mongoid configuration path ('config/mongoid.yml' by default)
      config :adhearsion_mongoid do
        models_paths ['lib/models'],        :desc => 'paths to directories containing models files to load'
        config_path 'config/mongoid.yml',   :desc => 'path to Mongoid configuration file'
      end

      # Include the Mongoid service in plugins initialization process
      init :adhearsion_mongoid do
        Service.start
      end

    end

  end
end