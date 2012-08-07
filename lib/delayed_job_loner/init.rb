module Delayed
  module Backend
    module ActiveRecord
      class Job < ::ActiveRecord::Base
        attr_accessor :unique_on

        before_create :check_uniqueness

        def check_uniqueness
          if unique_on
            scope = self.class.where("handler like '%method_name: :#{payload_object.method_name}%'").where(:locked_by => nil)
            unique_on.each do |attribute_name|
              scope = scope.where("handler like '%#{attribute_name}: #{payload_object.send(attribute_name)}%'")
            end
            scope.first.nil?
          else
            true
          end
        end

      end
    end
  end
end