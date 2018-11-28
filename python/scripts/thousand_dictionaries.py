
user_1 = {
'name': 'user_1',
'skill': 'python',
}

users = []
print("Users list before for loop.")
print(users)
print("Adding users...\n")


for user_number in range(11):
    new_user = {}
    new_user['name'] = 'user_' + str(user_number)
    new_user['skill'] = 'python'
    users.append(new_user)

print("Newly added users: ")
print(users)


total_distance = 1300
galon_price = 3.16
miles_on_a_galon = 23
cost_per_mile = round(galon_price / miles_on_a_galon, 2)
total_savings = round(total_distance * cost_per_mile, 2)
print("Cost per mile: " + str(cost_per_mile)+ "$")
print("Total savings: " + str(total_savings) + "$")
