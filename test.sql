-- Đưa ra thông tin cần thiết
select location,date,total_cases,new_cases,total_deaths,population 
from CovidDeaths
where total_cases is not null
and year(date) = 2024
and location like '%Viet%'
order by 1,2

-- Tỷ lệ người chết số với tổng ca bệnh
select location,date,total_cases,total_deaths,
(total_deaths*1.0/total_cases)*100 as DeathPercencage
from CovidDeaths
where total_cases is not null and total_deaths is not null
and year(date) = 2024
and location like '%Viet%'
order by 1,2

-- Tỷ lệ lây nhiễm với dân số
select location,date,total_cases,population,
(total_cases*1.0/population)*100 as CasePercencage
from CovidDeaths
where total_cases is not null
and year(date) = 2024
and location like '%Viet%'
order by 1,2
