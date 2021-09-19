![NASCAR Web Scraper](https://github.com/tylercartwright/nascardata/blob/v0.2/web%20scraper.png?raw=true)

Web scraping and writing dataframes to Excel using BS4 and Pandas, followed by data manipulation and visualization.

## Step #1: Collecting the Data
The first part of this process is done with Python. *NASCAR web scrape.py* was created to scrape the driveraverages.com website for an entire season of races. First, running the script asks the user to input a year. Years between 1949 and the present are acceptable. It will then use this year to determine the URLs to scrape. It will first scrape the page of the season's first race for the bottom table, which contains information on all the races run that season; it specifically looks for the first column of the last row of this table to determine how many races there are in the season.

Once the script knows how many races there are, it begins to go through each race of the season one by one, making a spreadsheet from the first table of each of these URLs. It will continue until either the website rejects the request or the season is complete. It will check for sheets of the name it is attempting to create to know whether that race has already been completed, and if it has, it will count the sheets to determine how many races are done and skip ahead. This allows the script to be restarted if the website rejects requests.

After all race data has been collected, the script begins to briefly clean each worksheet by removing the redundant last row, removing borders from cells, converting all numbers that should be the number datatype from strings, and deleting the default "Sheet" that exists when the workbook is made.

*NASCAR_1949.xlsx* is what the script outputs when the year 1949 is entered.

## Step #2: Querying the Data
The second part of this process takes place in Microsoft SQL Server. Queries are done to interpret data. *NASCAR_1949_AvgFinish.sql* is a query done on the data imported from *NASCAR_1949.xlsx* to take the sum of a driver's finishes and divide it by the number of races they've run to determine their average finish for that season. The resulting output can be seen in *NASCAR_1949_AvgFinish.xlsx*. *NASCAR_1949_Wins.sql* is a query done to count driver wins, and *NASCAR_1949_Wins.xlsx* is that query's output. *NASCAR_1949_Top5s.sql* and *NASCAR_1949_Top10s.sql* are similar, in that they count driver finishes 5th or better and 10th and better respectively; their outputs are here too. Finally, *NASCAR_1949_LapsLed.sql* is simply a total of laps led for all races.

If there's one driver this project taught me to respect, it's Jack White, who showed up to a single race, won, and did not come back (until the next year, which is admittedly less amusing).

## Step #3: Visualizing the Data
The final part of this process is a job for Tableau. The Excel spreadsheets created in Step #2 are imported, and then the data is organized: Measure Names is my filter, Measure Values is my column, Driver and Measure Names are my rows. In the Measure Values card, I implement SUM(Wins), SUM(Top 5s), and SUM(Top 10s). I ultimately opted not to use the Laps Led and Avg Finish data I acquired simply because the numbers are so drastically inflated by lap counts and driver finishes that it minimizes the race counts; this data will likely be more usable in this way in later seasons where races occur weekly for most of the year and drivers could hypothetically get nearly as many Top 10s as there are drivers in a given race.

I found that the way this data sorted by default was not ideal; it simply used Drivers in alphabetical order. Attempting to sort by Wins was an improvement, but sorting by this one value became very awkward when I got past the first six drivers and found that the other 106 drivers were in alphabetical order with no regard given for their other results. To get around this, I created a calculated field where I weighted Wins as a 100, Top 5s as a 10, and Top 10s as a 1; this made it so that drivers with wins floated to the top, drivers with top 5s and no wins were directly below, drivers with top 10s but not top 5s followed, and drivers with no top 10s were at the bottom. There are arguably other ways to weight driver results for sorting, such as making drivers with three top 10 finishes and 1 top 5 finish such as Bill Snowden come before drivers like Sam Rice who got 2 top 5s (and therefore top 10s), but I found that for this particular data I was most satisfied with top 5s always outweighing top 10s.

![Tableau Public](https://github.com/tylercartwright/nascardata/blob/main/NASCAR_1949.png?raw=true)

## Step #4: Improving the Process
I intend to revisit this project and improve it in several places.

**Python:** With Python, I will make a temp file that tracks the current position in the web scraping process, the races in the season, and the cleaning status so that if the process gets interrupted it can be restarted without needing to scrape any tables, count up to the race total without scraping for the race count a second time, and only clean the table if it wasn't already cleaned. I'd also like to automate the SQL queries by preempting the worksheet and table names and simply generating a text file directly from the Python script at the end of the process.

**SQL:** In SQL, I want to combine my results into one output. I also want to get queries for stage wins and points, points earned, and championship position throughout and at the end of the season for later years.

**Visualization:** I want to do these visuals in Power BI in the future to push myself to learn something different.
