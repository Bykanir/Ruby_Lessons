module InstanceCounter
  module ClassMethods

    @@instances = 0

    def instances
      @@instances
    end

    def increase_instances(instances)
      @@instances = instances
    end
  end

  module InstanceMethods

    @@instances = 0

    private

    def register_instance
      @@instances += 1
    end
  end
end
