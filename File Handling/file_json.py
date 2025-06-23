import json
data = {
    "person" : {
        "name" : "thara",
        "age" : 23
    },
    "student" : {
        "name" : "john",
        "age" : 15
    }
}
with open(r"G:\THARA\hexaware\file handling\sample1.json","w") as file:
    json.dump(data,file, indent=4)
with open(r"G:\THARA\hexaware\file handling\sample1.json", "r") as file:
    data = json.load(file)
print(data["person"]["name"])
print(data["student"])
