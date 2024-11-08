class PearlMembersController < ApplicationController
  before_action :set_pearl_member, only: %i[ show edit update destroy ]

  # GET /pearl_members or /pearl_members.json
  def index
    @pearl_members = PearlMember.all
  end

  # GET /pearl_members/1 or /pearl_members/1.json
  def show
  end

  # GET /pearl_members/new
  def new
    @pearl_member = PearlMember.new
  end

  # GET /pearl_members/1/edit
  def edit
  end

  # POST /pearl_members or /pearl_members.json
  def create
    @pearl_member = PearlMember.new(pearl_member_params)

    respond_to do |format|
      if @pearl_member.save
        format.html { redirect_to pearl_member_url(@pearl_member), notice: "Pearl member was successfully created." }
        format.json { render :show, status: :created, location: @pearl_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pearl_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pearl_members/1 or /pearl_members/1.json
  def update
    respond_to do |format|
      if @pearl_member.update(pearl_member_params)
        format.html { redirect_to pearl_member_url(@pearl_member), notice: "Pearl member was successfully updated." }
        format.json { render :show, status: :ok, location: @pearl_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pearl_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pearl_members/1 or /pearl_members/1.json
  def destroy
    @pearl_member.destroy!

    respond_to do |format|
      format.html { redirect_to pearl_members_url, notice: "Pearl member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pearl_member
      @pearl_member = PearlMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pearl_member_params
      params.require(:pearl_member).permit(:first_name, :last_name, :email, :description, :current_member, :role)
    end
end
