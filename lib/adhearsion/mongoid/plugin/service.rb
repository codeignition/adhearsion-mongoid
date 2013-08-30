module Adhearsion
  module Mongoid
    class Plugin
      class Service
        class << self

          ##
          # Load the mongoid preferences, models and initiate logger
          def start
            logger.info "Loading Mongoid preferences"
            
            params = config.to_hash.select { |k,v| !v.nil? }
            
            ::Mongoid.load!(*params.delete(:config_path), ENV['AHN_ENV'])
            
            logger.info "Loading Mongoid models"
            require_models(*params.delete(:models_paths))

            logger.info "Loading Mongoid logger"
            ::Mongoid.logger = logger
            ::Moped.logger = logger
            
            logger.info "Mongoid successfully configured"
          end
          
          def stop
          end

          private

          ##
          # models are '.rb' file in models directory
          def require_models(*paths)
            paths.each do |path|
              Dir.foreach(path) do |filename|
                pn = Pathname.new path
                
                if pn.relative?
                  root_path = Adhearsion.config.root
                  root_path ||= Dir.pwd
                  full_path = File.join root_path, path, filename                  
                else
                  full_path = File.join path, filename
                end
                
                if File.file? full_path and File.extname(full_path) == ".rb"
                  require full_path
                end
              end
            end
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