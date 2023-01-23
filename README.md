# Mulberry


## Brief Introduction

Have you Ever got 99+ Matches on Tinder?  
But Never ONE Single Date in Real Life?  
Don't Worry!  
Mulberry solves that by limiting the matches per day & recommending fun dating activities with coupons!  
More importantly, our App is Completely Free to users!!! No Membership Fee!!!  
  
Demo Video: https://www.youtube.com/watch?v=x0TZsKuVZlY  
Heroku App: https://mulberry.herokuapp.com/

## Development Team

| Role                      | Name               |
|---------------------------|--------------------|
| ***PM & Testing***        | Marcus Min         |
| ***Front End***           | Jack Wang          |
| ***Front End***           | Zhen Tao           |
| ***Back End***            | Hang Yuan          |


## Version Information

&nbsp;&nbsp;&nbsp;&nbsp;**v0.1** - 11/02/2022 - Basic App with MVP  
&nbsp;&nbsp;&nbsp;&nbsp;**v0.9** - 11/16/2022 - Major functionalities completed  
&nbsp;&nbsp;&nbsp;&nbsp;**v1.0** - 12/05/2022 - Most functionalities completed

## Guidance
### Local Environment Setup
1. git pull repo
2. bundle install --without production
3. **[OPTIONAL: create database]** rake db:migrate
4. **[OPTIONAL: import sample data]** rake db:seed
5. rails server -b 0.0.0.0 
6. open browser localhost:3000

> **For test:**  
> 1. `rake db:migrate RAILS_ENV=test`   
> 2. `rake cucumber`
> 3. `rake spec (or rspec or bundle exec autotest)`  
  
> **For deployment:**  
> 1. `heroku stack:set heroku-20`  
> 2. `bundle install --with production`
> 3. `git push heroku {*branchname*}:master`  
> 4. `heroku run rake db:migrate`  
> 5. `heroku run rake db:seed`  
> 6. `https://mulberry.herokuapp.com/`


>
> local sqlite database doesn't need credentials;  
> remote postgreSQL database credentials are already included in the config file  
> **no action is needed**
>
