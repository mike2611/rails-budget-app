class CostController < ApplicationController
  load_and_authorize_resource
  def index
    group = Group.find(params[:group_id])
    @costs = group.costs 
    @total = total_costs
  end

  private 
  
  def total_costs
    return {} if current_user.nil?
    amount = 0
    @costs.each do |cost|
      amount += cost.amount
    end
    amount
  end
end
