# file handling
#pandas

import openpyxl
import pandas as pd
data = {'name':['ram','rick','krish','varun'],'age':[16,54,25,61]}
df = pd.DataFrame(data)
print(df)

df.to_excel(r"G:\THARA\hexaware\file handling\note.xlsx",index=False)
df = pd.read_excel(r"G:\THARA\hexaware\file handling\note.xlsx")
print(df)