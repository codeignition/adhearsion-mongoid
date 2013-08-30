require 'spec_helper'

describe Adhearsion::Mongoid::Plugin do

  describe "while accessing the plugin configuration" do

    it "should retrieve a valid configuration instance" do
      Adhearsion.config.adhearsion_mongoid.should be_instance_of Loquacious::Configuration
    end

    it "should configure properly the models_paths" do
      Adhearsion.config[:adhearsion_mongoid].models_paths.class.should == Array
    end

  end

  describe "while loading plugins" do
    it "should load the init block and start the service" do
      Adhearsion::Mongoid::Plugin::Service.should_receive(:start).once.and_return true
      Adhearsion::Plugin.init_plugins
    end
  end
end
