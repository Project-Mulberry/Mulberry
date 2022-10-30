# Mulberry-BE


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

&nbsp;&nbsp;&nbsp;&nbsp;**v1.0** - xx/xx/xxxx - xxx

## Guidance
### Environment Setup
1. git pull repo
2. bundle install --without production
3. **[OPTIONAL: create database]** rake db:migrate
4. **[OPTIONAL: import sample data]** rake db:seed
5. rails server -b 0.0.0.0 
6. open browser localhost:3000

> **For test:**  
> rake spec (or rspec or bundle exec autotest)  
> rake cucumber  
  
> **For deployment:**  
> heroku stack:set heroku-20  
> bundle install --with production
> git push heroku {*branchname*}:master  
> heroku run rake db:migrate  
> heroku run rake db:seed  
> https://arcane-fortress-74887.herokuapp.com

## Documentation

&nbsp;&nbsp;&nbsp;&nbsp;Please refer to our [Confluence](https://marcus117.atlassian.net/wiki/spaces/MULBERRY/overview "Mulberry Confluence") page for development documents
