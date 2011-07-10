class ShiftsController < ApplicationController
  before_filter :find_shift, :only => [:show, :edit, :update, :destroy]
  
  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params[:shift])
      if @shift.save
        redirect_to(@shift, :notice => 'Shift was successfully created.')
      else
        render :action => "new"
      end
  end

  def update
      if @shift.update_attributes(params[:shift])
        redirect_to(@shift, :notice => 'Shift was successfully updated.')
      else
        render :action => "edit"
      end
  end

  def destroy
    @shift.destroy
    redirect_to(shifts_url)
  end
  
  private
  def find_shift
    @shift = Shift.find(params[:id])
  end
end
