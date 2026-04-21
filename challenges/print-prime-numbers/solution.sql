SET NOCOUNT ON;

DECLARE
    @IDX INT,
    @SQRT_INT_PART INT,
    @RESULT VARCHAR(MAX) = '';

DECLARE CUR CURSOR
FOR
WITH CTE_PRIME AS
(
    SELECT
        1000 AS N,
        1000 AS IDX
    UNION ALL
    SELECT
        N,
        IDX - 1
    FROM
        CTE_PRIME
    WHERE
        IDX > 1
),
CTE_SQUARE_ROOT AS
(
    SELECT
        IDX,
        SQRT(IDX) AS SQUARE_ROOT
    FROM
        CTE_PRIME
    WHERE
        IDX > 1
),
CTE_SQRT_INT_PART AS
(
    SELECT
        IDX,
        SQUARE_ROOT,
        CAST(SQUARE_ROOT AS INT) AS SQRT_INT_PART
    FROM
        CTE_SQUARE_ROOT
    WHERE
        IIF(FLOOR(SQUARE_ROOT) = SQUARE_ROOT, 1, 0) = 0
        AND IIF(IDX > 2, IDX % 2, 1) = 1
)
SELECT
    IDX,
    SQRT_INT_PART
FROM
    CTE_SQRT_INT_PART
ORDER BY
    IDX
OPTION
    (MAXRECURSION 0);

OPEN CUR;

FETCH NEXT FROM CUR INTO @IDX, @SQRT_INT_PART;

WHILE @@FETCH_STATUS = 0
BEGIN

    IF (@SQRT_INT_PART = 1)
    BEGIN
        SET @RESULT = @RESULT + CAST(@IDX AS VARCHAR) + '&';
    END
    ELSE
    BEGIN

            DECLARE @IS_NOT_A_PRIME INT = 0;
            
            WITH CTE_REC AS
            (
                SELECT
                    @SQRT_INT_PART AS N
                UNION ALL
                SELECT
                    N - 1
                FROM
                    CTE_REC
                WHERE
                    N > 2
            ),
            CTE_NOT_A_PRIME AS
            (
                SELECT
                    @IDX AS IDX,
                    N
                FROM
                    CTE_REC
                WHERE
                    IIF(FLOOR(@IDX / (N * 1.0)) = @IDX / (N * 1.0), 1, 0) = 1
            )    
            SELECT
                @IS_NOT_A_PRIME = 1
            FROM
                CTE_NOT_A_PRIME
            WHERE
                IDX = @IDX;

            IF (@IS_NOT_A_PRIME <> 1)
            BEGIN
                SET @RESULT = @RESULT + CAST(@IDX AS VARCHAR) + '&';
            END;

    END;

    FETCH NEXT FROM CUR INTO @IDX, @SQRT_INT_PART;

END;

CLOSE CUR;
DEALLOCATE CUR;

PRINT(SUBSTRING(@RESULT, 1, LEN(@RESULT)-1));

go

/*
    Your Output (stdout):
    2&3&5&7&11&13&17&19&23&29&31&37&41&43&47&53&59&61&67&71&73&79&83&89&97&101&103&107&109&113&127&131&137&139&149&151&157&163&167&173&179&181&191&193&197&199&211&223&227&229&233&239&241&251&257&263&269&271&277&281&283&293&307&311&313&317&331&337&347&349&353&359&367&373&379&383&389&397&401&409&419&421&431&433&439&443&449&457&461&463&467&479&487&491&499&503&509&521&523&541&547&557&563&569&571&577&587&593&599&601&607&613&617&619&631&641&643&647&653&659&661&673&677&683&691&701&709&719&727&733&739&743&751&757&761&769&773&787&797&809&811&821&823&827&829&839&853&857&859&863&877&881&883&887&907&911&919&929&937&941&947&953&967&971&977&983&991&997
*/