CREATE PROCEDURE [dbo].[CreateProfile]
	@Id NVARCHAR(50), 
    @PName NVARCHAR(50),
    @BirthDate DateTime, 
    @PAddress NVARCHAR(50),
    @ContactNumber Int,
    @CivilStatus NVARCHAR(50),
    @Hobby NVARCHAR(50)



AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Profile] (Id, PName, BirthDate, PAddress, ContactNumber, CivilStatus, Hobby)
    VALUES (@Id, @PName, @BirthDate, @PAddress, @ContactNumber, @CivilStatus, @Hobby);

END