WITH SoilPerformance AS (
    SELECT
        crop_id,
        soil_type,
        ROW_NUMBER() OVER (
            PARTITION BY crop_id
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM agriculture_db.agriculture_data
    WHERE result = 1
    GROUP BY crop_id, soil_type
)
SELECT *
FROM SoilPerformance
WHERE rn = 1;