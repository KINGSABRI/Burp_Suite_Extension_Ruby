#
# KING SABRI | @KINGSABRI
# BurpSuite Extension | Suite ITab with tree implementation
#

# Ruby requires
require 'java'
# Java imports
java_import javax.swing.JTabbedPane
java_import javax.swing.JPanel
java_import javax.swing.JLabel
java_import javax.swing.JTree
java_import javax.swing.JScrollPane           # provides a scrollable view of a component
java_import javax.swing.SwingUtilities
java_import javax.swing.tree.DefaultTreeModel
java_import javax.swing.tree.DefaultMutableTreeNode
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
    @callbacks.setExtensionName('Tree Tab')              # Set Extension name
    
    #
    # GUI
    #
    
    # Implement ITab
    @tabs = JTabbedPane.new
    @callbacks.customizeUiComponent(@tabs)
    @callbacks.addSuiteTab(self)
    @tabs.addTab('Tree', Tree.build)
    
  end
  
  # ITab::getTabCaption()
  #
  # Set the tab caption
  def getTabCaption
    'Tree Tab'
  end
  
  # ITab::getUiComponent
  def getUiComponent
    @tabs
  end
  
end

class Tree
  
  def self.build
    @tree = JTree.new
    # create nodes
    tree_node1 = DefaultMutableTreeNode.new("Root")
    tree_node2 = DefaultMutableTreeNode.new("Colors")
    tree_node3 = DefaultMutableTreeNode.new("blue")
    tree_node4 = DefaultMutableTreeNode.new("BBBB")
    tree_node5 = DefaultMutableTreeNode.new("CCCC")
    tree_node6 = DefaultMutableTreeNode.new("red")
    tree_node7 = DefaultMutableTreeNode.new("yellow")
    tree_node1.add(tree_node2)
    tree_node2.add(tree_node3)
    tree_node2.add(tree_node6)
    tree_node2.add(tree_node7)
    tree_node3.add(tree_node4)
    tree_node4.add(tree_node5)
    
    tree_node2 = DefaultMutableTreeNode.new("Sports")
    tree_node3 = DefaultMutableTreeNode.new("basketball")
    tree_node2.add(tree_node3)
    tree_node3 = DefaultMutableTreeNode.new("soccer")
    tree_node2.add(tree_node3)
    tree_node1.add(tree_node2)
    
    tree_node2 = DefaultMutableTreeNode.new("Food")
    tree_node3 = DefaultMutableTreeNode.new("hot dogs")
    tree_node2.add(tree_node3)
    tree_node3 = DefaultMutableTreeNode.new("pizza")
    tree_node2.add(tree_node3)
    tree_node1.add(tree_node2)
    
    
    @tree.setModel(DefaultTreeModel.new(tree_node1))
    @tree.setVisible(true)
    
    jScrollPane = JScrollPane.new
    jScrollPane.setViewportView(@tree)
    
    return jScrollPane
  end
  
end
  
