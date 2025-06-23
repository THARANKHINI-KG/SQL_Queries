with open("C:\\Users\\thara\\OneDrive\\Desktop\\msg.txt","w") as file:
    file.write("file handling")

with open("C:\\Users\\thara\\OneDrive\\Desktop\\msg.txt","r") as file:
    content = file.read()
    print(content)

with open("C:\\Users\\thara\\OneDrive\\Desktop\\msg.txt","a") as file:
    file.write("\ncheers morning..!!")
