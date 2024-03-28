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

-- Tỷ lệ chết so với dân số thế giới
select sum(new_cases) as total_cases,sum(new_deaths) as total_deaths,
sum(new_deaths)*1.0/SUM(new_cases) *100 as DeathPercencage
from CovidDeaths
where continent is not null
order by 1,2

-- So sánh dân số thế giới với vaccine hiện có
select d.continent,d.location,d.population,v.new_vaccinations 
from CovidDeaths d
inner join CovidVaccinations v on d.location = v.location
and d.date = v.date
where d.continent is not null
and new_vaccinations is not null
order by 1,2