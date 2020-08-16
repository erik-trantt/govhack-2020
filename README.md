# MyMSDChat - GovHack 2020 Auckland

Created in 48 hours as part of the GovHack Hackathon

url: http://govhack-auckland-2020.herokuapp.com/
Idea demonstration: https://youtu.be/gUHin3yojOg

## Project Description
In a COVID world, where face-to-face contact may not always possible, how do we ensure that individuals can get the support they need in times of uncertainty?

MyMSDChat is a chatbot solution to help Work and Income New Zealand cope with increased demand on their resources, and gather data about specific cases.

The MyMSDChat app has 3 main functions
- It ask’s key fielding questions and provide responses and information
- Provides the user with advice and instruction on what to do
- And gathers data for case workers

Benefit of using MyMSDChat in this situation
- Can feedback to users in realtime without consuming resources
- Can resolve simple to intermediate requests in realtime
- Can aggregate data and save to a case number to take the strain of case workers

### Future progress
We would want to insure all Kiwis are able to use this app. Accessibility for disabled users and language support are areas that we would want to focus on within the app in future.

## Installation
This app needs Ruby version 2.6.6 on your computer. If you need help with installing Ruby using `rbenv`, you can follow this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04#step-1-%E2%80%93-install-rbenv-and-dependencies).


## Setup

```bash
# clone the repo
git clone git@github.com:erik-trantt/govhack-2020.git

# install dependencies
cd govhack-2020
bundle install
yarn install --check-files

# run app for first time
rails db:migrate db:create

# populate sample data
rails db:seed
```

## Run the app
```bash
# starting the server
rails server

# alternatively, can use this shortcut
rails s
```

## Contributors

Thanks goes to these wonderful people
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/arievdp/"><img src="https://avatars1.githubusercontent.com/u/63568512?s=400&u=52808425006d200bd675d00f95771c9a912e5a5f&v=4" width="100px;" alt=""/><br /><sub><b>Arie van der Poel</b></sub></a><br /><a href="" title="(Code"><sub><b></b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/erik-trantt"><img src="https://avatars0.githubusercontent.com/u/44339322?s=460&u=67b405f2210f1f981efc3e6f55b6b416bed22539&v=4" width="100px;" alt=""/><br /><sub><b>Erik Tran</b></sub></a><br /><a href="" title="Code"><sub><b></b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/pruesinghnagra/"><img src="https://avatars0.githubusercontent.com/u/6743181?s=460&u=3b072ac624dde253029d0189b39ef33211fe2dbc&v=4" width="100px;" alt=""/><br /><sub><b>Prue Singh</b></sub></a><br /><a href="" title=""><sub><b></b></sub></a><br /></td>
     <td align="center"><a href="https://github.com/TaineC"><img src="https://media-exp1.licdn.com/dms/image/C5603AQFCmxHkU_bzzA/profile-displayphoto-shrink_400_400/0?e=1602720000&v=beta&t=-auWX6G0B-nD3g_A9ij7J6LLPG7TghUEAhEppPd9Ago" width="100px;" alt=""/><br /><sub><b>Taine Collins</b></sub></a><br /><a href="" title=""><sub><b></b></sub></a><br /></td>
     <td align="center"><a href="https://github.com/praveenmuthu-46"><img src="https://avatars2.githubusercontent.com/u/46794693?s=460&u=66806db2d1d6f4f97f2d4b34c407cc03d573e7c4&v=4" width="100px;" alt=""/><br /><sub><b>Praveen Muthu Elango</b></sub></a><br /><a href="" title=""><sub><b></b></sub></a><br /></td>
  </tr>
</table>



&#169; 2020 Gone With The Win
