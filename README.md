![alt text](https://github.com/tylercartwright/nascardata/blob/main/web%20scraper.png?raw=true)

Web scraping and writing dataframes to Excel using BS4 and Pandas, followed by data manipulation and visualization.

## Step #1: Collecting the Data
The first part of this process is done with Python. *NASCAR web scrape.py* was created to scrape the driveraverages.com website for an entire season of races. First, running the script asks the user to input a year. Years between 1949 and the present are acceptable. It will then use this year to determine the URLs to scrape. It will first scrape the page of the season's first race for the bottom table, which contains information on all the races run that season; it specifically looks for the first column of the last row of this table to determine how many races there are in the season.

Once the script knows how many races there are, it begins to go through each race of the season one by one, making a spreadsheet from the first table of each of these URLs. It will continue until either the website rejects the request or the season is complete. It will check for sheets of the name it is attempting to create to know whether that race has already been completed, and if it has, it will count the sheets to determine how many races are done and skip ahead. This allows the script to be restarted if the website rejects requests.

After all race data has been collected, the script begins to briefly clean each worksheet by removing the redundant last row, removing borders from cells, converting all numbers that should be the number datatype from strings, and deleting the default "Sheet" that exists when the workbook is made.

*NASCAR_1949.xlsx* is what the script outputs when the year 1949 is entered.
