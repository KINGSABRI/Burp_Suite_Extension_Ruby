#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Pure context menu implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JMenu             # Right-click Section menu
java_import javax.swing.JMenuItem         # Right-click Regular menu

# Burp Suite API imports
java_import 'burp.IBurpExtender'
java_import 'burp.IBurpExtenderCallbacks'
java_import 'burp.IContextMenuFactory'

#
# BurpExtender, the main Extender API ِِclass to register all extensions and interfaces
#
class BurpExtender
  include IBurpExtender
  include IContextMenuFactory
  
  attr_reader :callbacks
  
  
  # IBurpExtender::registerExtenderCallbacks(IBurpExtenderCallbacks callbacks);
  def registerExtenderCallbacks(callbacks)
    @callbacks = callbacks
    @helper    = callbacks.getHelpers
    @context   = nil
    
    @callbacks.setExtensionName('Right-click Menu')     # Set Extension name
    @callbacks.registerContextMenuFactory(self)         # register a factory for custom context menu items.
  end
  
  # createMenuItems(IContextMenuInvocation invocation)
  # This method will be called by Burp when the user invokes a context menu anywhere within Burp.
  #
  # @param invocation
  # An object that implements the IMessageEditorTabFactory interface,
  #
  # @return Array
  def createMenuItems(invocation)
    menu_list = []   # Array of menus datastore
    
    menuItem = JMenuItem.new('<html><b>Ruby | Menu</b></html>')          # Create a regular menuitem
    menuItem.addActionListener { puts 'An action has been performed' }   # addActionLinstener takes a block of actions
    
    # Create Section menu (contains sub-menus)
    sectionsMenu = JMenu.new('<html><b>Ruby | Menu with sub-menus (Sections Menu)</b></html>')
    menuItem1 = JMenuItem.new('Sub-menuItem 1')                          # Create a regular menuitem
    menuItem1.addActionListener { puts 'Yup, menuItem 1 clicked!' }      # Add an action
    sectionsMenu.add(menuItem1)                                          # Add it to it's parent, the section menu
    menuItem2 = JMenuItem.new('Sub-menuItem 2')
    menuItem2.addActionListener { puts 'Yup, menuItem 2 clicked!' }
    sectionsMenu.add(menuItem2)
    
    # All menus has to be added to the array
    menu_list << menuItem
    menu_list << sectionsMenu
  end

end

