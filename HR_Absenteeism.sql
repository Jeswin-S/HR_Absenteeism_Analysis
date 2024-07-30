Create database Work

select *from Absenteeism_at_work
select *from compensation
select*from Reasons

--Create a join table

select * from Absenteeism_at_work a
left Join compensation b on a.ID = b.ID 
left join Reasons r on a.Reason_for_absence = r.Number;

--Find the Healthiest

Select*from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index <25 and 
Absenteeism_time_in_hours <(select avg(Absenteeism_time_in_hours) from Absenteeism_at_work)

--Compensation rate increase for non-smokers / budget 9,83,221 so .68 increase per hour / $1,414.4 per year

select count(social_smoker) as Nonsmokers from Absenteeism_at_work
where Social_smoker= 0

--optimize this Query, To filter required columns

select 
a.ID,
r.Reason,
a.Month_of_absence,
a.Body_mass_index,
CASE WHEN Body_mass_index <18.5 THEN 'Underweight'
     WHEN Body_mass_index between 18.5 and 25 THEN 'Healthyweight'
	 WHEN Body_mass_index between 25 and 30 THEN 'Overweight'
	 WHEN Body_mass_index >30 THEN 'Obese'
	 Else 'Unkown' end as BMI_Category,
Case when Month_of_absence in (12,1,2) then 'Winter'
     when Month_of_absence in (3,4,5) then 'Spring'
	 when Month_of_absence in (6,7,8) then 'Summer'
	 when Month_of_absence in (9,10,11) then 'Fall'
	 Else 'Unkown' END as Seasons_names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left Join compensation b on a.ID = b.ID 
left join Reasons r on a.Reason_for_absence = r.Number;