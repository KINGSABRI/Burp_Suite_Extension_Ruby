#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Pure Suite ITab implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JTabbedPane
java_import javax.swing.JPanel
java_import javax.swing.JLabel
java_import java.awt.Image
java_import javax.swing.ImageIcon
java_import javax.swing.JFrame
java_import javax.swing.SwingUtilities
java_import javax.swing.SwingConstants
java_import java.net.URL
java_import java.awt.Toolkit
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
    @callbacks.setExtensionName('Ruby | Usb icon with tab')              # Set Extension name
    
    #
    # GUI | Implement ITab
    #
    @tabs = JTabbedPane.new
    @callbacks.customizeUiComponent(@tabs)
    @callbacks.addSuiteTab(self)
    
    img_url = URL.new 'file:///BurpSuite_Extension_Ruby_Template/logo-small.png'
    # icon = ImageIcon.new(img_url)       # Create an image
    icon = ImageIcon.new(ImageIcon.new(img_url).getImage().getScaledInstance(30, 30, 1))  # create image and resize
    label1 = JLabel.new('Sub-tab!')     # Create a label with string
    label1.setIcon(icon)                # put the icon in the label
    label1.setIconTextGap(5)
    label1.setHorizontalTextPosition(SwingConstants.RIGHT)
    panel1 = JPanel.new                 # Create a JPanel
    @tabs.addTab('blabla', panel1)      # it doesn't matter what tab title is, it gets overwritten by it's label
    @tabs.setTabComponentAt(0, label1)  # Set all label work to panel 0

    
  end
  
  # ITab::getTabCaption()
  #
  # Set the tab caption
  def getTabCaption
    "I've icons"
  end
  
  # ITab::getUiComponent
  def getUiComponent
    @tabs
  end

end
  
