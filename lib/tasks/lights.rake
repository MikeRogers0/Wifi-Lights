namespace :lights do
  desc "Slowly turn on the lights"
  task :wake_up => :environment do
    Light::Tasks.wake_up
  end
  
  desc "turn off lights"
  task :turn_off => :environment do
    Light::Tasks.turn_off
  end
end
