from bs4 import BeautifulSoup
xml_data = """
    <books>
        <book id = "1">
            <title>harry potter</title>
                <author>tharankhini</author>
"""
soup = BeautifulSoup(xml_data, 'xml')
with open(r"G:\THARA\hexaware\file handling\sample2","w") as file:
    file.write(soup.prettify())
with open(r"G:\THARA\hexaware\file handling\sample2","r") as file:
    soup = BeautifulSoup(file,'xml')
    author = soup.find('author').text
    print(author)