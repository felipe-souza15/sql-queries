-- Prevents extra messages from being sent to the client
SET NOCOUNT ON; 

-- Declare variables
DECLARE @ref VARCHAR(6), @i INT, @A CHAR(2);
SET @i = 0;
SET @ref = CONVERT(VARCHAR(6), GETDATE(), 112); -- Get the current date in YYYYMM format

-- Create a temporary table to store the results
CREATE TABLE #F (
    REF VARCHAR(8), 
    FRNCOD VARCHAR(3), 
    EMPCOD VARCHAR(6), 
    VALOR MONEY, 
    RETENCAO MONEY, 
    CUSTO MONEY, 
    ROYALTY MONEY
);

-- Loop to process data for previous months until reaching January 2023
WHILE CONVERT(INT, @ref) > 202301
BEGIN
    -- If the current month is being processed and it's within the first 3 days, increment @i
    IF (@ref = CONVERT(VARCHAR(6), GETDATE(), 112) AND DAY(GETDATE()) < 3) 
        SET @i = @i + 1;

    -- Update @ref to the previous month
    SET @REF = CONVERT(VARCHAR(6), DATEADD(MONTH, -@i, GETDATE()), 112);
    SET @A = CONVERT(VARCHAR(2), @i);

    -- Dynamically execute an INSERT statement pulling data from PRE_FAT..fat table
    INSERT INTO #F
    EXEC (
        'SELECT 
            ''' + @ref + '01'' AS Referencia,  -- Create a reference column with YYYYMM01 format
            a.frnCod, 
            a.empCod, 
            a.fatVal, 
            a.fatvalret, 
            a.fatvalcusto, 
            a.fatvalroyalty
        FROM PRE_FAT..fat' + @ref + '01 AS a
        JOIN SPCB..Emp AS b ON a.empcod = b.empCod
        WHERE 
            a.fatval >= 15.01  -- Only include records with values above 15.01
            AND a.frnCod NOT IN (''020'', ''090'') -- Exclude specific franchise codes
            AND tipCod <> ''13''  -- Exclude transactions of type 13
            AND empCodTipo IS NULL  -- Exclude records where empCodTipo is NULL
            AND IdTipoContrato NOT IN (''7'', ''11'')' -- Exclude specific contract types
    );

    -- Increment counter to move to the next previous month
    SET @i = @i + 1;
END;

-- Aggregate results for reporting
SELECT 
    CONVERT(DATE, REF, 120) AS Referencia, -- Convert REF to a proper date format
    FRNCOD AS CodFranquia, 
    COUNT(EMPCOD) AS QtdClientes, -- Count the number of unique clients
    SUM(VALOR) AS Valor, 
    SUM(RETENCAO) AS Retencao, 
    SUM(CUSTO) AS Custo, 
    SUM(ROYALTY) AS Royalty
FROM #F
GROUP BY CONVERT(DATE, REF, 120), FRNCOD; -- Group data by reference date and franchise code

-- Drop the temporary table after use
DROP TABLE #F; 

-- Re-enable extra messages if needed
SET NOCOUNT OFF;
