module ContainersHelper
  def stop_start_button(container)
    if container.state == :stopped
      primary_button("Start", start_container_path(container))
    else
      danger_button("Stop", stop_container_path(container))
    end
  end

  def state_badge(container)
    if container.state == :stopped
      danger_label(:stopped)
    elsif container.state == :running
      success_label(:running)
    end
  end
end
