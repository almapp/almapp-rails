class TeachersController < ApplicationController
  before_action :set_faculty, only: [:index, :new, :create]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = @faculty.teachers
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = @faculty.teachers.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.faculty = @faculty

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    redirection = faculty_teachers_path(@teacher.faculty)
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to redirection, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_faculty
      @faculty = Faculty.friendly.find(params[:faculty_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = current_organization.teachers.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :information, :url)
    end
end
