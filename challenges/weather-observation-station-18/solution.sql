/*
    Manhattan Distance:
    a distância entre dois pontos somando os deslocamentos horizontal e vertical.

    Fórmula:
    |x1 - x2| + |y1 - y2|

    Exemplo:
    P1 = (1, 2)
    P2 = (4, 6)

    Passo 1: diferença no eixo X
    |1 - 4| = 3

    Passo 2: diferença no eixo Y
    |2 - 6| = 4

    Passo 3: somar
    3 + 4 = 7
*/

SET NOCOUNT ON;

SELECT 
    CAST(
        ABS((MIN(LAT_N) - MAX(LAT_N))) + 
        ABS((MIN(LONG_W) - MAX(LONG_W)))
        AS DECIMAL(10,4)
    )
FROM
    STATION;

go