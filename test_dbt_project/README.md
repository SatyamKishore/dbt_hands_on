### DBT Project using DBT Core and SQL Server

### Pre-Req:
- GIT Installed
- VSC Code Installed
- Python 3.10 Installed
- SQL Server installed 

### Steps to Setup DBT Core Locally:

- _Create a Project in VSC_
<br>
- _Setup a .venv using command_ : 
```py -3.10 -m venv dbt-env ```
<br>  
- _Activate the env using command_ : 
```dbt-env\Scripts\activate```  
<br>
- If during activation , there is an error **" microsoft execution policy"** then execute below and then try to activate again !
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
<br>
- _Install dbt core and adapter_: 
```py -3.10 -m pip install dbt-core dbt-sqlserver```
<br>
- _Verify the compatibility with dbt-core and adapter_ 
```dbt --version```
<br>    
- _Initiate a DBT project and fill the details. It will create dbt folder structure and connection yml_ 
    ```dbt init test_dbt_project```   
    _Connection Profile for test_dbt_project usually available to your_ **C:\Users\<username>\.dbt\profiles.yml** . 
<br>    
- _Verify the profile.yml and test the connection using_
```dbt debug```
- _Here is the sample connection detail under profile.yml_
``` 
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
- You can get host details from SQL server managment studio by running below code

```
USE AdventureWorks
GO
SELECT @@SERVERNAME
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
