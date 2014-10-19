require 'socket'

module Light
  class Tasks
    def self.wake_up
      messenger.lights_off
      messenger.darkest
      messenger.lights_on
      messenger.brightest
    end
    
    def self.turn_off
      messenger.lights_off
    end

    def self.messenger
      @messenger ||= Light::Messenger.new
    end
  end
end
