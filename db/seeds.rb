# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
user = User.create(name:'mike', email:'mike@gmail.com' ,password:'mike123');
group = Group.create(name:'Fast food', icon:'https://cdn-icons-png.flaticon.com/512/732/732060.png', user_id:user.id)
cost = Cost.create(name:'hamburguer', amount: 500, user_id:user.id)
cost2 = Cost.create(name:'fries', amount: 250, user_id:user.id)
CostGroup.create(cost_id:cost.id, group_id:group.id)
CostGroup.create(cost_id:cost2.id, group_id:group.id)

