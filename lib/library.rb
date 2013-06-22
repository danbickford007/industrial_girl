class Library

  attr_accessor :column_name

  def check(column_name, type, limit)
    @column_name = column_name
    call = case
           when type == :string then :name
           when type == :integer then :int
           when type == :datetime then :date
           end
    self.send(call)
  end

  def name
    case
    when @column_name.include?('name') then "'#{Faker::Name.name}'"
    when @column_name.include?('mail') then "'#{Faker::Internet.email}'"
    when @column_name.include?('address') then "'#{Faker::Address.street_address}'"
    when @column_name.include?('city') then "'#{Faker::Address.city}'"
    when @column_name.include?('state') then "'#{Faker::Address.state_abbr}'"
    when @column_name.include?('zip') then "'#{Faker::Address.zip_code}'"
    else "'#{Faker::Company.catch_phrase}'"
    end
    
  end

  def date
    num = Random.new.rand(1..10)
    "{ #{num}.days.ago }"
  end

  def int
    if @column_name.include?('zip') 
      "'#{Faker::Address.zip_code}'"
    else
      Random.new.rand(0..1000)
    end
  end


end
