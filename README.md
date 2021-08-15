# NASCAR Web Scraper
Web scraping and writing dataframes to Excel using BS4 and Pandas, followed by data manipulation and visualization.

Process begins with Python; NASCAR web scrape.py created to scrape the driveraverages.com website for a number of races defined in a variable; this variable is counted to with a for loop that updates the URL to grab that number of races for the given season (2021 in this case). Each of the pages have their HTML scraped for tables; the first table, which contains statistics for each driver in the race including finish position, points, and team driven for. The table is saved to a dataframe and written to an individual worksheet in an Excel workbook. The output is simply called NASCAR.xlsx.
