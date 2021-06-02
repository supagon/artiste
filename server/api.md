# **Artiste API Documentation**

## Routes

- ### `Authentication` Method

  1. Login `[DONE]`
      - **URL** : `/login`
      - **Method** : `POST`
      - **URL Queries** : `none`
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
  2. register `[DONE]`
      - **URL** : `/register`
      - **Method** : `POST`
      - **URL Queries** : `none`
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

  1. Create Post `[DONE]`
      - **URL** : `/post`
      - **Method** : `POST`
      - **URL Queries** : `none`
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
  2. Get All Posts `[DONE]`
      - **URL** : `/post`
      - **Method** : `GET`
      - **URL Queries** : `none`
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
                sellerId: String
              }
            ]
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  4. Get User Posts `[WIP]`
      - **URL** : `/post/user`
      - **Method** : `GET`
      - **URL Queries** : `id: userId`
          ```
            {
              id: String
            }
          ```
      - **Body** : `none`
      - **Response** : `sellerName: displayName, id: postId`
        - Status Code : `200`
          ```
            posts: [
              {
                id: String
                title: String
                image: String
                price: Number
                sellerDonate: Boolean
                sellerId: String
              }
            ]
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```
  5. Get Post Information `[WIP]`
      - **URL** : `/post/info/:id`
      - **Method** : `GET`
      - **URL Queries** : `id: postId`
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
  6. Purchase `[WIP]`
      - **URL** : `/purchase`
      - **Method** : `POST`
      - **URL Queries** : `none`
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

  1. Get Profile `[WIP]`
      - **URL** : `/user`
      - **Method** : `GET`
      - **URL Queries** : `id: userId`
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
  2. Get Display Name `[DONE]`
      - **URL** : `/user/display`
      - **Method** : `GET`
      - **URL Queries** : `id: userId`
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
              displayName: String
            }
          ```
        - Status Code : `400`
          ```
            {
              log: String
            }
          ```