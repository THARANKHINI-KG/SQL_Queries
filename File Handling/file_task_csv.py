#file handling
#csv files

import csv
import os
data = [
    ['Name', 'Age', 'City'],
    ['alice', 28, 'karur'],
    ['bob', 35, 'cbe']
]
folder = r"G:\THARA\hexaware\file handling"
file = "sample_book.csv"
full_path = os.path.join(folder, file)

#make sure folder exists
os.makedirs(folder, exist_ok=True)

# Open a file in write mode
with open(full_path, 'w', newline='') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerows(data)

print(f"CSV file saved to {full_path}")

with open(full_path, 'r') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        print(row)