class PagesController < ApplicationController
  
  def index
    @pages = Page.order('position')
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Default Name"})
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "#{@page.name} Saved successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page #{@page.id} Updated Successfully"
      redirect_to(:action => 'show',:id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page #{page.name} is successfully deleted"
    redirect_to(:action => 'index')
  end

  private
    def page_params
      params.require(:page).permit(:name,:position,:visible,:subject_id,:permalink)
    end
end
