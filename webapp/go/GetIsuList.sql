SELECT
	`isu`.`id`,
    `IsuMaxTimestampList`.`jia_isu_uuid`,
    `isu`.`name`,
    `isu`.`character`,
	`isu_condition`.`condition`,
    `isu_condition`.`is_sitting`,
    `isu_condition`.`message`,
    `isu_condition`.`timestamp`
FROM
	`isu`,
    (
        SELECT
            `isu`.`jia_user_id`,
            `isu_condition`.`jia_isu_uuid`,
            MAX(`isu_condition`.`timestamp`) AS `max_timestamp`
        FROM
            `isu_condition`
        JOIN
            `isu`
        ON (
            `isu`.`jia_isu_uuid` = `isu_condition`.`jia_isu_uuid` AND
            `isu`.`jia_user_id` = ?
        )
        GROUP BY `isu`.`jia_user_id`, `jia_isu_uuid`
    ) AS `IsuMaxTimestampList`
LEFT JOIN
	`isu_condition`
ON (
    `isu_condition`.`jia_isu_uuid` = `IsuMaxTimestampList`.`jia_isu_uuid`
)
WHERE (
    `isu`.`jia_user_id` = ? AND
    `isu`.`jia_isu_uuid` = `IsuMaxTimestampList`.`jia_isu_uuid` AND
    `isu_condition`.`timestamp` = `IsuMaxTimestampList`.`max_timestamp`
)
ORDER BY `isu`.`id` DESC;
