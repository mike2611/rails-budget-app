class CostController < ApplicationController
  load_and_authorize_resource
  def index
    @group = Group.find(params[:group_id])
    @costs = @group.costs
    @total = total_costs
  end

  def new
    @groups = Group.all
  end

  def create
    @cost.user = current_user
    groups = params[:groups]

    if groups.nil?
      flash[:alert] = 'You should select at least one category'
      redirect_to new_group_cost_path
      @cost.destroy
    else
      groups.each do |key, _value|
        CostGroup.create(cost: @cost, group: Group.find(key))
      end
      if @cost.save
        redirect_to root_path, notice: 'Succesfully created new transaction'
      else
        flash[:alert] = 'Error creating new transaction'
        render :new
      end
    end
  end

  private

  def cost_params
    params.require(:cost).permit(:name, :amount, :groups)
  end

  def total_costs
    return {} if current_user.nil?

    amount = 0
    @costs.each do |cost|
      amount += cost.amount
    end
    amount
  end
end
