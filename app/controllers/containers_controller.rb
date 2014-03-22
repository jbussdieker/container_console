class ContainersController < ApplicationController
  before_filter :set_container, only: [:show, :start, :stop, :destroy]

  def index
    @containers = Container.all
  end

  def new
    @container = Container.new
  end

  def show
    @things = @container.execute("/bin/true")
  end

  def start
    @container.start
    redirect_to @container
  end

  def stop
    @container.stop
    redirect_to @container
  end

  def create
    @container = Container.new(params[:container])
    if @container.save
      redirect_to containers_path
    else
      render 'new'
    end
  end

  def destroy
    @container.destroy
    redirect_to containers_path
  end

  private

    def set_container
      @container = Container.find(params[:id])
    end
end
