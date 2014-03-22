class CreateContainerWorker
  include Sidekiq::Worker

  def perform(name, options)
    lxc = LXC.new
    @container = LXC::Container.new(lxc: lxc, name: name)
    @container.create(options)
  end
end
