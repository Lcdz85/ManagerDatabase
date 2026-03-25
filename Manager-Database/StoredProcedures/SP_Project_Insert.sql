CREATE PROCEDURE [dbo].[SP_Project_Insert]
	@name VARCHAR(256),
	@description NVARCHAR(MAX),
	@employeeId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [Project]([Name],[Description],[EmployeeId])
		OUTPUT [inserted].[ProjectId]
		VALUES (@name, @description, @employeeId)
END
