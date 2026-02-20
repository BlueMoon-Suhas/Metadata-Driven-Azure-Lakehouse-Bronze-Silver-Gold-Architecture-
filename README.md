# 🚀 Azure Lakehouse -- End-to-End Data Engineering Pipeline

## 📌 Project Overview

This project demonstrates the implementation of a modern Azure Lakehouse
architecture using a metadata-driven ingestion framework and layered
data design (Bronze--Silver--Gold).

### Technologies Used

-   Azure Data Factory (ADF)
-   Azure Data Lake Storage Gen2 (ADLS)
-   Azure Databricks (PySpark)
-   Azure Synapse Serverless SQL
-   SQL
-   JSON (metadata configuration)

------------------------------------------------------------------------

## 🏗 Architecture

GitHub (CSV Files) ↓ Azure Data Factory (Lookup + ForEach) ↓ ADLS Gen2
-- Bronze Layer (Raw Data) ↓ Azure Databricks (PySpark Transformations)
↓ ADLS Gen2 -- Silver Layer (Parquet) ↓ Azure Synapse Serverless SQL ↓
Gold Layer (External Tables & Views)

------------------------------------------------------------------------

## 🔄 Metadata-Driven Ingestion

Instead of hardcoding ingestion logic for each dataset, a JSON
configuration file dynamically drives ingestion.

Example:

{ "p_rel_url": "path_to_csv", "p_sink_folder": "target_folder",
"p_sink_file": "file_name.csv" }

ADF Pipeline Flow: - Lookup activity reads metadata - ForEach iterates
dynamically - Copy activity loads files into Bronze layer

------------------------------------------------------------------------

## 🥉 Bronze Layer

-   Raw CSV files stored in ADLS Gen2
-   Folder structure created dynamically
-   No transformations applied

------------------------------------------------------------------------

## 🥈 Silver Layer

Transformations performed using PySpark in Databricks:

-   Schema inference
-   Column standardization
-   Data type casting
-   Derived columns (e.g., FullName using concat_ws)
-   CSV → Parquet conversion for performance optimization

Example:

df.write.mode("append").parquet("abfss://silver@`<storage_account>`{=html}.dfs.core.windows.net/AdventureWorks_Sales")

Why Parquet? - Columnar storage - Faster analytical queries - Reduced
storage size

------------------------------------------------------------------------

## 🥇 Gold Layer

Using Azure Synapse Serverless SQL:

-   External data sources configured using Managed Identity
-   Database scoped credentials created
-   External tables built using CETAS
-   Analytical views created over Silver layer data

Example:

CREATE VIEW gold.calendar AS SELECT \* FROM OPENROWSET( BULK
'silver/AdventureWorks_Calendar/', DATA_SOURCE = source_silver, FORMAT =
'PARQUET' ) AS c;

------------------------------------------------------------------------

## 🔐 Security & Authentication

-   Managed Identity
-   Azure RBAC (Storage Blob Data Contributor)
-   Secure external data sources
-   No hardcoded secrets

------------------------------------------------------------------------

## 📂 Repository Structure

/Data → Source CSV files\
/adf_pipeline → ADF pipeline definitions\
/databricks_notebook → Silver layer transformation logic\
/sql_scripts → Gold layer external tables & views

------------------------------------------------------------------------

## 🧠 Key Concepts Demonstrated

-   Metadata-driven ingestion
-   Dynamic ADF pipelines
-   Bronze--Silver--Gold architecture
-   PySpark transformations
-   Parquet optimization
-   Serverless SQL querying
-   Managed identity authentication
-   CETAS (Create External Table As Select)

------------------------------------------------------------------------

## 🚀 Future Enhancements

-   Incremental ingestion using watermark logic
-   Partitioned Parquet storage
-   Delta Lake implementation
-   Monitoring & logging framework
-   CI/CD automation

------------------------------------------------------------------------

## 🎯 Project Outcome

This project demonstrates the ability to design and implement a
scalable, secure, cloud-native data engineering pipeline using modern
Azure services and Lakehouse architecture principles.
