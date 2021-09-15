SELECT
Drivers.Driver,
Charlotte.Finish AS Charlotte,
Daytona.Finish AS Daytona,
Occoneechee.Finish AS Occoneechee, 
Langhorne.Finish AS Langhorne, 
Hamburg.Finish AS Hamburg,
Martinsville.Finish AS Martinsville,
Heidelberg.Finish AS Heidelberg, 
[North Wilkesboro].Finish AS [North Wilkesboro],
ISNULL(CharlotteTop5,0) + ISNULL(DaytonaTop5,0) + ISNULL(OcconeecheeTop5,0) + ISNULL(LanghorneTop5,0) + ISNULL(HamburgTop5,0) + ISNULL(MartinsvilleTop5,0) + ISNULL(HeidelbergTop5,0) + ISNULL(NorthWilkesboroTop5,0) AS [Top 5s]
FROM [NASCAR_1949].[dbo].[view_Drivers] AS Drivers
LEFT JOIN [NASCAR_1949].[dbo].Charlotte AS Charlotte ON Charlotte.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Daytona AS Daytona ON Daytona.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Occoneechee AS Occoneechee ON Occoneechee.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Langhorne AS Langhorne ON Langhorne.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Hamburg AS Hamburg ON Hamburg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Martinsville AS Martinsville ON Martinsville.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Heidelberg AS Heidelberg ON Heidelberg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[North Wilkesboro] AS [North Wilkesboro] ON [North Wilkesboro].Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[Top5s] AS [Top5s] ON [Top5s].Driver = Drivers.Driver
ORDER BY [Top 5s] DESC, Driver