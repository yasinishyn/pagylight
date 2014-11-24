#
# Init lib
#
if defined? Rails
  ActiveSupport.on_load(:active_record) do
    require 'pagylight/active_record_extension'
    ::ActiveRecord::Base.send :extend, Pagylight::ActiveRecordExtension
  end
end