/*Please add ; after each select statement*/
CREATE PROCEDURE giftPackaging()
BEGIN
    SELECT
        `package_type`,
        COUNT(*) AS `number`
    FROM (
        SELECT
            MIN(packages_vol.`volume`) AS `volume`
        FROM
            gifts
        JOIN 
        (
            SELECT
                `length` * `width` * `height` AS `volume`,
                packages.*
            FROM
                packages
        ) AS packages_vol ON(
            gifts.`length` <= packages_vol.`length`
            AND gifts.`height` <= packages_vol.`height`
            AND gifts.`width` <= packages_vol.`width`
        )
        GROUP BY
            gifts.`id`
    ) AS qry_result
    JOIN
        packages ON(
            qry_result.`volume` = packages.`length` * packages.`height` * packages.`width`
        )
    GROUP BY
        `package_type`
;
END