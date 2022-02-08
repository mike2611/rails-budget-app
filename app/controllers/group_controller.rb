class GroupController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = Group.all
    @group_costs = total_costs
  end

  def new; end

  def create
    @group.user = current_user
    if @group.save
      redirect_to root_path, notice: 'Succesfully created new group'
    else
      flash[:alert] = 'Error creating new group'
      render :new
    end
  end

  private 
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def total_costs
    return {} if current_user.nil?
    group_costs = {}
    @groups.each do |group|
      amount = 0
      group.costs.each do |cost|
        amount += cost.amount
      end
      group_costs[group.id] = amount
    end
    group_costs
  end

end
