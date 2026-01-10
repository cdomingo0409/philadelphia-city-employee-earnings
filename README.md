💡 Tip: Read this section first for an overview of the project, questions, and key insights. **In Progress**

## 📊Philadelphia City Employee Earnings Analysis

Overview:

Analyze publicly available data on the City of Philadelphia employee earnings. The gial is to explore compensation trends, department-level spending, and workforce distribution

**Key Feartures:**
- Comprehensive workfoce coverage
- Department level payroll analysis
- Job title & role insights
- Earnings distribution analysis
- Overtime & additional earnings indicators (if applicable)
- Public sector compensation trends
- Real world governement data use case

**Tools Used:**
- PostgreSQL
- SQLiteStudio
- SQL
- Tableau


**📊 Key Business Question: How is quarter-to-date (QTD) employee compensation distributed across the City of Philadelphia departments?**

Quarter-to-date (QTD) employee compensation was analyzed by aggregating base pay, overtime, longevity pay, and post-separation payments at the department level. Since the data is reported as QTD, the results reflect payroll activity at this point in the quarter rather than annual salary totals. Missing values were treated as zero to ensure accurate comparisons.

Key Insights:

Compensation spending is concentrated in public safety departments, particularly Police, Fire, and Prisons. These departments show much higher overtime usage compared to administrative departments, which rely mostly on base pay. WHile less common, post-separation payments can be noticeably impact quarterly totals for some departments.



**📊 Key Business Question: What is driving compensation within each department?**

Looked at QTD compensation by breaking payroll into base pay, overtime, longevity, and post separation payments at each department. This makes it easier to see not just how much each department costs, but what's actually driving these costs. Missing values were treated as zero so totals weren't understated.

Key Insights:
Most departments are primarily driven by base pay, but overtime pay plays a much larger role in public safety and operational departments like police and fire. Longevity and post separation pay are less common, but when present, they can noticeably increase QTD totals and should be considered separately from ongoing payroll costs.




**📊 Key Business Question: How reliant are departments on overtime?**

Overtime was analyzed as a percentage of total QTD compensation rather than looking at overtime dollars alone. This approach makes it easier to compare departments of different size and understand where overtime meaningfully contributes to overall payroll costs.

Key Insight:
Most departments rely primarily on base pay, but overtime makes up a significantly larger share of compensation in public safety and operational departments. This indicates that higher payroll costs in these areas are driven not only by staffing levels but also by increased overtime usage during the quarter.





**📊 Key Business Question: Are supplemental or one time payments impacting department compensation?**

Looked at longevity and post separation payments as percentage of total QTD compensation instead of dollars. This makes it easier to compare departments of different sizes and see where these types of payments actually move the needle on overall payroll totals.

Key Insights:
For most departments, compensation is still largely driven by base pay. That said, there are a few departments where longevity or post separation payments noticeably increase QTD totals for a given quarter, showing that some spikes in payroll are tied to one time or transitional payments rather than ongoing staffing costs.





** 📊 Key Business Question: How do compensation patterns change over time?**

Instead of treating this as a one time snapshot, I built the analysis so the same department and pay breakdown views can be compared across different reporting periods (2019-2025). By filtering by year and quarter, it's easy to see whether changes in total compennsation are coming from base pay, overtime, or one tiome overtime payments like pose separation pay.

Key Insight:
Compensation patterns aren't consistent yet every quarter, some departments stay mostly base pay driven, while others shift depending on overtime needs or one time payments. Using the perion filter makes those changes easy to spot without mixing quarters together or impying annual totals.


**📊 Philadelphia Employee Compensation QTD Analysis Dashboard** 

Analyzed the City of Philadelphia employee compensation data to better understand how payroll spending is distributed across departments and what factors drive overall compensation. SQL was used to perform the analysis and the results were visualized through an interactive Tableau dashboard.

Key Features:
- Analyzed total QTD compensation by department
- Broke compensation into base pay, overtime, longevity, and post separation pay
- Examined overtime as share of total compensation across deparments
- Identified departments more impacted by supplemental or one time payments
- Reviewed compensation trends across reporting from 2019 to 2025

Tools Used:
- SQL (SQLite)
- Tableau

Dashboard Preview:

![Employee Earnings Dashboard](City of Philadelphia Employee Compensation Dashboard.png)

Live Dashboard (Tableau Public):
👉https://public.tableau.com/views/CityofPhiladelphiaEmployeeCompensation-QTDAnalysis/CityofPhiladelphiaEmployeeCompensation-QTDAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

















