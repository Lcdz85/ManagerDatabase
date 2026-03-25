CREATE PROCEDURE [dbo].[SP_Post_Insert]
	@subject VARCHAR(256),
	@content NVARCHAR(MAX),
	@employeeId UNIQUEIDENTIFIER,
	@projectId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [Post]([Subject],[Content],[EmployeeId],[ProjectId])
		OUTPUT [inserted].[PostId]
		VALUES (@subject, @content, @employeeId, @projectId)
END
