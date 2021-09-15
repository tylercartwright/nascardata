SELECT
Drivers.Driver,
Charlotte.Led AS Charlotte,
Daytona.Led AS Daytona,
Occoneechee.Led AS Occoneechee, 
Langhorne.Led AS Langhorne, 
Hamburg.Led AS Hamburg,
Martinsville.Led AS Martinsville,
Heidelberg.Led AS Heidelberg, 
[North Wilkesboro].Led AS [North Wilkesboro],
ISNULL(LapsLed.Charlotte,0) + ISNULL(LapsLed.Daytona,0) + ISNULL(LapsLed.Occoneechee,0) + ISNULL(LapsLed.Langhorne,0) + ISNULL(LapsLed.Hamburg,0) + ISNULL(LapsLed.Martinsville,0) + ISNULL(LapsLed.Heidelberg,0) + ISNULL(LapsLed.[North Wilkesboro],0) AS [Laps Led]
FROM [NASCAR_1949].[dbo].[view_Drivers] AS Drivers
LEFT JOIN [NASCAR_1949].[dbo].Charlotte AS Charlotte ON Charlotte.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Daytona AS Daytona ON Daytona.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Occoneechee AS Occoneechee ON Occoneechee.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Langhorne AS Langhorne ON Langhorne.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Hamburg AS Hamburg ON Hamburg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Martinsville AS Martinsville ON Martinsville.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].Heidelberg AS Heidelberg ON Heidelberg.Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[North Wilkesboro] AS [North Wilkesboro] ON [North Wilkesboro].Driver = Drivers.Driver
LEFT JOIN [NASCAR_1949].[dbo].[Laps_Led] AS [LapsLed] ON [LapsLed].Driver = Drivers.Driver
ORDER BY [Laps Led] DESC, Driver