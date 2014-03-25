class ContainerTemplate
  def initialize(fullname)
    @fullname = fullname
  end

  def name
    @fullname[4..-1]
  end

  def self.all
    [].tap do |list|
      Dir.new("/usr/lib/lxc/templates").entries.each do |entry|
        list << new(entry) unless entry[0] == "."
      end
    end
  end
end
