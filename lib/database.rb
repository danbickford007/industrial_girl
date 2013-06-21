class Database

  attr_accessor :rails_root, :generator

  def initialize(rails_root, single, force)
    @single = single
    @rails_root = rails_root
    @generator = Generator.new(@rails_root, single, force)
  end

  def load
    file = File.join(@rails_root, 'config', 'database.yml')
    yaml = YAML.load_file(file)
    connect(yaml)
  end

  def connect(yaml)
    host = yaml['development']['host']
    host ||= 'localhost'
    ActiveRecord::Base.establish_connection(:adapter => "mysql2", 
                      :database => yaml['development']['database'])
    @generator.create_factories
  end

end
