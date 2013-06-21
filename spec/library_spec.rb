require 'spec_helper'

describe Library do

  let(:library) { Library.new }

  describe '#check' do

    it 'should determine data type of string' do
      Library.any_instance.should_receive(:send).with(:name)
      library.check('test', :string, 'tester')
    end
    
    it 'should determine data type of int' do
      Library.any_instance.should_receive(:send).with(:int)
      library.check('test', :integer, 'tester')
    end
    
    it 'should determine data type of date' do
      Library.any_instance.should_receive(:send).with(:date)
      library.check('test', :datetime, 'tester')
    end

  end

end
