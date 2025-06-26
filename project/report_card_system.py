import math
from datetime import datetime

students = {}

def add_student():
    name = input("Enter student name: ")
    roll = input("Enter roll number: ")
    students[roll] = {"name": name, "marks": []}
    print("Student added.")

def add_marks():
    roll = input("Enter roll number: ")
    if roll in students:
        marks = list(map(int, input("Enter 3 subject marks separated by space: ").split()))
        students[roll]["marks"] = marks
        print("Marks added.")
    else:
        print("Student not found.")

def print_report():
    for roll, info in students.items():
        name = info["name"]
        marks = info["marks"]
        if marks:
            total = math.fsum(marks)
            average = round(total / len(marks), 2)
            grade = (lambda avg: 'A' if avg >= 90 else 'B' if avg >= 75 else 'C' if avg >= 50 else 'F')(average)
            print("\nReport Card -", datetime.now().date())
            print("Name:", name)
            print("Roll Number:", roll)
            print("Marks:", marks)
            print("Total:", total)
            print("Average:", average)
            print("Grade:", grade)
        else:
            print(f"\n{name} has no marks recorded.")

def menu():
    while True:
        print("\nMENU")
        print("1. Add Student")
        print("2. Add Marks")
        print("3. Print Report Card")
        print("4. Exit")
        ch = input("Choose (1-4): ")

        if ch == '1':
            add_student()
        elif ch == '2':
            add_marks()
        elif ch == '3':
            print_report()
        elif ch == '4':
            print("Exiting program.")
            break
        else:
            print("Invalid choice.")

menu()
