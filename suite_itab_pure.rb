#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Pure Suite ITab implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JTabbedPane
# Burp Suite API imports
java_import 'burp.IBurpExtender'
java_import 'burp.IBurpExtenderCallbacks'
java_import 'burp.ITab'


#
# BurpExtender, the main Extender API ِِclass to register all extensions and interfaces
#
class BurpExtender
  include IBurpExtender
  include ITab
  
  attr_reader :callbacks
  
  # IBurpExtender::registerExtenderCallbacks(IBurpExtenderCallbacks callbacks);
  def registerExtenderCallbacks(callbacks)
    @callbacks = callbacks
    @callbacks.setExtensionName('Ruby | Pure Suite ITab')              # Set Extension name
    
    
    #
    # GUI | Implement ITab
    #
    @tabs = JTabbedPane.new
    @callbacks.customizeUiComponent(@tabs)
    @callbacks.addSuiteTab(self)
  end
  
  # ITab::getTabCaption()
  #
  # Set the tab caption
  def getTabCaption
    'Suite ITab'
  end
  
  # ITab::getUiComponent
  def getUiComponent
    @tabs
  end
  
end
  
