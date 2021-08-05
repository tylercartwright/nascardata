# Tyler Cartwright - NASCAR web scrape

import bs4, re, requests, xlsxwriter, pandas as pd, lxml.html as lh
from openpyxl import load_workbook

scrapeurl = 'https://www.driveraverages.com/nascar/race.php?sked_id=2021'

# Change this range to 22 when done with other work
for x in range(22): # How many races there have been in the season.
    nascar = requests.get(scrapeurl + str(x+1).zfill(3)) # Makes the URL to scrape the scrapeurl plus a number with 3 digits.
    pagecontents = bs4.BeautifulSoup(nascar.text, 'html.parser') # Uses BS4 to parse the text of the 'nascar' variable.
    racenameget = pagecontents.select('.td-bold') # Grabs only the td-bold class from the parsed HTML.
    compiledregex = re.compile(r'<span class="td-bold">.+?<br/>') # Define regex: <span class="td-bold">, any text of any length, and a line break.
    ln = compiledregex.search(str(racenameget)) # Searches through 'racenameget' using the conditions of the regex from the last line.
    rn = str(ln.group()) # Converts ln to a string.
    rn1 = rn[22:] # Removes the first 22 characters, which reduces this to the race name plus a line break.
    sheetname = rn1.strip("<br/>") # Strips the line break, leaving the race name itself as the sheet name.
    print(sheetname) # For debug purposes: Print the race name
    soup = bs4.BeautifulSoup(nascar.content, 'lxml') # Parses the page again, but with lxml, to make getting the table easier.
    data = soup.find_all('table',{"class": "sortable tabledata-nascar table-large"}) # Finds tables, but narrows them down to the only one with the sortable tabledata-nascar table-large class.
    df = pd.read_html(str(data)) # Creates a dataframe from the table
    print(df[0]) # For debug purposes: Print the dataframe contents; it's a single element list (contained in brackets), so the [0] pulls that one element.
    wbpath = r"C:\Users\Harriet Tubman\OneDrive\NASCAR.xlsx" # Sets 'wbpath' to the location of the workbook I want to modify
    book = load_workbook(wbpath) # Loads the workbook from the specified path, 'wbpath'
    writer = pd.ExcelWriter(wbpath, engine = 'openpyxl') # Specifies the openpyxl engine and points the Excel writer at the workbook.
    writer.book = book # Sets the workbook to the book variable.
    df[0].to_excel(writer, sheet_name=sheetname[0:30], index=False) # Writes the first (only) element in df to a worksheet with the first 31 characters of the 'sheetname' variable.
    writer.save() # Saves the workbook.
    writer.close() # Closes the editor between edits so killing the process halfway through will hypothetically be possible.
