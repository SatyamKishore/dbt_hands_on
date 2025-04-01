### DBT Project using DBT Core and SQL Server

---

### Pre-Req:
- GIT Installed
- VS Code Installed
- Python 3.10 Installed
- SQL Server Installed

---

### Steps to Setup DBT Core Locally:

#### 1. Create a Project in VS Code

#### 2. Setup a Virtual Environment (.venv)
Run the following command:
```sh
py -3.10 -m venv dbt-env
```

#### 3. Activate the Virtual Environment
```sh
dbt-env\Scripts\activate
```

If you encounter an error **"Microsoft execution policy"**, execute the following command and then try activating again:
```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 4. Install DBT Core and SQL Server Adapter
```sh
py -3.10 -m pip install dbt-core dbt-sqlserver
```

#### 5. Verify Compatibility
```sh
dbt --version
```

#### 6. Initiate a DBT Project
This command will create a DBT folder structure and connection `.yml` file:
```sh
dbt init test_dbt_project
```

Connection Profile for `test_dbt_project` is usually available in:
```sh
C:\Users\<username>\.dbt\profiles.yml
```

#### 7. Verify `profiles.yml` and Test the Connection
```sh
dbt debug
```

#### 8. Sample `profiles.yml` Configuration
```yaml
test_dbt_project:
  target: dev
  outputs:
    dev:
      type: sqlserver
      driver: 'ODBC Driver 18 for SQL Server'
      host: DESKTOP-ZF6791RG
      database: AdventureWorks
      schema: HumanResources
      windows_login: True
      trust_cert: True
      threads: 4
```

#### 9. Get Host Details from SQL Server Management Studio
Run the following SQL command:
```sql
USE AdventureWorks
GO
SELECT @@SERVERNAME
```

#### 10. To run dbt Model 
```sh
dbt run
dbt run --s customer_360 ## To run specific model
```

#### 11. To run data test defined on models.
Creare schema.yml file with the test you want to perfrom .
```yaml

version: 2

models:
  - name: customer_360
    description: "Running tests on dbt model"
    columns:
      - name: FullName
        description: "Employee Name"
        data_tests:
          - not_null
      - name: BusinessEntityID
        description: "The business entity ID"
        data_tests:
          - unique
          - not_null
      - name: Gender
        description: "Valid gender List"
        data_tests:
          - accepted_values:
              values: [M, F]
```
To run data tests
```sh
dbt test
```

#### 12. To generate documentation of dbt Model and view serv layer
```sh
dbt docs generate
dbt docs serve
```
---

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
