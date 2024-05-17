CREATE PROCEDURE [dbo].[DeleteProfile]
	@Id NVARCHAR(50)

AS
BEGIN 
DELETE FROM [dbo].[Profile]
WHERE [Id] = @Id;
END
