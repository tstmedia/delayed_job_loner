module Delayed
  module Backend
    module ActiveRecord
      class Job < ::ActiveRecord::Base
        attr_accessor :unique_on
        # attr_accessible :unique_on

        validate :check_uniqueness

        def check_uniqueness
          if unique_on
            scope = self.class.where("handler REGEXP '\\nmethod_name: :#{payload_object.method_name}\\n'").where(:locked_by => nil)
            unique_on.each do |attribute_name|
              scope = scope.where("handler REGEXP ' +#{attribute_name}: #{payload_object.send(attribute_name)}\\n'")
            end
            self.errors.add(:base, "Job already exists") unless scope.first.nil?
          else
            true
          end
        end

      end
    end
  end
end