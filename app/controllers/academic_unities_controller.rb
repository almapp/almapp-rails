class AcademicUnitiesController < ApplicationController
  before_action :set_academic_unity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @academic_unities = AcademicUnity.all
    respond_with(@academic_unities)
  end

  def show
    respond_with(@academic_unity)
  end

  def new
    @academic_unity = AcademicUnity.new
    respond_with(@academic_unity)
  end

  def edit
  end

  def create
    @academic_unity = AcademicUnity.new(academic_unity_params)
    @academic_unity.save
    respond_with(@academic_unity)
  end

  def update
    @academic_unity.update(academic_unity_params)
    respond_with(@academic_unity)
  end

  def destroy
    @academic_unity.destroy
    respond_with(@academic_unity)
  end

  private
    def set_academic_unity
      @academic_unity = AcademicUnity.find(params[:id])
    end

    def academic_unity_params
      params.require(:academic_unity).permit(:name, :faculty_id, :url, :email, :address, :information, :facebook, :twitter)
    end
end
