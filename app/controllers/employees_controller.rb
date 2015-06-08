class EmployeesController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "geheim" # passwortabfrage beim Laden
  # passwortabfrage fuer edit, update, destroy
  # http_basic_authenticate_with name: "admin", password: "geheim", only: [:edit, :update, :destroy]
  # passwortabfrage auch fuer show (alles ausser index..)
  http_basic_authenticate_with name: "admin", password: "geheim", except: [:index]
  
  # before_action call method before the actions which we declare, like
  # before_action :set_event, only: [:show, :update, :destroy, :edit]
  # set_event is a method which will call always before show, update, edit and destroy.
  # somit kann edit leer bleiben und die Form ist trotzdem mit den jeweiligen Werten gefuellt
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    
    respond_to do |format|
      format.html # index.html.erb
      # format.json render json: @employees
      format.js # index.js.erb  # Anweisung Javascript akzeptieren fuer AJAX
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:firstname, :lastname, :birthday, :email, :comment)
  end
end
