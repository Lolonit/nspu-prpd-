SELECT 
    *
FROM
    car
WHERE
    `release` > 2005 AND odometr > 100000
ORDER BY odometr;



SELECT o.FIO
FROM `owner` o
JOIN car c ON o.passport_owner = c.owner_passport_owner
GROUP BY o.FIO
HAVING COUNT(c.VIN) >= 2;


SELECT 
    ase.address
FROM
    autoservice AS ase
        JOIN
    mechanic AS m ON ase.id_service = m.autoservice_id_service
        JOIN
    remont AS r ON m.mechanic_id = r.mechanic_mechanic_id
WHERE
    r.car_VIN = '4T1BF1FK5HU252391';