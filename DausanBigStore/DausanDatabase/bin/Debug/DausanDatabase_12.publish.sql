﻿/*
Deployment script for DausanDatabase

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DausanDatabase"
:setvar DefaultFilePrefix "DausanDatabase"
:setvar DefaultDataPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key f1de29fa-4d81-4c9d-9ce3-2cd57ab01835, bb70cd5c-ccd1-4c25-a157-04216f677566 is skipped, element [dbo].[Product].[Id] (SqlSimpleColumn) will not be renamed to ProductCode';


GO
PRINT N'Rename refactoring operation with key a620b5b0-1f71-49c1-9993-f4f5e77dbe3e is skipped, element [dbo].[accounts].[Id] (SqlSimpleColumn) will not be renamed to accountId';


GO
PRINT N'Rename refactoring operation with key 61206a1b-e9b0-456e-8a09-71ea8ecae4cb is skipped, element [dbo].[accounts].[userName] (SqlSimpleColumn) will not be renamed to username';


GO
PRINT N'Creating Table [dbo].[Product]...';


GO
CREATE TABLE [dbo].[Product] (
    [ProductCode]  NVARCHAR (50) NOT NULL,
    [ProductName]  NVARCHAR (50) NULL,
    [ProductPrice] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ProductCode] ASC)
);


GO
PRINT N'Creating Procedure [dbo].[Create]...';


GO
CREATE PROCEDURE [dbo].[Create]
	@username varchar(50),
	@password varchar(50)
AS
BEGIN 
INSERT INTO [dbo].[accounts](username, password)
VALUES (@username, @password);

END;
GO
PRINT N'Creating Procedure [dbo].[createProduct]...';


GO
CREATE PROCEDURE [dbo].[createProduct]
	@ProductCode VARCHAR(50),
	@ProductName VARCHAR(50),
	@ProductPrice VARCHAR(50)
AS
	BEGIN
	INSERT INTO [dbo].[Product](ProductCode, ProductName, ProductPrice) VALUES(@ProductCode ,@ProductName ,@ProductPrice);
	END;
GO
PRINT N'Creating Procedure [dbo].[delete]...';


GO
CREATE PROCEDURE [dbo].[delete]
	@ProductCode VARCHAR(50)
AS
	BEGIN
	DELETE FROM [dbo].[Product] WHERE [ProductCode] = @ProductCode
	END;
GO
PRINT N'Creating Procedure [dbo].[displayProduct]...';


GO
CREATE PROCEDURE [dbo].[displayProduct]
	
AS
BEGIN
	Select [ProductCode] as ProductCode, [ProductName] as ProductName, [ProductPrice] as ProductPrice from [dbo].[Product]
END;
GO
PRINT N'Creating Procedure [dbo].[findProductById]...';


GO
CREATE PROCEDURE [dbo].[findProductById]
	@ProductCode VARCHAR(50)
AS
BEGIN
	Select [ProductCode] as ProductCode, [ProductName] as ProductName, [ProductPrice] as ProductPrice from [dbo].[Product] where [ProductCode] = @ProductCode
	END;
GO
PRINT N'Creating Procedure [dbo].[Login]...';


GO
CREATE PROCEDURE [dbo].[Login]
	@username NVARCHAR(50),
    @password NVARCHAR(50)
AS
	BEGIN
    SELECT [D].[username] AS username, [D].[password] AS password
    FROM [dbo].[accounts] AS D
    WHERE [D].[username] = @username AND [D].[password] = @password
END;
GO
PRINT N'Creating Procedure [dbo].[update]...';


GO
CREATE PROCEDURE [dbo].[update]
	@ProductCode VARCHAR(50),
	@ProductName VARCHAR(50),
	@ProductPrice VARCHAR(50)
AS
	BEGIN
	Update [dbo].[Product] set [ProductName] = @ProductName, [ProductPrice] = @ProductPrice Where [ProductCode] = @ProductCode
	END;
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f1de29fa-4d81-4c9d-9ce3-2cd57ab01835')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f1de29fa-4d81-4c9d-9ce3-2cd57ab01835')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bb70cd5c-ccd1-4c25-a157-04216f677566')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bb70cd5c-ccd1-4c25-a157-04216f677566')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a620b5b0-1f71-49c1-9993-f4f5e77dbe3e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a620b5b0-1f71-49c1-9993-f4f5e77dbe3e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '61206a1b-e9b0-456e-8a09-71ea8ecae4cb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('61206a1b-e9b0-456e-8a09-71ea8ecae4cb')

GO

GO
PRINT N'Update complete.';


GO