--G3_23BAI70156_GAURAV MONGA_SESSION1
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN
    (
        --Write your T-SQL query here
        SELECT DISTINCT
               (Salary) AS getNthHighestSalary
        FROM Employee e1
        WHERE @N - 1 =
        (
            SELECT COUNT(DISTINCT salary)
            FROM employee e2
            WHERE e2.salary > e1.salary
        )
    );
END