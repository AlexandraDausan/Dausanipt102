CREATE PROCEDURE [dbo].[DisplayProfile]
	@Id NVARCHAR(50)

AS
BEGIN

SELECT [Display].[Id] as Id,
[Display].[PName] as PName,
[Display].[BirthDate] as BirthDate,
[Display].[PAddress] as PAddress,
[Display].[ContactNumber] as ContactNumber,
[Display].[CivilStatus] as CivilStatus,
[Display].[Hobby] as Hobby



FROM [dbo].[Profile] as Display
WHERE  [Id] = @Id

END
