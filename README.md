# Sweater Weather API

![relational_ruby](https://user-images.githubusercontent.com/65498038/183769949-9f3d3cfc-0815-4ae8-a963-77def99beaf3.png)

Sweater Weather is an API built in Ruby on Rails designed to provide consumers with weather data of a particular location, user creation and authentication, and road trip data based on the users request.

## Table of Contents
* [Getting Started](#getting-started)
* [API Endpoints](#api-endpoints)
  * [User Endpoints](#user-endpoints)
  * [Pet Endpoints](#weather-endpoints)
* [Local Hosting](#local-hosting)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)

<a name="getting-started"></a>
## Getting Started
Thanks for checking out Bone! There are a few ways to access and manipulate data through our API endpoints and a few technologies we used to develop our project. 

<a name="api-endpoints"></a>
## API Endpoints

<a name="user-endpoints"></a>
### Users Endpoints
* *post* /api/v1/users
  * Creates a user
* *post* /api/v1/sessions
  * Logs in a user

<a name="weather-endpoints"></a>
### Weather Endpoints
* *get* /api/v1/forecast?location='city,state'
  * Gets weather for a city
* *post* /api/v1/road_trip

''' Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
'''
  * Creates a road trip

<a name="local-hosting"></a>
## Local Hosting

In order to host this API locally you will need to configure your development environment appropriately.

<a name="prerequisites"></a>
### Prerequisites

Sweater Weather was developed in Rails 5.2.8.1 (it is recommended to use either this version or a newer version of rails within Rails 5) and Ruby version 2.7.4.

To verify your version of Ruby and Rails run the following commands from your command line:

```
$ ruby -v
$ ruby 2.7.4p191 (2021-07-07 revision a21a3b7d23) [arm64-darwin21]
$ rails -v
$ Rails 5.2.8.1
```
If you do not have Ruby installed please visit the Ruby docs [here](https://www.ruby-lang.org/en/documentation/installation/).

If you also need Rails please visit the Rails documentation site [here](https://guides.rubyonrails.org/v5.0/getting_started.html).

<a name="installation"></a>
### Installation

Open your terminal and run these commands:

* `gem install bundler`
* `git clone https://github.com/z-prince/sweater_weather`
* `bundle install`
* `rails db:{drop,create,migrate,seed}`

Due to the fact that this will be a local consumption, all endpoints you consume will start with `http://localhost:3000` by default unless specified otherwise.

Now that everything is properly configured on your local machine, run `rails s` in your terminal to start the server and get consuming!
