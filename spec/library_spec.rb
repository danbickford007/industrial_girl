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

  describe "#name" do 

    context 'determining which faker to use' do

      it 'should use faker name if includes name' do
        library.column_name = 'username'
        Faker::Name.should_receive(:name)
        library.name
      end
      
      it 'should use faker email if includes mail' do
        library.column_name = 'theemail'
        Faker::Internet.should_receive(:email)
        library.name
      end
      
      it 'should use faker address if includes address' do
        library.column_name = 'theaddress'
        Faker::Address.should_receive(:street_address)
        library.name
      end
      
      it 'should use faker city if includes city' do
        library.column_name = 'thecity'
        Faker::Address.should_receive(:city)
        library.name
      end
      
      it 'should use faker state if includes state' do
        library.column_name = 'thestate'
        Faker::Address.should_receive(:state_abbr)
        library.name
      end
      
      it 'should use faker zip if includes zip' do
        library.column_name = 'thezip'
        Faker::Address.should_receive(:zip_code)
        library.name
      end
      
      it 'should use faker phone if includes phone' do
        library.column_name = 'thephone'
        Faker::PhoneNumber.should_receive(:phone_number)
        library.name
      end
      
      it 'should use faker domain name if includes url' do
        library.column_name = 'theurl'
        Faker::Internet.should_receive(:domain_name)
        library.name
      end
      
      it 'should use faker company catch pharse if no match found' do
        library.column_name = 'xxxxxxx'
        Faker::Company.should_receive(:catch_phrase)
        library.name
      end

    end

  end

end
