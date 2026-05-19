SELECT * FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health` LIMIT 10;

-- Hitung Total Jumlah Siswa
SELECT COUNT(*) FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;

-- Cek Missing value
SELECT
COUNTIF(age IS NULL) AS missing_age,
COUNTIF(gender IS NULL) AS missing_gender,
COUNTIF(daily_social_media_hours IS NULL) AS missing_daily_social_media_hours,
COUNTIF(screen_time_before_sleep IS NULL) AS missing_screen_time_before_sleep,
COUNTIF(physical_activity IS NULL) AS missing_physical_activity,
COUNTIF(stress_level IS NULL) AS missing_stress_level,
COUNTIF(anxiety_level IS NULL) AS missing_anxiety_level,
COUNTIF(addiction_level IS NULL) AS missing_addiction_level,
COUNTIF(depression_label IS NULL) AS missing_depression_label,
COUNTIF(academic_performance IS NULL) AS missing_academic_performance,
COUNTIF(sleep_hours IS NULL) AS missing_sleep_hours,
COUNTIF(social_interaction_level IS NULL) AS missing_social_interaction_level,
COUNTIF(platform_usage IS NULL) AS missing_platform_usage,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;


-- Cek duplicate
SELECT 
COUNT(*) AS total_rows,
COUNT(DISTINCT TO_JSON_STRING(t)) AS unique_rows
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health` AS t;




-- Hitung Jumlah Siswa Pria dan Wanita
SELECT 
COUNT(CASE WHEN gender = 'male' THEN 1 END) AS jumlah_pria,
COUNT(CASE WHEN gender = 'female' THEN 1 END) AS jumlah_wanita,
COUNT(*) AS total_keseluruhan
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;

-- Hitung rata-rata nilai akademik 
SELECT IFNULL(gender,'Total'), AVG(academic_performance) AS nilai_rata_rata
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY ROLLUP(gender);

-- Hitung rata-rata penggunaan sosial media per hari
SELECT IFNULL(gender,'Total'), AVG(daily_social_media_hours) AS rata_rata_penggunaan_sosial_media_per_hari,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY ROLLUP(gender);

-- Hitung rata-rata penggunaan sosial media sebelum tidur
SELECT IFNULL(gender,'Total'), AVG(screen_time_before_sleep) AS rata_rata_penggunaan_sosial_media_sebelum_tidur,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY ROLLUP(gender);

-- Hitung rata-rata aktivitas fisik
SELECT IFNULL(gender,'Total'), AVG(physical_activity) AS rata_rata_aktivitas_fisik,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY ROLLUP(gender);

-- Hitung rata-rata level stress
SELECT IFNULL(gender,'Total'), AVG(stress_level) AS rata_rata_level_stress,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY ROLLUP(gender);



-- Hitung korelasi 
-- 1 Durasi sosial media VS Kesehatan Mental
SELECT 
CORR(daily_social_media_hours, academic_performance) AS korelasi_social_media_academic,
CORR(daily_social_media_hours, depression_label) AS korelasi_social_media_depression,
CORR(daily_social_media_hours, addiction_level) AS korelasi_social_media_addiction,
CORR(daily_social_media_hours, stress_level) AS korelasi_social_media_stress,
CORR(daily_social_media_hours, anxiety_level) AS korelasi_social_media_anxiety,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;

-- 2 Pola Tidur VS Kesehatan Mental
SELECT
CORR(sleep_hours, stress_level) AS korelasi_tidur_stress,
CORR(sleep_hours, depression_label) AS korelasi_tidur_depression,
CORR(sleep_hours, addiction_level) AS korelasi_tidur_addiction,
CORR(sleep_hours,anxiety_level) AS korelasi_tidur_anxiety,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;

-- 3 Aktivitas Fisik VS Kesehatan Mental
SELECT
CORR(physical_activity, stress_level) AS korelasi_aktivitas_stress,
CORR(physical_activity, depression_label) AS korelasi_aktivitas_depression,
CORR(physical_activity, addiction_level) AS korelasi_aktivitas_addiction,
CORR(physical_activity,anxiety_level) AS korelasi_aktivitas_anxiety,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;

-- 4 Korelasi SCREEN TIME SEBELUM TIDUR VS KUALITAS TIDUR & MENTAL
SELECT
CORR(screen_time_before_sleep, stress_level) AS korelasi_tidur_stress,
CORR(screen_time_before_sleep, depression_label) AS korelasi_tidur_depression,
CORR(screen_time_before_sleep, addiction_level) AS korelasi_tidur_addiction,
CORR(screen_time_before_sleep,anxiety_level) AS korelasi_tidur_anxiety,
CORR(screen_time_before_sleep, sleep_hours) AS korelasi_tidur_sleep,
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`;


-- Platform yang paling sering digunakan
SELECT platform_usage, COUNT(*) AS jumlah_penggunaan
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY platform_usage
ORDER BY jumlah_penggunaan DESC;

SELECT age, AVG(daily_social_media_hours) AS avg_durasi_harian
FROM `screen-time-impact-analytics.screen_time_data.teen_mental_health`
GROUP BY age
ORDER BY avg_durasi_harian DESC;






