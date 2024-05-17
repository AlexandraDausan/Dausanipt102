CREATE TABLE [dbo].[Profile]
(
	[Id] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    PName NVARCHAR(50) NULL, 
    [BirthDate] DATETIME NULL, 
    PAddress NVARCHAR(50) NULL, 
    [ContactNumber] INT NULL, 
    [CivilStatus] NVARCHAR(50) NULL, 
    [Hobby] NVARCHAR(50) NULL
)
