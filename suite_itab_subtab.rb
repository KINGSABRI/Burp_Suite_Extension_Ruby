#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Suite ITab and Sub-tabs/Sub-panel implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JTabbedPane
java_import javax.swing.JPanel
java_import javax.swing.JLabel
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
    @callbacks.setExtensionName('Ruby | Suite ITab and Sub-tabs/sub-panel')              # Set Extension name
    
    
    #
    # GUI
    #
    
    # Implement ITab
    @tabs = JTabbedPane.new
    @callbacks.customizeUiComponent(@tabs)
    @callbacks.addSuiteTab(self)
    
    # Implement Subtabs
    panel1 = JPanel.new
    panel2 = JPanel.new
    panel3 = JPanel.new
    
    @tabs.addTab('Sub-tab 1', panel1)
    @tabs.addTab('Sub-tab 2', panel2)
    @tabs.addTab('Sub-tab 3', panel3)
    panel3.add(JLabel.new("Hey! I'm a new Lab"))  # Add a Label in panel
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
  
