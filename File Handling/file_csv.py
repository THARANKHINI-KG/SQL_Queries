import csv
data = [['Name','Age'],
        ['Tom', 21],
        ['Michael', 35],
        ['Jack', 24]]
with open(r"G:\THARA\hexaware\file handling\sample.csv","w",newline='') as file:
    writer = csv.writer(file)
    writer.writerows(data)
with open(r"G:\THARA\hexaware\file handling\sample.csv","r") as file:
    reader = csv.reader(file)
    for row in reader:
        print(row)
