# Mulberry

### [**Hi TAs!** _Please click me to see the guidance for grading_](#guidance-for-grading)


## Brief Introduction

Have you Ever got 99+ Matches on Tinder?  
But Never ONE Single Date in Real Life?  
Don't Worry!  
Mulberry solves that by limiting the matches per day & recommending fun dating activities with coupons!  
More importantly, our App is Completely Free to users!!! No Membership Fee!!!  
  
Video Link: https://www.youtube.com/watch?v=ceh8UM0KatE

## Development Team

|                           |                    |
|---------------------------|--------------------|
| ***PM & Testing***        | Marcus Min         |
| ***Front End***           | Jack Wang          |
| ***Front End***           | Zhen Tao           |
| ***Back End***            | Hang Yuan          |

&nbsp;&nbsp;&nbsp;&nbsp;*Names are ordered by last name alphabetically*

## Version Information

&nbsp;&nbsp;&nbsp;&nbsp;**v0.1** - 11/02/2022 - Basic App with MVP

## Guidance
### Environment Setup
1. git pull repo
2. bundle install --without production
3. **[OPTIONAL: create database]** rake db:migrate
4. **[OPTIONAL: import sample data]** rake db:seed
5. rails server -b 0.0.0.0 
6. open browser localhost:3000

> **For test:**  
> 1. `db:migrate RAILS_ENV=test`   
> 2. `rake spec (or rspec or bundle exec autotest)`  
> 3. `rake cucumber`
  
> **For deployment:**  
> 1. `heroku stack:set heroku-20`  
> 2. `bundle install --with production`
> 3. `git push heroku {*branchname*}:master`  
> 4. `heroku run rake db:migrate`  
> 5. `heroku run rake db:seed`  
> 6. `https://arcane-fortress-74887.herokuapp.com`

# Guidance for Grading
> **Running Environment**
> * **branch**: proj-iter-1  
> * **Ruby Version**: ruby 2.6.6p146  
> * **OS**: Mac, Ubuntu(20.04 LTS)  

> **Heroku Web Link**  
> [https://arcane-fortress-74887.herokuapp.com/](https://arcane-fortress-74887.herokuapp.com/)

> **Local APP Setup**
> 1. `bundle install --without production`
> 2. `bundle update` (if bundler prompted to do so)
> 3. `rake db:migrate`
> 4. `rake db:seed`
> 5. `rails server -b 0.0.0.0`
> 6. open browser with URL: `localhost:3000`
> > **For test coverage check**
> > 1. `rake db:migrate RAILS_ENV=test` (for testing env)
> > 2. `rake spec`
> > 3. `rake cucumber`
> > 4. open the `index.html` file under coverage folder

>   
> local sqlite database doesn't need credentials;  
> remote postgreSQL database credentials are already included in the config file  
> **no action is needed**


## Documentation

&nbsp;&nbsp;&nbsp;&nbsp;Please refer to [Confluence](https://marcus117.atlassian.net/wiki/spaces/MULBERRY/overview "Mulberry Confluence") page for development documents
