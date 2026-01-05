```sql
/*
Show the total amount of male patients and the total amount of female patients in the patients table.  
Display the two results in the same row.
*/

SELECT 
  (SELECT count(*) FROM patients WHERE gender='M') AS male_count, 
  (SELECT count(*) FROM patients WHERE gender='F') AS female_count;
  
SELECT 
  SUM(Gender = 'M') as male_count, 
  SUM(Gender = 'F') AS female_count
FROM patients

select 
  sum(case when gender = 'M' then 1 end) as male_count,
  sum(case when gender = 'F' then 1 end) as female_count 
from patients;

```

```sql
/*
Show all columns for patient_id 542's most recent admission_date.
*/

select * 
from admissions
where patient_id = 542
order by admission_date desc
limit 1

SELECT *
FROM admissions
WHERE patient_id = 542
GROUP BY patient_id
HAVING
  admission_date = MAX(admission_date);
  
SELECT *
FROM admissions
GROUP BY patient_id
HAVING
  patient_id = 542
  AND max(admission_date)

```

```sql
/*
Show all allergies ordered by popularity. Remove NULL values from query.
*/
select allergies, count(allergies) as total_diagnosis
from patients
where allergies is not null
group by allergies
order by total_diagnosis desc
```

```sql
/*
Show the city and the total number of patients in the city.  
Order from most to least patients and then by city name ascending.
*/

select city, count(*) as num_patients
from patients
group by(city)
order by num_patients desc, city asc

```

```sql
/*
select province_id, sum(height) as sum_height
from patients
group by province_id
having sum_height >= 7000
*/

SELECT
  province_id,
  SUM(height) AS sum_height
FROM patients
GROUP BY province_id
HAVING sum_height >= 7000
```

```sql
/*
Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
*/

SELECT
  patient_id,
  diagnosis
FROM admissions
GROUP BY
  patient_id,
  diagnosis
HAVING COUNT(*) > 1;
```

```sql
/*
Show unique first names from the patients table which only occurs once in the list.  
  
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
*/

select first_name
from patients
group by first_name
having count(first_name) = 1
```

```sql
/*
Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
*/

select patient_id, first_name
from patients
where first_name like 's____%s' -- or first_name LIKE 's%s' and LEN(first_name) >= 6
```

```sql
/*
Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
*/
SELECT DISTINCT(city) AS unique_cities
FROM patients
WHERE province_id = 'NS';

SELECT city
FROM patients
GROUP BY city
HAVING province_id = 'NS';

select city
from patients
where province_id = 'NS'
group by city 
```

```sql
/*
Show first name and last name concatinated into one column to show their full name.
*/
SELECT
  CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;
```

```sql
/*
Show how many patients have a birth_date with 2010 as the birth year.
*/
SELECT COUNT(*) AS total_patients
FROM patients
WHERE YEAR(birth_date) = 2010;
```

```sql
/*
Show the first_name, last_name, and height of the patient with the greatest height.
*/

select first_name, last_name, height
from patients p 
where p.height = (
	select max(height)
  	from patients
)
```