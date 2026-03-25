CREATE PROCEDURE [dbo].[SP_Check_Employee_IsProjectManager]
    @employeeId UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        E.[IsProjectManager]
    FROM [Employee] E
    WHERE E.[EmployeeId] = @EmployeeId;
END;
