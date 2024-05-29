

DELIMITER $$

CREATE PROCEDURE `GetAllProducts`()
BEGIN
	/* Declaração de variaveis */
	DECLARE totalSale DEC(10,2) DEFAULT 0.0;
    DECLARE x,y, total, qtd INT DEFAULT 0;
    /*--------------------------*/
    
    /* Atribuição de valores */
    SET total = 10;
    
    /*Carregando valores de um select em uma variável */
    SELECT COUNT(*)
    INTO qtd
    FROM produto;
    
    SELECT qtd;
    
    SELECT * FROM PRODUTO;
    
END$$

DELIMITER ;


-----------------------------------------------

DELIMITER $$

CREATE PROCEDURE GetProductByTd(
    IN pProductId INT,
    OUT pPRODUCTLevel VARCHAR(20)
)
BEGIN
    
    DECLARE VALOR DECIMAL(10,2) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO VALOR 
    FROM PRODUTO AS P
    WHERE P.COD_PRDUTO = pProductId;
    
    IF (VALOR >=5 AND VALOR <= 10 ) THEN
         SET pProductLevel = 'CRITICO';
   ELSEIF( VALOR > 10 AND VALOR <= 20 ) THEN
         SET pProductLevel = 'PREOCUPANTE';
	ELSEIF( VALOR > 20) THEN
         SET pProductLevel = 'TA SUAVE';
	ELSE
         SET pProductLevel = 'FUJA';
	END IF;
         
END$$

DELIMITER ;

-----------------------------------------------------

CALL GetAllProducts();


CALL GetAllProductById(3, @level);
SELECT @level;

------------------------------------------------------

/* CRIANDO VIEW PERSONALIZADA */
CREATE VIEW DaysOfWeek AS
SELECT 'SEGUNDA-FEIRA'
UNION
SELECT 'TERÇA-FEIRA'
UNION
SELECT 'QUARTA-FEIRA'
UNION
SELECT 'QUINTA-FEIRA'
UNION
SELECT 'SEXTA-FEIRA'
UNION
SELECT 'SABADO'
UNION
SELECT 'DOMINGO'

------------------------------------------------------

SELECT * FROM daysofweek;

-------------------------------------------------------

CREATE VIEW QtdProdutos
AS
	SELECT * 
    FROM PRODUTO AS P
    WHERE P.COD_PRODUTO IN (1, 2, 3)

--------------------------------------------------------

SELECT *
FROM qtdprodutos

------------------------------------------------------

