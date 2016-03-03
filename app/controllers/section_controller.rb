class SectionController < ApplicationController
  
  layout 'admin'
  def index
    @sections = Section.order('position ASC')
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default Section"})
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Section #{section.id} created succesfully"
      redirect_to(:action => 'index')      
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section @scetion.name Edited successfully"
      redirect_to(:action => 'show',:id => @section.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Seccessfully Destroyed #{section.name} Section"
    redirect_to(:action => 'index')
  end

  private
    def section_params
      params.require(:section).permit(:name,:visible,:position,:permalink,:page_id,:content_type,:content)
    end
end
