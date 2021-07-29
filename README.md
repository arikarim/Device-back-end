# React-Rails Authentication Front-End

<p align="center">
    <img src="./app/images/rails.png" alt="Logo" width="150" height="120">
  <h3 align="center">React-Rails --> [Rails]</h3>

  <p align="center">
This is prepared Rails Found and Seek assignment back-end repo. 
  </p>
</p

## Screenshots of the app.

![image](./app/images/s.png)

## Built With

- Rails-Api

- Devise

- Devise-jwt

## Getting Started

**To get this project set up on your local machine, follow these simple steps:**

**Step 1**<br>

In order to use this project all you have to to is follow these simple steps :

- Clone the Rails repo and cd inside the project.

- Run `Rake secret` and keep hold it for the next step.

- Create a `.env` file in the root of the project and inside it put this `DEVISE_JWT_SECRET_KEY = < your secret key from previuos step >`

- Inside `config/initializers/cors.rb` if you it locally you dont need to do this but if you want to use it from specific domain you should change line 12 from `origins '*'` to `origins 'Your domain here'`.

- Note: If you publish this website and upload it to heroku, do not forget to add a `Config variable` to your app in heroku, simply go to heroku, go to your app, click on setting, click on config vars then put your `DEVISE_JWT_SECRET_KEY` then your secret key.


## End points:

**http//localhost:3000/users/sign_in**

- Route ==> Sign in
- Method ==> POST
- Body ==> `{ "user": { "email": "test@example.com", "password": "12345678" } }`
- Response token ==> data.headers.authorization

**http//localhost:3000/users**

- Route ==> Sign up
- Method ==> POST
- Body ==> `{ "user": { "email": "test@example.com", "password": "12345678" } }`
- Response token ==> data.headers.authorization

**http//localhost:3000/member**

- Route ==> To know if user logged in?
- Method ==> GET
- headers ==> `token: token you saved from log in or sign up user`
- Response ==> data.data.message=> 'yeppa you did it.'

**http//localhost:3000/users/sign_out**

- Route ==> To know if user logged in?
- Method ==> DELETE
- headers ==> `token: token you saved from log in or sign up user`
- Response ==> data.data.message=> 'You are logged out.'

**http//localhost:3000/devices**

- Route ==> To create a device
- Method ==> POST
- Response ==> data.data.message=> 'Success'

**http//localhost:3000/devices/id**

- Route ==> To delete a device
- Method ==> DELETE
- Response ==> data.data.message=> 'No response'

**http//localhost:3000/devices/id**

- Route ==> To update a device
- Method ==> PUT
- Response ==> data.data.message=> 'Success'

## run tests
- bundle exec rspec

## 🤝 contributing

## Author

- GitHub: [@arikarim](https://github.com/arikarim)
- LinkedIn: [AriKarim](https://www.linkedin.com/in/ari-karim-523bb81b3)

## 🙋‍♂ show your support

give a ⭐️ if you like this project!

## 📝 license

This project is [MIT](lisenced)
