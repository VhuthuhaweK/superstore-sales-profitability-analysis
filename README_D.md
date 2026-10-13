# Superstore Sales & Profitability Analysis

**Project type:** End-to-end data analytics capstone  
**Programme:** NexAfrica Data Analyst Internship  
**Author:** Vhuthuhawe Khorombi

## Project overview

This project analyses a Superstore retail dataset to understand sales and profitability across product categories, sub-categories, discount levels and regions. The workflow covers data cleaning, exploratory data analysis (EDA), SQL-based business questions, Power BI dashboard reporting and business recommendations.

## Business problem

The business needs to understand how sales, discounts, product categories and regional performance relate to profitability so it can identify areas for further investigation and make better-informed decisions.

## Objectives

- Validate and prepare the dataset for analysis.
- Calculate core KPIs such as sales, profit, quantity and profit margin.
- Compare performance across categories, sub-categories and regions.
- Identify products and discount bands associated with negative profit.
- Communicate findings through a dashboard and actionable recommendations.

## Dataset and data quality

- **Records:** 9,994 rows
- **Columns:** 21
- **Missing values after cleaning:** 0
- **Duplicate rows after cleaning:** 0

The analysis uses the cleaned dataset produced during the project. Check the data source and any usage restrictions before publishing the raw dataset publicly.

## Tools used

- **Python and pandas** — data inspection, cleaning, aggregation and EDA
- **Jupyter Notebook** — reproducible analysis
- **SQL / SQLite** — structured business queries
- **Power BI** — interactive dashboard and KPI visualisation
- **Microsoft Word and PowerPoint** — final report and presentation

## Key findings

- **Total sales:** approximately **$2.30 million**
- **Total profit:** approximately **$286.40 thousand**
- **Quantity sold:** **37,873**
- **Overall profit margin:** approximately **12.47%**
- **Technology** had the highest category profit margin at approximately **17.40%**.
- **Furniture** had a much lower category profit margin of approximately **2.49%**.
- **Tables** recorded approximately **-$17,725.48** in total profit.
- The **Central** region had the lowest regional profit margin in the analysis at approximately **7.92%**.
- Discount bands of 30% and above showed negative aggregate profit in this dataset.

> **Interpretation note:** These are descriptive findings. The dataset alone does not establish that discounts caused losses or explain the underlying reasons for low profitability. Further investigation is needed before making operational changes.

## Recommendations

1. Investigate Furniture profitability by product, sub-category, pricing, costs and discount level.
2. Review loss-making Tables products and validate cost, pricing, returns and discount information.
3. Analyse discount performance while accounting for product and regional differences.
4. Drill into the Central region to identify the categories and products contributing to its lower margin.
5. Track sales, profit, margin and loss-making products regularly in Power BI.

## Project structure

Suggested repository structure:

```text
superstore-sales-profitability-analysis/
├── data/
│   ├── raw/                 # Include only if sharing is permitted
│   └── cleaned/
├── notebooks/
│   ├── week1_data_cleaning
│   └── week2_eda
├── sql/
│   ├── Superstore_Database_Schema.sql
│   └── Superstore_SQL_Analysis.sql
├── powerbi/
│   └── DashBoard_Superstore.pbix
├── reports/
│   ├── Week_1_Data_Cleaning_Report.pdf
│   ├── Data_Visualizations.pdf
│   ├── Summary_Report.docx
│   └── Week_5_Final_Superstore_Business_Analysis_Report.docx
├── presentation/
│   └── Week_5_Superstore_Capstone_Presentation.pptx
└── README.md
```

Adjust filenames and folders to match the files actually committed to the repository. Do not commit temporary databases, duplicate datasets, personal information, or files you do not have permission to publish.

## How to reproduce the analysis

1. Download or place the permitted source dataset in the `data/raw/` folder.
2. Run the data-cleaning notebook or script.
3. Review the cleaned dataset and the EDA notebook.
4. Create or open the SQLite database, then run the SQL schema and analysis scripts in the documented order.
5. Open the Power BI file in a compatible Power BI Desktop version and refresh the data source if necessary.
6. Compare dashboard KPIs with the Python and SQL results before sharing.

Exact setup steps may depend on your local file paths and installed software versions.

## Limitations

- The dataset is historical and may not include all costs or business context needed to explain profit outcomes.
- Relationships between discounts and profit are descriptive, not proof of causation.
- Findings should be validated against the dashboard and SQL outputs before business decisions are made.

## Deliverables

- Cleaned dataset and data-cleaning documentation
- Python/Jupyter analysis and EDA
- SQL schema and business-query scripts
- Power BI dashboard
- Final business analysis report
- Capstone presentation

## Contact

**Vhuthuhawe Khorombi**  
Vhuthuhawejojos@gmail.com
