
-- Query 1: JOIN

SELECT  b.booking_id, u.name AS customer_name, v.vehicle_name,
    b.start_date,
    b.end_date,
     v.availability_status as status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;




--Query 2: EXISTS

SELECT vehicle_id,vehicle_name AS name,vehicle_type AS type,model,registration_number,rental_price,availability_status AS status
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);





--Query 3: WHERE
SELECT vehicle_id,vehicle_name AS name,vehicle_type AS type,model,registration_number,rental_price,availability_status AS status
FROM vehicles 
WHERE availability_status = 'available'
  AND  vehicle_type = 'car';




--Query 4: GROUP BY and HAVING
  SELECT v.vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY  v.vehicle_name
HAVING COUNT(b.booking_id) > 2;


