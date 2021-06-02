# **Artiste API Documentation**

## Routes

- ### `Authentication` Method

  1. Register

     - **URL** : `/user`

     - **Method** : `POST`

     - **URL Params** : `none`

     - **Body** :

          ```
            {
              email: String,
              password: String
            }
          ```

     - **Success Response** :

       - Status Code : `200`
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