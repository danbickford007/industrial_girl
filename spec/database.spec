require 'spec_helper'

describe Database do
  
  let(:root) { `pwd`.sub(/\n/, '') }
  let(:db) { Database.new(root) }

  describe '#load' do
  
    context 'loading config/database.yml from rails app' do

      it 'should call join on file for yaml retreival' do
        File.should_receive(:join)
        YAML.should_receive(:load_file)
        Database.any_instance.should_receive(:connect)
        db.load
      end 

    end

  end

  describe '#connect' do

    context 'establishing connection' do

      it 'should call establish connection on active record with proper args' do
        file = File.join(root, 'spec', 'database.yml')
        yaml = YAML.load_file(file)
        ActiveRecord::Base.should_receive(:establish_connection)
          .with({:adapter=>"mysql2", :database=>yaml['development']['database']})
        Generator.stub(:create_factories)
        db.connect(yaml)
      end

    end

  end

end
