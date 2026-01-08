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



**📊 Key Business Question: What is driving compensation within each department?**

QTD compensation was analyzed by breaking payroll into base pay, overtime, longevity, and post separation payments at the department level. This makes it easier to see not just how much each department costs, but what's actually driving those costs. Missing values were treated as zero so totals weren't understated.

Key Insights:

Most departments are primarily driven by base pay, but overtime plays a much larger role in public safety and operational departments such as polic and fire. Longevity and post separation pay are less common overall, but when present, they can noticeably increase QTD totals and should be considered separately from ongoing payroll costs.
