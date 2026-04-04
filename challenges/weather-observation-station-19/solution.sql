/*
    A Euclidean Distance é a distância em linha reta entre dois pontos.
    É a menor distância possível entre um ponto e outro.

    Se temos dois pontos:
    P1(x1, y1)
    P2(x2, y2)

    A fórmula é:
    √((x2 - x1)² + (y2 - y1)²)

    Exemplo:
    P1 = (1, 2)
    P2 = (4, 6)

    Passo 1: diferença no eixo X
    4 - 1 = 3

    Passo 2: diferença no eixo Y
    6 - 2 = 4

    Passo 3: elevar ao quadrado
    3² = 9
    4² = 16

    Passo 4: somar
    9 + 16 = 25

    Passo 5: tirar a raiz
    √25 = 5
*/

SET NOCOUNT ON;

SELECT
    CAST(
        SQRT(
            ABS(
                POWER((MIN(LAT_N) - MAX(LAT_N)), 2)
            ) + 
            ABS(
                POWER((MIN(LONG_W) - MAX(LONG_W)), 2)
            )
        ) AS DECIMAL(10,4)
    )
FROM
    STATION;

go