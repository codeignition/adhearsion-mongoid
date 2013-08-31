module Adhearsion
  module Mongoid
    class Plugin
      class Service
        class << self

          ##
          # Load the mongoid preferences, models and initiate logger
          def start
            params = config.to_hash.select { |k,v| !v.nil? }
            
            mongoid_config_path = fullpath *params.delete(:config_path)
            
            environment = ENV['AHN_ENV']
            environment ||= ENV['RACK_ENV']
            environment ||= ENV['RAILS_ENV']
            environment ||= 'development'
            
            logger.info "Loading Mongoid configuration ('#{environment}')"
            
            ::Mongoid.load!(mongoid_config_path, environment)
            
            logger.info "Loading Mongoid models"
            require_models(*params.delete(:models_paths))

            logger.info "Loading Mongoid logger"
            ::Mongoid.logger = logger
            ::Moped.logger = logger
            
            logger.info "Mongoid successfully configured"
          end
          
          ##
          # stop service (unused)
          def stop
          end

          private

          ##
          # models are '.rb' file in models directory
          def require_models(*paths)
            paths.each do |path|
              models_path = fullpath path
              Dir.foreach(models_path) do |filename|
                final_path = File.join models_path, filename
                full_path = fullpath final_path
                
                if File.file? full_path and File.extname(full_path) == ".rb"
                  require full_path
                end
              end
            end
          end
          
          ##
          # Get full path from any path
          def fullpath(path)
            pn = Pathname.new path
            
            root_path = ''
            
            if pn.relative?
              root_path = Adhearsion.config.root
              root_path ||= Dir.pwd
            end
            
            File.join root_path, path
          end

          ##
          # Access to mongoid plugin configuration
          def config
            @config ||= Plugin.config
          end

        end # class << self
      end # Service
    end # Plugin
  end # Mongoid
end # Adhearsion