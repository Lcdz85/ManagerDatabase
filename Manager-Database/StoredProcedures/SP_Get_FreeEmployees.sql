CREATE PROCEDURE [dbo].[SP_Get_FreeEmployees]
AS
BEGIN
	SELECT	[EmployeeId]
		FROM [Employee]

	EXCEPT

	SELECT [EmployeeId]
		FROM [TakePart]
		WHERE [EndDate] IS NULL
END
