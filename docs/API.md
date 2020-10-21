# API

Local Base URL is the url of the rails server, usually <http://localhost:3000>

The deployed base Url: <https://vehicle-service-booking-api.herokuapp.com>

## Requests

All request, except when logging in or registering, must have a authentication header that is recieved from registering or login of a user:

```javascript
'Authorization', `Bearer ${TOKEN}`;
```

### Users Controller

#### GET auto_login authentication: /auto_login

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');
myHeaders.append(
  'Authorization',
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE',
);

var raw = JSON.stringify({
  username: 'alibaba',
  password: 'fish2',
  email: 'notadmin@admin.com',
  admin: false,
});

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'manual',
};

fetch('http://localhost:3000/auto_login', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```

#### POST login with username and password: /login

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');
myHeaders.append(
  'Authorization',
  "'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE'",
);

var raw = JSON.stringify({ username: 'test', password: '123456' });

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'manual',
};

fetch('http://localhost:3000/login', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```

#### POST Registeration user

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');

var raw = JSON.stringify({
  username: 'testing',
  password: 'password',
  email: 'notadmin@admin.com',
  admin: false,
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'manual',
};

fetch('https://vehicle-service-booking-api.herokuapp.com/users', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```

### Appointments Controller

#### GET list of Appointments: /appointments

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');
myHeaders.append(
  'Authorization',
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE',
);

var raw = '';

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  body: raw,
  redirect: 'manual',
};

fetch('http://localhost:3000/appointments/', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```

#### POST a new appointment: '/appointment'

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');
myHeaders.append(
  'Authorization',
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE',
);

var raw = JSON.stringify({
  appointment: {
    service_id: 1,
    description: 'Need a service',
    start_time: '2020-10-30T0800',
    end_time: '2020-10-30T11:00',
  },
});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow',
};

fetch('http://localhost:3000/appointments/', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```

### Services Controller

#### GET list of services: /services

```javascript
var myHeaders = new Headers();
myHeaders.append('Content-Type', 'application/json');
myHeaders.append(
  'Authorization',
  'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE',
);

var requestOptions = {
  method: 'GET',
  headers: myHeaders,
  redirect: 'manual',
};

fetch('http://localhost:3000/services', requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.log('error', error));
```
