DECLARE @json NVARCHAR(MAX);
SET @json = N'{
                "CUSTOMERS":
                        [
                            {
                            "CUSTOMER": {
                                "custid": 1,
                                "age": 25,
                                "name": "John Smith",
                                "demographics": {"hhi": ">100k", "education":  "college"}
                            }
                            },
                            {
                            "CUSTOMER": {
                                "custid": 2,
                                "age": 43,
                                "name": "Tom brady",
                                "demographics": {"hhi": ">500k", "education":  "college"},
                                "dob": "1977-08-03"
                            }
                            }
                        ]
                }'
SELECT *
FROM OPENJSON(@json, '$.CUSTOMERS')
WITH (
    id INT '$.CUSTOMER.custid',
    name NVARCHAR(50) '$.CUSTOMER.name',
    customer_age SMALLINT '$.CUSTOMER.age',
    hhi varchar(50) '$.CUSTOMER.demographics.hhi',
    dob date '$.CUSTOMER.dob'
);