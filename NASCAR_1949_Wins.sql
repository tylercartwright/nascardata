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
ISNULL(CharlotteWin,0) + ISNULL(DaytonaWin,0) + ISNULL(OcconeecheeWin,0) + ISNULL(LanghorneWin,0) + ISNULL(HamburgWin,0) + ISNULL(MartinsvilleWin,0) + ISNULL(HeidelbergWin,0) + ISNULL(NorthWilkesboroWin,0) AS Wins
FROM [NASCAR_1949].[dbo].[view_Drivers] AS Drivers
LEFT JOIN [NASCAR_1949].[dbo].Charlotte AS Charlotte ON Charlotte.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Daytona AS Daytona ON Daytona.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Occoneechee AS Occoneechee ON Occoneechee.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Langhorne AS Langhorne ON Langhorne.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Hamburg AS Hamburg ON Hamburg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Martinsville AS Martinsville ON Martinsville.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Heidelberg AS Heidelberg ON Heidelberg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[North Wilkesboro] AS [North Wilkesboro] ON [North Wilkesboro].Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[Wins] AS [Wins] ON [Wins].Driver = Drivers.Driver
ORDER BY [Wins] DESC, Driver