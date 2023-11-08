create database Bank_Analytics;
Use Bank_Analytics;
Select * from finance_1;
Select * from finance_02;

###---------KPI 1 (Year wise loan amount Stats)-------#######
Select concat("20",substring(issue_d,5)) as Years,sum(loan_amnt) as Total_Loan_amount from finance_1 group by Years;
select * from finance_1;

describe finance_1 ;

#alter table finance_1 modify issue_d varchar(255);
#update finance_1 set issue_d = str_to_date(issue_d,'%Y-%m-%d');
set sql_safe_updates = 0;


####-------KPI 2 (Grade and sub grade wise revol_bal)------#####
select grade,sub_grade,sum(revol_bal) AS Total_Revol_bal  from finance_1 as f1 left join finance_02 as f2 on f1.id=f2.id
group by grade,sub_grade
order by  grade;


####-------KPI 3 (Total Payment for Verified Status Vs Total Payment for Non Verified Status)--------#####
select verification_status,Sum(total_pymnt)Total_Payment
from finance_1 as f1 left join finance_02 as f2 on f1.id=f2.id
group by verification_status;

####-------KPI 4 State wise and last_credit_pull_d wise loan status-----------------######
 select addr_state,last_credit_pull_d,
 case
 when loan_status = "Charged Off" then count(loan_status = "Charged Off")
 end as Charged_Off,
 case
 when loan_status = "Fully Paid" then count(loan_status = "Fully Paid")
 end as Fully_Paid
 from finance_1 f1 join finance_02 f2 on f1.id = f2.id  
 group by addr_state,last_credit_pull_d,loan_status;
 
  ####-------KPI 5 Home ownership Vs last payment date stats----------------------######
 Select home_ownership,last_pymnt_d from finance_1 join finance_02;
 
 Select * from finance_02;
 desc finance_02; 
 




 




