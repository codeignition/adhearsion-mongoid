require 'spec_helper'

describe Adhearsion::Mongoid do

  subject { Adhearsion::Mongoid }

  it "should be a module" do
    subject.should be_kind_of Module
  end

end
