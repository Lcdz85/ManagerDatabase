CREATE TABLE [dbo].[Post]
(
	[PostId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), 
    [Subject] VARCHAR(256) NOT NULL, 
    [Content] NVARCHAR(MAX) NOT NULL, 
    [SendDate] DATETIME NOT NULL DEFAULT GETDATE(), 
    [EmployeeId] UNIQUEIDENTIFIER NOT NULL, 
    [ProjectId] UNIQUEIDENTIFIER NOT NULL, 
    CONSTRAINT [FK_Post_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId]), 
    CONSTRAINT [FK_Post_Project] FOREIGN KEY ([ProjectId]) REFERENCES [Project]([ProjectId])
)

GO

CREATE TRIGGER [dbo].[TR_IsInProjetct]
    ON [dbo].[Post]
    AFTER INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON
    END