import pyodbc

# database connection to ms sql server
try:
    conn = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=school;'
        'Trusted_Connection=yes;'
    )
    cursor = conn.cursor()
    print("Connection established")

#insert values into tables
    cursor.executemany(
       "insert into students (name, email, phonenumber, age) values (?, ?, ?, ?)",
    [
                ("john", "john@gmail.com", "9874512365", 22),
                ("kumar", "kumar@gmail.com", "8541230697", 18),
                ("alice", "alice@gmail.com", "6541207893", 26),
            ]
    )
    print("Inserted 3 students")

    cursor.executemany(
    "INSERT INTO Courses (CourseName, CourseCode, Credits) VALUES (?, ?, ?)",
    [
                ("Mathematics", "101", 4),
                ("Physics", "201", 3),
                ("English", "301", 2),
            ]
    )
    print("Inserted 3 courses")

    cursor.executemany(
        "INSERT INTO Enrollments (studentid, courseid, grade) VALUES (?, ?, ?)",
        [
            (1, 1, "A"),
            (2, 2, "B"),
            (3, 3, "A+"),
        ]
    )
    print("Inserted 3 enrollments")
    conn.commit()

    # print all datas in all tables in the database
    print("\nstudents table:")
    cursor.execute("select * from students")
    for row in cursor.fetchall():
        print(row)

    print("\ncourses table:")
    cursor.execute("select * from courses")
    for row in cursor.fetchall():
        print(row)

    print("\nenrollment table:")
    cursor.execute("select * from enrollments")
    for row in cursor.fetchall():
        print(row)

    conn.close()

except Exception as e:
    print("Connection failed")
    print("Error:",e)