class SubjectsController < ApplicationController
  
  def index
      @subjects = Subject.all
  end

  def show
      @subject = Subject.find(params[:id])
  end

  def new
      @subject = Subject.new({:name => "Mike"})
  end

  def create
      @subject = Subject.new(subject_parmas)

      if @subject.save
        flash[:notice] = "Subject successfully saved"
        redirect_to(:action => 'index')
      else
        flash[:notice] = "Subject creation unsuccessful"
        render('new')
      end
  end

  def edit
      @subject = Subject.find(params[:id])
  end

  def update
      @subject = Subject.find(params[:id])
      if @subject.update_attributes(subject_parmas)
        flash[:notice] = "Subject updated successfully"
        redirect_to(:action => 'show', :id => @subject.id)

      else
        render('edit')
      end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject #{subject.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_parmas
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name,:position,:visible)
    end

end
