CREATE PROCEDURE [dbo].[UpdateProfile]
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

UPDATE [dbo].[Profile]
SET [Id] = @Id,
[PName] = @PName,
[BirthDate] = @BirthDate,
[PAddress] = @PAddress,
[ContactNumber] = @ContactNumber,
[CivilStatus] = @CivilStatus,
[Hobby] = @Hobby


END