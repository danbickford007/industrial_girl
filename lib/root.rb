class Root
 
  attr_accessor :rails_root, :db

  def initialize(single, force)
    find_rails_root(single, force)
  end

  def find_rails_root(single, force)
    @rails_root = `pwd`.sub(/\n/, '')
    if File.directory? "#{@rails_root}/config" and File.directory? "#{@rails_root}/app"
      @db = Database.new(@rails_root, single, force)
      database
    else
      p 'Either this is not a rails app or you are not in the root of your rails app'
    end
  end

  def database
    @db.load
  end


end
