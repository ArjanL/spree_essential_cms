require 'spree_essentials'

module SpreeEssentialCms

  def self.tab
    [:press, { :route => :admin_press_index }]
  end
  
  def self.sub_tab
    [:press, { :route => :admin_press_index, :label => 'admin.subnav.press', :match_path => '/press' }]
  end
  
  def self.independent?
    return true unless defined?(SpreeEssentials)
    !SpreeEssentials.has?(:press)
  end
  
  class Engine < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)    
  end
  
end

if SpreeEssentialPress.independent?
  require 'spree_essential_press/custom_hooks'
else 
  SpreeEssentials.register :press, SpreeEssentialPress 
end