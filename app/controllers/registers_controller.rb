class RegistersController < ApplicationController
  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registers }
    end
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
    @register = Register.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/new
  # GET /registers/new.json
  def new
    @register = Register.new
    #@register = Register.includes([{lands: [:department, :municipality]}])
    2.times{ @register.lands.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/1/edit
  def edit
    @register = Register.find(params[:id])
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(params[:register])

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render json: @register, status: :created, location: @register }
      else
        format.html { render action: "new" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registers/1
  # PUT /registers/1.json
  def update
    @register = Register.find(params[:id])

    respond_to do |format|
      if @register.update_attributes(params[:register])
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register = Register.find(params[:id])
    @register.destroy

    respond_to do |format|
      format.html { redirect_to registers_url }
      format.json { head :no_content }
    end
  end

  #metodo para adicionar nuevo tr de lands
  def new_department 
    @id = DateTime.now.to_i
    @departments= Department.all
    @municipalities = Municipality.all
    respond_to do |wants|
      wants.html { render layout: false }
    end
  end

  #metodo adicion nuevo departmento
  def municipalities_from
    department = Department.find_by_id params[:id]
    @municipalities = department.try(:municipalities)
    respond_to do |wants|
      wants.html { render layout: false }
    end
  end
end