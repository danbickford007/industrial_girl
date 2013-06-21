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
    "'#{Faker::Name.name}'"
  end

  def date
    '{ 1.years.ago }'
  end

  def int
    Random.new.rand(0..1000)
  end


end
