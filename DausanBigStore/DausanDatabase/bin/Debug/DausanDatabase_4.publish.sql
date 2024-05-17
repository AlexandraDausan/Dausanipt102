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
	DELETE FROM [dbo].[Product] WHERE [ProductCode] = @ProductCode;
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
PRINT N'Update complete.';


GO
