# Bolt home task: Analytics Engineer

## Getting started

The repository contains a dbt project & an ERM diagram as solution to part 1. Some scripts are commented for additional explanation or approaches.

All answers to the questions can be found within this README.md file further down.

## Part 1: Data model task

### Data model decision - Star Schema (Kimball)

Following the approach of schema on read to account for the main requirement "self-serve analytics" and at the same time considering the amount of data which we will collect until 2030. I calculated around 6 billion rows/orders which reflects an market share of 20% from 40mio trips by 2030 (incl market growth rate).
- Achieve highest consumability to not overwhelm business user...
    - little amount of tables in analytics layer or respective representation within looker
    - clear and consistent naming which aligns with the business
- Performance while reading the data...
    - joins are heavy to perform and with star schema we reduce the amount of joins to a minimum by enabling at the same time a high granularity


### Data model as ERM diagram

[ERM](images/part1_erm.png)

### Code repository

- [link to folder "dbt_project"](dbt_project)
- installed dbt core incl databricks connector
- contains of the following layers...
    - raw: source related, data ingestion by pipelines (SAP = ERP system, API for airplane model data), no scripts because data should be defined as source (tbc)
    - staging: source related, cleaned data, snake case column names, aligned data type applied, removed NULL values where reasonable
    - analytics: business related, prefix for dimensions (dim_) and fact tables (fact_), recognized 2 fact tables, joined dimensional data to reduce joins in looker
- testing via "models/schema.yml" for data consistency (not_null, unique)
- deployment including testing: Test the ingested data before run is deployed and only continue in case ingested data is consistent, test again after deployment

    ```dbt test dbt test --select tag:injected_data```

    ```dbt run```

    ```dbt test dbt test --select tag:transformed_data```

### OUTLOOK or what I would have done for production aka with more time

- run scripts to check for inconsistency and errors
- testing
    - testing before run is not implemented in a way it would work, solve with dbt cloud or own orchestration of dbt core
    - test source freshness of ingested data (raw data is missing ingestion timestamp which need to be added)
- Reducing latency for business user and keeping the business logic within the database (single source of truth) by adding data marts/aggregated tables to solve for KPIs like revenue, active customers etc. divided by dimensions like region, customer_group etc.. This will enable us to use smaller tables where no join needs to be executed via looker and many reports will be much quicker containing of those KPIs and still sliced by the most important dimensions.
- Improving updates by implementing incremental loads for fact tables (perhaps also dim tables) since a full load will be expensive in databricks and probably unnecessary slow considering the amount of data we will reach.
- Vision: Adding another data model (Data Vault) to account for more technical use cases like process mining, LLM



## Part 2: CI/CD task


