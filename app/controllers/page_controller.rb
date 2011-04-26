class PageController < ApplicationController

  before_filter :get_page, :only => :index
  
  def show
  end
    
  private
  
    def get_page
      @page = Page.active.find_by_path(page_path)
    end
      
    def page_path
      params[:path] || "/"
    end
        
end
