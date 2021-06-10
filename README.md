## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Your System User must have admin access to install all necessary requirements

  ```
  Click the Apple icon > click System Preferences > click Users and Groups > click the Lock to make changes > check "Allow user to administer this computer" for your login.
  ```

- [Install Node JS Via Homebrew](https://nodejs.org/en/)
  ```
  brew install node
  ```
  Make sure you have both HomeBrew, Node JS & NPM installed successfully.

### Install Dependencies

```
npm install
```

## Running the Tests on local Machine

- Method 1: Invokes script named 'test_api' from package.json file.
  ```
  npm run test_api
  ```
  OR
  ```
  newman run collections/mc_collection.postman_collection.json
  ```
  OR
  ```
  newman run collections/mc_collection.postman_collection.json -e environments/roni_env.postman_environment.json -n 1 --delay-request 500 -r cli,html"
  ```

## Running the Tests in Docker Container

### Running Tests in Docker Container

Build docker image with:

```
docker build --tag ${TAG NAME(mynewman:latest)} .
```

Run the tests in the docker container:

```
docker run -t ${TAG NAME(mynewman)} run collections/roni.postman_collection.json -e environments/roni_env.postman_environment.json -n 1 --delay-request 500 -r cli,html
```
