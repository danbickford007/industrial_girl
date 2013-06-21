class Generator

  attr_accessor :rails_root, :single, :force

  def initialize(rails_root, single, force)
    @rails_root = rails_root
    @single = single
    @force = force
  end

  def create_factories
    @rails_root = rails_root
    if !@single
      create_multiple
    else
      create_single
    end
  end

  def file?(path)
    File.exists?("#{@rails_root}/#{path}")
  end

  def directory?(path)
    File.directory?("#{@rails_root}/#{path}")
  end

  def to_boolean(str)
    str == "true"
  end

  def create_single
    library = Library.new
    return if file?("spec/factories.rb") and !@force
    file = File.join(@rails_root, 'spec', 'factories.rb')
    File.open(file, 'w') do |f|
      f.puts "require 'factory_girl'"
      f.puts "\n"
      f.puts "FactoryGirl.define do"
      ActiveRecord::Base.connection.tables.each do |table_name|
        next if table_name == 'schema_migrations'
        p "Creating factory #{table_name}"
        f.puts "\n"
        f.puts "  factory :#{table_name} do"
        ActiveRecord::Base.connection.columns(table_name).each do |c| 
          f.puts "    #{c.name} #{library.check(c.name, c.type, c.limit)}"
        end
        f.puts "  end"
      end
      f.puts "\n"
      f.puts "end"
    end
  end

  def create_multiple
    if !directory?("spec/factories")
      FileUtils.mkdir_p("#{@rails_root}/spec/factories")
    end
    library = Library.new
    ActiveRecord::Base.connection.tables.each do |table_name|
      next if table_name == 'schema_migrations'
      next if file?("spec/factories/#{table_name}.rb") and !@force
      file = File.join(@rails_root, 'spec', 'factories', "#{table_name}.rb")
      File.open(file, 'w') do |f|
        f.puts "require 'factory_girl'"
        f.puts "\n"
        f.puts "FactoryGirl.define do"
        p "Creating factory #{table_name}"
        f.puts "\n"
        f.puts "  factory :#{table_name} do"
        ActiveRecord::Base.connection.columns(table_name).each do |c| 
          f.puts "    #{c.name} #{library.check(c.name, c.type, c.limit)}"
        end
        f.puts "  end"
        f.puts "\n"
        f.puts "end"
      end
    end

  end

end
