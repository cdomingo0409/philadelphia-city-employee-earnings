/* ============================================================
   Department Level QTD Compensation Summary
   Business Question:
   How is quarter-to-date (QTD) employee compensation distributed
   across the City of Philadelphia departments?
   ============================================================ */

/*


Purpose:

To look at how employee compenssation is spread across city departments including base pay, overtime,  longevity pay, and post separation payments.


Why this approach:
- The data is reported as quarter-to-be (QTD), aggregating by department provides a clear snapshot of payroll activity at this point in the quarter.
- Breaking coompensation into indvidual components makes it easier to see how departments differ in overtime use, longevity pay, and separation-related costs.
- COALESCE is used to treat missing values as zero and avoid skewing totals.

Design Choices:
- Compensation types are summed separately to highlight differences in how departments structure pay.
- Departments are ordered by total QTD compensation to quickly identify where most payroll spending occurs.
= Results reflect payroll activity as of the data extract date and should not be interpreted as annual salary totals.

*/


SELECT department_name,
ROUND(SUM(base_salary),2) AS base_qtd_total,
ROUND(SUM(COALESCE(overtime_gross_pay_qtd,0)),2) AS overtime_qtd_total,
ROUND(SUM(COALESCE(longevity_gross_pay_qtd,0)),2) AS longevity_qtd_total,
ROUND(SUM(COALESCE(post_separation_gross_pay_qtd,0)), 2) AS post_separation_qtd_total,
ROUND(SUM(base_gross_pay_qtd 
+ COALESCE(overtime_gross_pay_qtd,0)
+ COALESCE(longevity_gross_pay_qtd,0)
+ COALESCE(post_separation_gross_pay_qtd,0)), 2) AS total_comp_qtd
FROM employeeEarnings
GROUP BY department_name
ORDER BY total_comp_qtd DESC;





/* ============================================================
   DEPARTMENT COMPENSATION DRIVERS (QTD)
   Business Question:
   What is driving quarter-to-date (QTD) compensation within each
   City of Philadelphia department?
   ============================================================ */
/*


Purpose:

This query breaks down QTD employee compensation by department to understand which pay components contribute most to overall payroll costs.


Why this approach:
- Compensation is reported as QTD, so aggregating by department provide a consistent look for a given reporting period.
- Separating base pay, overtime, longevity, and post separation pay makes it easiery to identify departments that rely heavily on overtime or one time payments.
- COALESCE is used to treat missing values as zero so totals are not undestated.

Design Choices:
- Grouped at the department level to match how city payroll spending is typically reviewed.
- Can be filtered by calendar year and quarter for period comparison.
- Results are ordered by total QTD compensation to highlight the largest payroll cost drivers.
*/


SELECT department_name,
ROUND(SUM(base_gross_pay_qtd),2) AS base_qtd,
ROUND(SUM(overtime_gross_pay_qtd),2) AS overtime_qtd,
ROUND(SUM(longevity_gross_pay_qtd),2) AS longevity_qtd,
ROUND(SUM(post_separation_gross_pay_qtd),2) AS post_separation_qtd,
ROUND(SUM(base_gross_pay_qtd
+ COALESCE (overtime_gross_pay_qtd, 0)
+ COALESCE (longevity_gross_pay_qtd, 0)
+ COALESCE (post_separation_gross_pay_qtd, 0)
), 2) AS total_qtd_compensation
FROM employeeEarnings

-- filter that is locked to a single reporting period, can be added and modified if wanted
-- WHERE calendar_year = 2023
--  AND quarter = 1

GROUP BY department_name
ORDER BY total_qtd_compensation DESC;
