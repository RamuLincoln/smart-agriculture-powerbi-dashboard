CREATE OR REPLACE VIEW vw_agriculture_clean AS
SELECT
    crop_id,
    soil_type,
    seedling_stage,
    moi,
    temp,
    humidity,
    result,
    CASE
        WHEN result = 2 THEN 'Optimal'
        WHEN result = 1 THEN 'Moderate'
        ELSE 'Poor'
    END AS outcome
FROM agriculture_data;