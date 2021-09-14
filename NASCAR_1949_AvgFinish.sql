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
ROUND((ISNULL(Charlotte, 0) + ISNULL(Daytona, 0) + ISNULL(Occoneechee, 0) + ISNULL(Langhorne, 0) + ISNULL(Hamburg, 0) + ISNULL(Martinsville, 0) + ISNULL(Heidelberg, 0) + ISNULL([North Wilkesboro], 0))/RaceCount.RacesRun,1,0) AS [Average Finish]
FROM [NASCAR_1949].[dbo].[view_Drivers] AS Drivers
LEFT JOIN [NASCAR_1949].[dbo].Charlotte AS Charlotte ON Charlotte.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Daytona AS Daytona ON Daytona.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Occoneechee AS Occoneechee ON Occoneechee.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Langhorne AS Langhorne ON Langhorne.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Hamburg AS Hamburg ON Hamburg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Martinsville AS Martinsville ON Martinsville.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Heidelberg AS Heidelberg ON Heidelberg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[North Wilkesboro] AS [North Wilkesboro] ON [North Wilkesboro].Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[RaceCount] AS [RaceCount] ON [RaceCount].Driver = Drivers.Driver
ORDER BY [Average Finish], Driver