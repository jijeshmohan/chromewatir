module ChromeWatir
  module Exceptions

    # Root class for all Watir Exceptions
    class ChromeException < RuntimeError
      def initialize(message="")
          super(message)
      end
    end
    # This exception is thrown if an attempt is made to access an object that doesn't exist
    class UnknownObjectException < ChromeException; end
    # This exception is thrown if an attempt is made to access an object that is in a disabled state
    class ObjectDisabledException   < ChromeException; end
    # This exception is thrown if an attempt is made to access a frame that cannot be found
    class UnknownFrameException< ChromeException; end
    # This exception is thrown if an attempt is made to access a form that cannot be found
    class UnknownFormException< ChromeException; end
    # This exception is thrown if an attempt is made to access an object that is in a read only state
    class ObjectReadOnlyException  < ChromeException; end
    # This exception is thrown if an attempt is made to access an object when the specified value cannot be found
    class NoValueFoundException < ChromeException; end
    # This exception gets raised if part of finding an object is missing
    class MissingWayOfFindingObjectException < ChromeException; end
    # this exception is raised if an attempt is made to  access a table cell that doesnt exist
    class UnknownCellException < ChromeException; end
    # This exception is thrown if the window cannot be found
    class NoMatchingWindowFoundException < ChromeException; end
    # This exception is thrown if an attemp is made to acces the status bar of the browser when it doesnt exist
    class NoStatusBarException < ChromeException; end
    # This exception is thrown if an http error, such as a 404, 500 etc is encountered while navigating
    class NavigationException < ChromeException; end
    # This exception is raised if a timeout is exceeded
    class TimeOutException < ChromeException
      def initialize(duration, timeout)
        @duration, @timeout = duration, timeout
      end
      attr_reader :duration, :timeout
    end
    # This exception is raised if chrome is not found in path
    class BinaryNotFoundException < ChromeException; end
  end
end
