CREATE OR REPLACE VIEW monthly_training_health_summary AS
SELECT
    month,
    training_type,
    SUM(trainings_per_day) AS trainings_count_per_day,

    -- Métricas de TRAINING
    SUM(total_km_distance) AS total_km_distance,
    AVG(avg_km_distance) AS avg_km_distance,
    SUM(total_kcal_active) AS total_kcal_active,
    AVG(avg_kcal_active) AS avg_kcal_active,
    SUM(total_kcal_total) AS total_kcal_total,
    AVG(avg_kcal_total) AS avg_kcal_total,
    SEC_TO_TIME(AVG(avg_pace_seconds)) AS avg_pace,
    SUM(total_training_steps) AS total_training_steps,
    AVG(avg_training_steps) AS avg_training_steps,
    AVG(avg_heart_rate) AS avg_heart_rate,

    -- Métricas de HEALTH
    SUM(total_health_calories) AS total_health_calories,
    SUM(total_health_steps) AS total_health_steps,
    SUM(total_health_distance) AS total_health_distance,
    AVG(avg_moviment) AS avg_moviment

FROM (
    SELECT
        DATE_FORMAT(h.date, '%Y-%m') AS month,
        tt.name AS training_type,
        DATE(h.date) AS training_day,
        COUNT(*) AS trainings_per_day,

        -- Métricas de TRAINING
        SUM(t.km_distance) AS total_km_distance,
        AVG(t.km_distance) AS avg_km_distance,
        SUM(t.kcal_active) AS total_kcal_active,
        AVG(t.kcal_active) AS avg_kcal_active,
        SUM(t.kcal_total) AS total_kcal_total,
        AVG(t.kcal_total) AS avg_kcal_total,
        AVG(TIME_TO_SEC(t.pace)) AS avg_pace_seconds,
        SUM(t.steps) AS total_training_steps,
        AVG(t.steps) AS avg_training_steps,
        AVG(t.heart_rate_AVG) AS avg_heart_rate,

        -- Métricas de HEALTH
        SUM(h.calories) AS total_health_calories,
        SUM(h.steps) AS total_health_steps,
        SUM(h.distance) AS total_health_distance,
        AVG(h.moviment) AS avg_moviment

    FROM training t
    JOIN health h ON t.id_health = h.id
    JOIN type_training tt ON t.id_type_training = tt.id
    WHERE h.in_training = '1'
    GROUP BY month, training_type, training_day
) AS daily_summary
GROUP BY month, training_type
ORDER BY month, training_type;
