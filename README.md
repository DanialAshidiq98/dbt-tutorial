Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


Run commands:

dbt run --select my_model                       # run my_model

dbt run --select my_model my_model_2            # run my_model and my_model_2

dbt run --select my_model+                      # run my_model and all children

dbt run --select +my_model                      # run my_model and all parents

dbt run --select +my_model+                     # run my_model, all of its parents, and all of its children

dbt run --select @my_model                      # run my_model, all parents, all children, AND all parents of all children

dbt run --select my_model+ --exclude my_model_2 # run my_model and all children EXCEPT my_model_2

dbt run --select my_model --target dev_l        # run my_model using a L warehouse (targets defined in profiles.yml

run all tests:
dbt test

## run tests for one_specific_model
dbt test --select one_specific_model
dbt test --select customers

## run tests tor all models in a subfolder (1.e. marts/core)
dbt test --select narts.core.e

## run tests tor all models in package
dbt test --select some_package.+
-- note: we do not currently have any packages installed that do have tests

## run only tests defined singularly
dbt test --select test_type:singular

## run only tests detined generically
dbt test --select test_type:generic

## run singular tests limited`to one_specific_nodel
dbt test --select one_specifici_model, test_type:singular
dbt test --select orders, test_type:singular

## run generic tests linited to one_specitic_nodel
dbt test --select one_specific_mdel, test_type:generic
dbt test --select customers, test_type:generic


## run only source tests
dbt test --select source:*

## run only tests on your dbt models
dbt test --exclude source:*

## run only source tests for a particular source and all its tables
dbt test --select source:jaffle_shop

## run only source tests for a particular source and only one table
dbt test --select source: jaffle_shop.orders

## store failures of your tests for easier debugging
dbt test --store-failures
dbt test -s orders --store-failures
test's results will always replace previous failures for the same test


## build test (if anything fails it will stop)
dbt build --fail-fast


## Method of testing:
dbt test -s source:*
dbt run
dbt test --exclude source:*



### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
