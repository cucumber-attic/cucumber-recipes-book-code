require 'parallel'

# START:shipping
class Shipping
  @@logger = Logger.new 'shipping.log'

  def self.pack_container(container)
    @@logger.info "Container ##{container} - START"
    sleep 2
    @@logger.info "Container ##{container} - DONE"
  end
end
# END:shipping
