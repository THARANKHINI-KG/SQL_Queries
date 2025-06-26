import math
from datetime import datetime

# Expense Dictionary
expenses = {}

def add_expense():
    try:
        date_str = input("Enter date (YYYY-MM-DD): ")
        date = datetime.strptime(date_str, "%Y-%m-%d").date()
        amount = float(input("Enter amount: ₹"))
        category = input("Enter category (e.g., Food, Rent, Travel): ").capitalize()

        if date not in expenses:
            expenses[date] = []
        expenses[date].append((amount, category))
        print(f"Expense added: ₹{amount} for {category} on {date}")
    except ValueError:
        print("Invalid input. Try again.")

def view_monthly_total():
    try:
        year = int(input("Enter year (YYYY): "))
        month = int(input("Enter month (1-12): "))
        total = 0.0
        for date, entries in expenses.items():
            if date.year == year and date.month == month:
                total += math.fsum([entry[0] for entry in entries])
        print(f"Total expenses for {year}-{month:02}: ₹{total}")
    except ValueError:
        print("Invalid input.")

def view_yearly_total():
    try:
        year = int(input("Enter year (YYYY): "))
        total = 0.0
        for date, entries in expenses.items():
            if date.year == year:
                total += math.fsum([entry[0] for entry in entries])
        print(f"Total expenses for {year}: ₹{total}")
    except ValueError:
        print("Invalid input.")

def view_expenses_by_category():
    category_input = input("Enter category to filter: ").capitalize()
    filtered = [(date, amount, category)
                for date, entries in expenses.items()
                for amount, category in entries if category == category_input]
    if not filtered:
        print("No expenses found in this category.")
    else:
        print(f"Expenses in category '{category_input}':")
        for date, amount, category in filtered:
            print(f"  - {date}: ₹{amount}")

def menu():
    while True:
        print("\nExpense Tracker Menu")
        print("1. Add Expense")
        print("2. View Monthly Total")
        print("3. View Yearly Total")
        print("4. View by Category")
        print("5. Exit")
        choice = input("Choose an option (1-5): ")

        if choice == '1':
            add_expense()
        elif choice == '2':
            view_monthly_total()
        elif choice == '3':
            view_yearly_total()
        elif choice == '4':
            view_expenses_by_category()
        elif choice == '5':
            print("Exiting tracker. Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

# Run the tracker
if __name__ == "__main__":
    menu()
