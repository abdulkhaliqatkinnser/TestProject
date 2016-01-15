/*
Select distinct [type], type_desc from sys.objects order by [type]
('U','V','P','FN','IF')

*/

---- In 01, but not in 02
---		Procedures
Select [name], [type], type_desc From ADLWareCompany01Develop.sys.objects 
Where 
	type in ('P')
	And 
	[name] Not Like 'sp%diagram%'
Except
Select 
	[name], [type], type_desc From ADLWareCompany02Develop.sys.objects Where type in ('P')
Order By
[type],[name]

---- In 01, but not in 02
---		Procedures
---			Names have numbers in them
Select [name], [type], type_desc From ADLWareCompany01Develop.sys.objects 
Where 
	type in ('P')
	And [name] Not Like 'sp%diagram%'
	And PATINDEX('%[0-9]%', [name]) > 0
Except
Select 
	[name], [type], type_desc From ADLWareCompany02Develop.sys.objects Where type in ('P')
Order By
[type],[name]



Select * from sys.databases Where [name] like 'ADL%Develop'
Order By Name

Select * from sys.objects
Where type in ('U','V','P','FN','IF')


Use ADLMasterPD
go
Select
[type], count(name) as numrows
from sys.objects
Where type in ('U','V','P')
group by [type]
go
--P 	115
--U 	65

USE [ADLWareCompany01PDQA]
GO
Select
[type], count(name) as numrows
from sys.objects
Where type in ('U','V','P')
group by [type]
go
--P 	1201
--U 	200
--V 	5


