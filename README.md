# HR Dataset Data Analysis with MySQL and Power BI

## Overview

This project demonstrates how to perform data analysis on an HR dataset using MySQL for data manipulation and Power BI for visualization. The dataset contains HR-related information such as employee details, salaries, and performance ratings.

## Project Structure

- **data**: This directory contains the HR dataset in a CSV  format (`hr.csv`). You'll import this data into your MySQL server.

- **scripts**: This directory includes SQL scripts (`analysis_queries.sql`) that showcase data manipulation and cleaning.

- **reports**: In this directory, you'll find the Power BI report file (`hr_analysis.pbix`) for visualizing the HR dataset.

## Prerequisites

Before you begin, ensure you have the following software and tools installed:

1. **MySQL Server**: Install and configure a MySQL server to host the HR dataset.

2. **Power BI Desktop**: Download and install Power BI Desktop from the [official website](https://powerbi.microsoft.com/en-us/desktop/).

3. **MySQL Client**: You may need a MySQL client like MySQL Workbench or command-line tools to interact with the database.

## Setup

1. **Import HR Dataset**: Use the following steps to import the HR dataset into your MySQL database:
   
   - Open a MySQL client.
   - Create a new database (e.g., `hr_analysis`).
   - Execute the SQL script provided in `data/hr_dataset.sql` to create tables and insert data into the database.

2. **Data Analysis Queries**: To perform data manipulation and cleaning, execute the SQL script provided in `scripts/analysis_queries.sql`. This script includes SQL queries for common data analysis tasks.

3. **Power BI Visualization**:
   
   - Open Power BI Desktop.
   - Go to "File" > "Open" and select the `reports/hr_analysis.pbix` file.
   - Edit data source connections to match your MySQL database credentials.
   - Customize the visualizations and create your HR analysis reports and dashboards.

## Usage

You can use this project as a template for analyzing HR datasets in your own organization or adapt it for other data analysis projects. Modify the SQL queries and Power BI visualizations to suit your specific needs.

## Contributing

If you'd like to contribute to this project or have suggestions for improvements, please create a pull request or open an issue.

