class EmployeePtosController < ApplicationController
  before_action :set_employee_pto, only: %i[ show edit update destroy ]

  # GET /employee_ptos or /employee_ptos.json
  def index
    @employee_ptos = EmployeePto.all
  end

  # GET /employee_ptos/1 or /employee_ptos/1.json
  def show
  end

  # GET /employee_ptos/new
  def new
    @employee_pto = EmployeePto.new
  end

  # GET /employee_ptos/1/edit
  def edit
  end

  # POST /employee_ptos or /employee_ptos.json
  def create
    @employee_pto = EmployeePto.new(employee_pto_params)

    respond_to do |format|
      if @employee_pto.save
        format.html { redirect_to employee_pto_url(@employee_pto), notice: "Employee pto was successfully created." }
        format.json { render :show, status: :created, location: @employee_pto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_pto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_ptos/1 or /employee_ptos/1.json
  def update
    respond_to do |format|
      if @employee_pto.update(employee_pto_params)
        format.html { redirect_to employee_pto_url(@employee_pto), notice: "Employee pto was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_pto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_pto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_ptos/1 or /employee_ptos/1.json
  def destroy
    @employee_pto.destroy

    respond_to do |format|
      format.html { redirect_to employee_ptos_url, notice: "Employee pto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_pto
      @employee_pto = EmployeePto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_pto_params
      params.require(:employee_pto).permit(:pto_type, :start_date, :end_date, :employee_id)
    end
end
