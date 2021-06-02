# **Artiste API Documentation**

## Routes

- ### `Authentication` Method

  1. Login
     - **URL** : `/login`
     - **Method** : `POST`
     - **URL Params** : `none`
     - **Body** :
          ```
            {
              email: String
              password: String
            }
          ```
     - **Response** :
       - Status Code : `200`
          ```
            {
              id: String
            }
          ```
       - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  2. register
     - **URL** : `/register`
     - **Method** : `POST`
     - **URL Params** : `none`
     - **Body** :
          ```
            {
              firstname: String
              lastname: String
              email: String
              password: String
              displayName: String
            }
          ```
     - **Response** :
       - Status Code : `201`
          ```
            {
              id: String,
            }
          ```
       - Status Code : `400`
          ```
            {
              log: String,
            }
          ```