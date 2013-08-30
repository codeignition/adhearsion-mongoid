require 'spec_helper'

ENV['AHN_ENV'] = 'test'

describe Adhearsion::Mongoid::Plugin::Service do

  describe "when starting the Mongoid connection" do

    def tmp_models_dir_path
      path = File.join Dir.tmpdir, "models"
      
      unless File.directory? path
        FileUtils.mkdir path
      end
      
      path
    end

    def create_tempmodel_with_contents(contents)
      path = File.join tmp_models_dir_path, "user.rb"
      file = File.new(path, "w+")
      file.puts contents
      file.flush
      path
    end

    def sample_user_model
      <<-CODE
        class User
          include Mongoid::Document
          
          field :name, type: String
        end
      CODE
    end

    it "should make any required models available" do
      path = create_tempmodel_with_contents sample_user_model

      Adhearsion.config.adhearsion_mongoid.models_paths = [tmp_models_dir_path]
      Adhearsion::Mongoid::Plugin::Service.start
      
      u = User.new
      u.should respond_to :name
      
      File.delete path
      
      Dir.delete tmp_models_dir_path
    end

  end

end