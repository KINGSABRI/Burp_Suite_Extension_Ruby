#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Pure Alert message implementation
#

# Ruby requires
require 'java'
# Java imports

# Burp Suite API imports
java_import 'burp.IBurpExtender'


#
# BurpExtender, the main Extender API ِِclass to register all extensions and interfaces
#
class BurpExtender
  include IBurpExtender
  
  attr_reader :callbacks
  
  # IBurpExtender::registerExtenderCallbacks(IBurpExtenderCallbacks callbacks);
  def registerExtenderCallbacks(callbacks)
    @callbacks = callbacks
    @callbacks.setExtensionName('Ruby | Pure Alert Message')              # Set Extension name
    
    @callbacks.issueAlert('Alert: This is a message has been sent to Alert')
  end
  
end
  
 
 
