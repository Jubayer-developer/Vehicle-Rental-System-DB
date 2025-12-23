Vehicle Rental System – SQL Queries

এই অ্যাসাইনমেন্টের মূল উদ্দেশ্য হলো একটি Vehicle Rental System-এর জন্য প্রয়োজনীয় SQL query লেখা।
এখানে ডাটাবেজের টেবিল তৈরি করা হয়নি, শুধুমাত্র নির্দিষ্ট ৪টি SQL query লেখা হয়েছে।

Query 1: Booking তথ্য সংগ্রহ
SELECT
b.booking_id,
u.name AS customer_name,
v.vehicle_name,
b.start_date,
b.end_date,
v.availability_status as status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;

এই query ব্যবহার করে booking-এর তথ্যের সাথে customer-এর নাম এবং vehicle-এর নাম একসাথে দেখানো হয়।
এখানে INNER JOIN ব্যবহার করা হয়েছে।

Query 2: কখনো বুক না হওয়া Vehicle

SELECT vehicle_id,vehicle_name AS name,vehicle_type AS type,model,registration_number,rental_price,availability_status AS status
FROM vehicles v
WHERE NOT EXISTS (
SELECT 1
FROM bookings b
WHERE b.vehicle_id = v.vehicle_id
);

এই query সব সেই vehicle গুলো বের করে যেগুলো কখনো কোনো booking-এ ব্যবহার হয়নি।
এখানে NOT EXISTS ব্যবহার করা হয়েছে।

Query 3: নির্দিষ্ট টাইপের Available Vehicle

SELECT vehicle_id,vehicle_name AS name,vehicle_type AS type,model,registration_number,rental_price,availability_status AS status
FROM vehicles
WHERE availability_status = 'available'
AND vehicle_type = 'car';

এই query একটি নির্দিষ্ট vehicle type অনুযায়ী বর্তমানে available থাকা vehicle গুলো বের করে।
এখানে WHERE clause ব্যবহার করা হয়েছে।

Query 4: একাধিক Booking থাকা Vehicle

SELECT v.vehicle_name,
COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_name
HAVING COUNT(b.booking_id) > 2;

এই query প্রতিটি vehicle-এর মোট booking সংখ্যা গণনা করে এবং যেসব vehicle-এর booking সংখ্যা ২টির বেশি, শুধুমাত্র সেগুলো দেখায়।
এখানে GROUP BY, COUNT এবং HAVING ব্যবহার করা হয়েছে।

এই query গুলো relational database, filtering এবং aggregation সম্পর্কে ধারণা যাচাই করার জন্য লেখা হয়েছে।
