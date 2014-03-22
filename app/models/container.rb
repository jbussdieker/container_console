class Container
  extend ActiveModel::Naming

  def initialize(container = nil)
    if container.kind_of? Hash
      @params = container
    else
      @params = {
        :name => container.try(:name)
      }
      @container = container
    end
  end

  def name
    @params[:name]
  end

  def execute(*args)
    @container.execute(*args)
  end

  def state
    @container.try(:state)
  end
  
  def start
    @container.start("-d")
  end

  def stop
    @container.stop
  end

  def save
    if persisted?
      false
    else
      CreateContainerWorker.perform_async(name, "-t ubuntu")
    end
  end

  def persisted?
    @container != nil
  end

  def to_key
    [name] if name
  end

  def destroy
    @container.destroy
  end

  def to_partial_path
    "container"
  end

  def to_s
    name
  end

  def self.find(name)
    all.find {|c| c.name == name}
  end

  def self.all
    LXC.new.containers.collect do |container|
      new(container)
    end
  end
end
