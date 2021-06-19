DECLARE @jsonZ NVARCHAR(MAX);
SET @jsonZ = N'{
                "time":{
                    "updated":"Jun 19, 2021 16:28:00 UTC",
                    "updatedISO":"2021-06-19T16:28:00+00:00",
                    "updateduk":"Jun 19, 2021 at 17:28 BST"
                },
                "disclaimer":"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
                "chartName":"Bitcoin",
                "bpi":{
                    "USD":{
                        "code":"USD",
                        "symbol":"&#36;",
                        "rate":"35,879.3787",
                        "description":"United States Dollar",
                        "rate_float":35879.3787
                    },
                    "GBP":{
                        "code":"GBP",
                        "symbol":"&pound;",
                        "rate":"25,977.8901",
                        "description":"British Pound Sterling",
                        "rate_float":25977.8901
                    },
                    "EUR":{
                        "code":"EUR",
                        "symbol":"&euro;",
                        "rate":"30,241.3290",
                        "description":"Euro",
                        "rate_float":30241.329
                    }
                }
                }'
SELECT *
FROM OPENJSON(@jsonZ, '$')
WITH (
    btc_time     DATETIMEOFFSET '$.time.updatedISO',
    disclaimer   CHAR(1000)     '$.disclaimer',
    chartname    CHAR(20)       '$.chartName',
    bpi_usd_rate MONEY          '$.bpi.USD.rate',
    bpi_usd_desc CHAR(20)       '$.bpi.USD.description',
    bpi_gbp_rate MONEY          '$.bpi.GBP.rate',
    bpi_gbp_desc CHAR(20)       '$.bpi.GBP.description',
    bpi_eur_rate MONEY          '$.bpi.EUR.rate',
    bpi_eur_desc CHAR(20)       '$.bpi.EUR.description'
);