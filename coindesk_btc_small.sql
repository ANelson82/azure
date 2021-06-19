DECLARE @jsonX NVARCHAR(MAX);
SET @jsonX = N'{
                "rate":"35879.3787"
                }'

SELECT *
FROM OPENJSON(@jsonX, '$')
WITH (
    bpirate DECIMAL(10,5) '$.rate'
);