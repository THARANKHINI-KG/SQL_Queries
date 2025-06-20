# employee class
class EmployeeManager:
    def __init__(self):
        self.employees = [] # List to store employee dictionaries

    def add_employee(self, emp_id, name, salary):
        self.employees.append({"id": emp_id, "name": name, "salary": salary})
        print(f"Employee {name} added.")

    def get_employee(self, emp_id):
        for employee in self.employees:
            if employee["id"] == emp_id:
                return employee
        return f"No employee found with ID {emp_id}"

    def get_high_salary_employees(self, min_salary):
        return [emp for emp in self.employees if emp["salary"] > min_salary]

print("\nManage Employee Data")
manager = EmployeeManager()
manager.add_employee(1, "Chara", 50000)
manager.add_employee(2, "Bala", 60000)
manager.add_employee(3, "Vishnu", 40000)

print(manager.get_employee(2))
high_salary = manager.get_high_salary_employees(45000)
print(high_salary)


# Student Class
class Student:
    def __init__(self, student_id, student_name):
        self.student_id = student_id
        self.student_name = student_name

    def display(self):
        print(f"Student ID   : {self.student_id}")
        print(f"Student Name : {self.student_name}")

print("\nStudent Class with Instance Attributes")
s1 = Student(101, "Chara")
s1.display()


# Rectangle Class
class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def compute_area(self):
        return self.length * self.width

print("\nRectangle Class")
rect = Rectangle(10, 5)
print("Area of Rectangle:", rect.compute_area())


# employee with overtime pay
class Employee:
    def __init__(self, emp_id, name, salary, department):
        self.emp_id = emp_id
        self.name = name
        self.salary = salary
        self.department = department

    def calculate_overtime_pay(self, extra_hours, rate_per_hour):
        overtime_pay = extra_hours * rate_per_hour
        return overtime_pay

    def display_info(self):
        print(f"ID         : {self.emp_id}")
        print(f"Name       : {self.name}")
        print(f"Salary     : {self.salary}")
        print(f"Department : {self.department}")

print("\nEmployee Class with Overtime Calculation")
emp1 = Employee(101, "Ravi", 40000, "IT")

emp1.display_info()
overtime = emp1.calculate_overtime_pay(5, 200)
print(f"Overtime Pay: ₹{overtime}")


#encapsulation
#base class
class Employee:
    def __init__(self, name, salary):
        self.name = name  # Public
        self._salary = salary  # Protected
    #getter method
    def get_salary(self):
        return self._salary

    def work(self):
        return f"{self.name} is working."

# Inherited class
class Developer(Employee):
    def work(self):
        return f"{self.name} is writing code."

# Polymorphism with inherited classes
class Manager(Employee):
    def work(self):
        return f"{self.name} is managing the team."

print("\nEncapsulation")
# Encapsulation enforced through getter
developer = Developer("Alice", 80000)
manager = Manager("Bob", 100000)

for employee in [developer, manager]:
    print(employee.work())  # Polymorphism in action
    print(f"{employee.name}'s salary: {employee.get_salary()}")


#inheritance - vehicle and car
# Base class
class Vehicle:
    def __init__(self, brand, speed):
        self.brand = brand
        self.speed = speed

    def start(self):
        print(f"{self.brand} vehicle started.")

    def show_speed(self):
        print(f"Current speed: {self.speed} km/h")

# Derived class
class Car(Vehicle):
    def __init__(self, brand, speed, fuel_type):
        super().__init__(brand, speed)  # call base class constructor
        self.fuel_type = fuel_type

    def show_details(self):
        print(f"Brand: {self.brand}")
        print(f"Speed: {self.speed} km/h")
        print(f"Fuel Type: {self.fuel_type}")

print("\nInheritance - vehicle and car")
my_car = Car("Toyota", 120, "Petrol")
my_car.start()
my_car.show_speed()
my_car.show_details()
