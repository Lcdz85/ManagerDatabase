CREATE PROCEDURE [dbo].[SP_Check_EMployee_IsInProject]
    @employeeId UNIQUEIDENTIFIER,
    @projectId UNIQUEIDENTIFIER,
    @isInProject BIT OUTPUT
AS
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM [TakePart]
        WHERE [EmployeeId] = @EmployeeId
          AND [ProjectId] = @ProjectId
    )
        SET @isInProject = 1;
    ELSE
        SET @isInProject = 0;
END
