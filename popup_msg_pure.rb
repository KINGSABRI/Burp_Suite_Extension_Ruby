#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Pure GUI popup message implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JOptionPane
# Burp Suite API imports
java_import 'burp.IBurpExtender'
java_import 'burp.IBurpExtenderCallbacks'


#
# BurpExtender, the main Extender API ِِclass to register all extensions and interfaces
#
class BurpExtender
  include IBurpExtender
  
  attr_reader :callbacks
  
  # IBurpExtender::registerExtenderCallbacks(IBurpExtenderCallbacks callbacks);
  def registerExtenderCallbacks(callbacks)
    @callbacks = callbacks
    @callbacks.setExtensionName('Ruby | Pure PopUp Message')              # Set Extension name


    type, major_v, minor_v = @callbacks.get_burp_version                  # Get general information from burp
    
    showMessageDialog(
        { title: 'Welcome, Rubyfu!',
          message:
                 "Thanks for installing 'Pure PopUp Message'\n" +
                     'Burp Type: '    + "#{type}\n" +
                     'Burp Version: ' + "#{major_v}.#{minor_v}",
          level: 1
        })
  end

  # showMessageDialog is a wrapper for 'JOptionPane.showMessageDialog' to popup a message box
  #
  # @param options [Hash]
  #   @option options Nil
  #   @option options :message [String]
  #   @option options :title [String]
  #   @option options :level [String]
  #                       Levels:
  #                         default                      = 1
  #                         JOptionPane::WARNING_MESSAGE = 2
  #                         JOptionPane.ERROR_MESSAGE    = 3
  #                         JOptionPane.PLAIN_MESSAGE    = 4
  def showMessageDialog(options={})
    JOptionPane.showMessageDialog(nil, options[:message] , options[:title], options[:level])
  end

end
  
 
