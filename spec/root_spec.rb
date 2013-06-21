require 'spec_helper'

describe Root do

  let(:root) { Root.new(true, true) }
  let(:pwd) { `pwd`.sub(/\n/, '') }

  describe '#rails_root' do

    context 'determining the root of rails project' do
      
      it 'should find the pwd' do
        root.find_rails_root(true, true)
        root.rails_root.should == pwd 
      end

    end

    context 'determining if rails project and at root' do

      it 'should call database if rails app' do
        File.stub(:directory?).with("#{pwd}/config").and_return(true)
        File.stub(:directory?).with("#{pwd}/app").and_return(true)
        Root.any_instance.stub(:database)
        root.should_not_receive(:p)
        root.find_rails_root(true, true)
      end

      it 'should warn if not a rails app' do
        root.should_receive(:p)
        root.find_rails_root(true, true)
      end

    end 

  end

  describe "#database" do

    context "calling database class to load db info" do

      it 'should instaniate database class and call load' do
        root.db = Database.new(pwd, true, true)
        Database.any_instance.should_receive(:load)
        root.database
      end

    end

  end

end
