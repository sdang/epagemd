class SignOntoPagerController < ApplicationController
  
  def index
    @virtual_pagers = VirtualPager.find(:all)
  end
  
  def add_pager
    # begin
      vp = VirtualPager.find_by_id(params[:virtual_pager_id])
      if vp.add_pager(params[:pager_number])
        flash[:notice] = "Added pager #{params[:pager_number]} to #{vp.name}"
      else
        flash[:error] = "Invalid pager number, or pager already signed onto this virtual pager"
      end
    #rescue
    # flash[:error] = "Critical Error: Could not locate virtual pager id #{params[:virtual_pager_id]}"
    #end
    
    redirect_to :action => 'index'
  end
  
end