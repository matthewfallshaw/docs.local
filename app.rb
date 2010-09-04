%w[rubygems sinatra erb].each {|l| require l }

helpers do
  def leaf?(dir)
    Dir[File.join(dir, "*")].detect do |f|
      f.match(/\/index\.\w{3,4}/)
    end
  end
  alias :leaf_index :leaf?

  def without_public(dir)
    dir.sub(/^public\//,'')
  end

  def last_dir(dir)
    File.basename(dir)
  end
end

get '/' do
  @docs = Dir["public/*"]
  haml :index
end
