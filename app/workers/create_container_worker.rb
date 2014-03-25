class CreateContainerWorker
  include Sidekiq::Worker

  def perform(name, options)
    lxc = LXC.new
    @container = LXC::Container.new(lxc: lxc, name: name)
    result = @container.create(options)
    logger.error result
  end
end
