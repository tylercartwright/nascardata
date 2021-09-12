![alt text](https://github.com/tylercartwright/nascardata/blob/main/web scraper.png?raw=true)

Web scraping and writing dataframes to Excel using BS4 and Pandas, followed by data manipulation and visualization.

**NASCAR web scrape.py:** Process begins with Python; NASCAR web scrape.py created to scrape the driveraverages.com website for a number of races defined in a variable; this variable is counted to with a for loop that updates the URL to grab that number of races for the given season (2021 in this case). Each of the pages have their HTML scraped for tables; the first table, which contains statistics for each driver in the race including finish position, points, and team driven for. The table is saved to a dataframe and written to an individual worksheet in an Excel workbook. The output is simply called NASCAR.xlsx.

**NASCAR.xlsx:** This is the initial output of the previous step, before the data has been cleaned or formatted. The numbers are strings, and therefore all have a "Number Stored As Text" issue. This is corrected by selecting all cells and simply using Paste Special to multiply by 1, which has the added advantage of filling the empty cells in the S1, S2, and S3 columns (which represent stage points, which will only have ten values due to how these points are assigned) with 0.
