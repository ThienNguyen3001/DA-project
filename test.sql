-- Đưa ra thông tin cần thiết
select location,date,total_cases,new_cases,total_deaths,population 
from CovidDeaths
where year(date) > 2022
and continent is not null
and location like '%Viet%'
order by 1,2

-- Tỷ lệ người chết số với tổng ca bệnh
select Location,Date,Total_cases,Total_deaths,
(total_deaths*1.0/total_cases)*100 as DeathPercencage
from CovidDeaths
where year(date) > 2022
and continent is not null
and Location like '%Viet%'
order by 1,2

-- Tỷ lệ lây nhiễm với dân số
select Location,date,total_cases,Population,
(total_cases*1.0/population)*100 as CasePercencage
from CovidDeaths
where year(date) >2022
and continent is not null
and Location like '%Viet%'
order by 1,2

-- Tổng lây nhiễm cao nhất so với dân số của từng quốc gia
select Location,max(total_cases) HighestInfection,Population,
max((total_cases*1.0/population))*100 as PercentIfected
from CovidDeaths
where continent is not null
group by location,population
order by 4 desc

-- Tổng số người chết cao nhất mỗi quốc gia
select Location,max(total_deaths) HighestDeathsCount
from CovidDeaths
where continent is not null
group by location
order by 2 desc

-- Tổng số người chết cao nhất mỗi lục địa
select Continent,max(total_deaths) HighestDeathsCount
from CovidDeaths
where continent is not null
group by continent
order by 2 desc