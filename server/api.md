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

- ### `Post` Method

  1. Create Post
      - **URL** : `/post`
      - **Method** : `POST`
      - **URL Params** : `none`
      - **Body** :
          ```
            {
              title: String
              image: String
              price: Number
              sellerDonate: Boolean
              sellerId: String
            }
          ```
      - **Response** :
        - Status Code : `201`
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
  2. Get All Posts
      - **URL** : `/post`
      - **Method** : `GET`
      - **URL Params** : `none`
      - **Body** : `none`
      - **Response** : `sellerName: displayName, id: postId`
        - Status Code : `200`
          ```
            post: [
              {
                id: String
                title: String
                image: String
                price: Number
                sellerDonate: Boolean
                sellerName: String
              }
            ]
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  3. Get User Posts
      - **URL** : `/post/user/:id`
      - **Method** : `GET`
      - **URL Params** : `id: userId`
          ```
            {
              id: String
            }
          ```
      - **Body** : `none`
      - **Response** : `sellerName: displayName, id: postId`
        - Status Code : `200`
          ```
            post: [
              {
                id: String
                title: String
                image: String
                price: Number
                sellerDonate: Boolean
                sellerName: String
              }
            ]
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  4. Get Post Information
      - **URL** : `/post/info/:id`
      - **Method** : `GET`
      - **URL Params** : `id: postId`
          ```
            {
              id: String
            }
          ```
      - **Body** : `none`
      - **Response** : `sellerName: displayName, id: postId`
        - Status Code : `200`
          ```
            {
              id: String
              title: String
              image: String
              price: Number
              sellerDonate: Boolean
              sellerName: String
            }
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  5. Purchase
      - **URL** : `/purchase`
      - **Method** : `POST`
      - **URL Params** : `none`
      - **Body** : `id: postId`
          ```
            {
              buyerId: String
              posts: [{ id: String, buyerDonate: Boolean }]
            }
          ```
      - **Response** :
        - Status Code : `200`
        - Status Code : `400`

- ### `User` Method

  1. Get Profile
      - **URL** : `/user`
      - **Method** : `GET`
      - **URL Params** : `id: userId`
          ```
            {
              id: String
            }
          ```
      - **Body** : `none`
      - **Response** :
        - Status Code : `200`
          ```
            {
              firstname: String
              lastname: String
              email: String
              password: String
              displayName: String
              donation: Number
            }
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```