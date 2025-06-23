import pandas as pd
data = {'Name' : ['Tom', 'John', 'Michael'], 'Age' : [23, 45, 32]}
df = pd.DataFrame(data)
print(df)

df.to_excel(r'C:\Users\thara\OneDrive\Desktop\data.xlsx', index=False)
df = pd.read_excel(r"C:\Users\thara\OneDrive\Desktop\data.xlsx")
print(df)