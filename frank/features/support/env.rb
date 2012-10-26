# START:require
require 'frank-cucumber'
Frank::Cucumber::FrankHelper.use_shelley_from_now_on
# END:require

# START:launch
Before do
  app_path = ENV['APP_BUNDLE_PATH'] || raise('APP_BUNDLE_PATH undefined')
  launch_app app_path
end

After do
  step 'I quit the simulator'
end
# END:launch
