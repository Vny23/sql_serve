/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE TrainingDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ProjectStatus')
BEGIN
CREATE TABLE [dbo].[ProjectStatus](
 [ProjectStatusId] [int] IDENTITY(1,1) NOT NULL,
 [Label] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectStatusId] PRIMARY KEY CLUSTERED 
(
 [ProjectStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
ELSE
BEGIN
    PRINT 'The table "ProjectStatus" already exists.'
END
GO
