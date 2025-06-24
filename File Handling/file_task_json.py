#file handling
#json file

import json
import os
# data = {"name":"john", "age":25, "city":"karur"}

# read existing json data
folder = r"G:\THARA\hexaware\file handling"
file = "book.json"
full_path = os.path.join(folder,file)

try:
    with open(full_path,"r") as file:
        data = json.load(file)
except FileNotFoundError:
    data = {}

# add more key value pairs
data["gender"] = "male"
data["email"] = "john@example.com"
data["skills"] = ["Python", "SQL", "Excel"]

with open(full_path, "w") as file:
    json.dump(data, file, indent=4)
    print(f"Data added and saved to {full_path}")


# multiple user to existing json file

import json
import os
# New user to add
new_user = {
    "name": "Bob",
    "age": 40,
    "city": "Chicago"
}
folder = r"G:\THARA\hexaware\file handling"
file = "book.json"
full_path = os.path.join(folder, file)

try:
    with open(full_path, "r") as file:
        data = json.load(file)
        # Ensure data is a list to store multiple users
        if isinstance(data, dict):
            data = [data]  # convert single dict to list
except FileNotFoundError:
    data = []

john = {
    "name": "John",
    "age": 25,
    "city": "Karur",
    "gender": "male",
    "email": "john@example.com",
    "skills": ["Python", "SQL", "Excel"]
}
if john not in data:
    data.append(john)

if new_user not in data:
    data.append(new_user)

with open(full_path, "w") as file:
    json.dump(data, file, indent=4)
print(f"data for John and Bob saved to {full_path}")