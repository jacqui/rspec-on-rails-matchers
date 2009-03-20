module Spec
  module Rails
    module Matchers
      class RescueExceptionWith
        def initialize(exception_class, options)
          @exception_class = exception_class
          raise ArgumentError unless options.is_a?(Hash) && options.has_key?(:with)
          @method = options[:with]
        end
        
        def matches?(rescuable_instance)
          rescuable_instance.handler_for_rescue(@exception_class.new) == rescuable_instance.method(@method)
        end
        
        def failure_message_for_should
          "expected #{@exception_class.inspect} to be rescued with ##{@method}"
        end
        
        def failure_message_for_should_not
          "expected #{@exception_class.inspect} NOT to be rescued with ##{@method}"
        end
      end
      
      def rescue_exception(exception_class, options)
        RescueExceptionWith.new(exception_class, options)
      end
    end
  end
end

