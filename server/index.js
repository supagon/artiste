import express from 'express';
import cors from 'cors';

var PORT = process.env.PORT || 3000;
var app = express();
app.use(cors());
app.listen(PORT);

// mongoose connection
const mongoose = require('mongoose');
mongoose.connect(
  'mongodb+srv://root:1234@artiste.0zec7.mongodb.net/artiste?authSource=admin',
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);

// // DB connection
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function () {
  console.log('DB connected');
});

// SCHEMA
const userSchema = mongoose.Schema(
  {
    firstname: String,
    lastname: String,
    email: String,
    password: String,
    displayName: String,
    donation: Number,
  },
  { collection: 'users' }
);
const postSchema = mongoose.Schema(
  {
    title: String,
    image: String,
    price: Number,
    sellerDonate: Boolean,
    buyerDonate: Boolean,
    buyerId: String,
    sellerId: String,
  },
  { collection: 'posts' }
)
const cartSchema = mongoose.Schema(
  {
    userId: String,
    postId: String,
  },
  { collection: 'carts' }
)

// MODEL
const User = mongoose.model('User', userSchema);
const Post = mongoose.model('Post', postSchema);
const Cart = mongoose.model('Cart', cartSchema);

const USER1_ID = '60b736e9121bb69e1b78800c';
const USER2_ID = '60b737099182a89e45bd1fd8';

const POST1_ID = '60b73763f46fd59e8dbf82cb';
const POST2_ID = '60b7377d1ec1439ea421eb87';
const POST3_ID = '60b737d6e908d59ede629259';

// API
// TEST
app.get('/', (req, res) => {
  return res.status(200).send('hello');
});

// Login user
app.post('/login', (req, res) => {
  const data = {
    email: 'user1@test.me',
    password: '1234',
  };
  User.findOne({ email: data.email }, (err, user) => {
    if ( err ) return res.status(400).json({ log: err });
    if ( !user ) return res.status(400).json({ log: 'User not found' });
    if ( user.password === data.password ) return res.status(200).json({ id: user._id });
    return res.status(400).json({ log: 'Password wrong' });
  })
})

// Register user
app.post('/register', (req, res) => {
  const data = {
    firstname: 'Thanawat',
    lastname: 'Benjachatriroj',
    email: 'user2@test.me',
    password: '1234',
    displayName: 'Tutorism',
    donation: 0,
  };
  
  // Check duplicate email
  User.findOne({ email: data.email }, (err, user) => {
    if ( err ) return res.status(400).json({ log: err });
    if ( user ) return res.status(400).json({ log: 'Email is already exists' });
    // Insert user
    const tmpUser = new User(data);
    tmpUser.save((err, user) => {
      if ( err ) return res.status(400).json({ log: err });
      return res.status(201).json({ id: user._id });
    })
  })
});

// Create Post
app.post('/post', (req, res) => {
  const data = {
    title: 'Item #3',
    image: 'url',
    price: 450,
    sellerDonate: false,
    sellerId: USER2_ID,
  };
  const tmpPost = new Post(data);
  tmpPost.save((err, post) => {
    if ( err ) return res.status(400).json({ log: err });
    return res.status(201).json({ id: post._id });
  })
})

// Get All Post
app.get('/post', (req, res) => {
  Post.find({}, (err, post) => {
    if ( err ) return res.status(400).json({ log: err });
    const data = post.map((item) => (
      {
        id: item._id,
        title: item.title,
        image: item.image,
        price: item.price,
        sellerDonate: item.sellerDonate,
        sellerId: item.sellerId,
        isAvailable: item.buyerId ? false : true
      }
    ))
    return res.status(200).json(data);
  })
})

// Get User Post
app.get('/post/user', (req, res) => {
  // const { id } = req.query;
  const id = USER2_ID;
  Post.find({ sellerId: id }, (err, post) => {
    if ( err ) return res.status(400).json({ log: err });
    if ( !post ) return res.status(400).json({ log: 'Post is not exists' });
    const data = post.map((item) => (
      {
        id: item._id,
        title: item.title,
        image: item.image,
        price: item.price,
        sellerDonate: item.sellerDonate,
        sellerId: item.sellerId,
        isAvailable: item.buyerId ? false : true
      }
    ))
    return res.status(200).json(data);
  })
})

// Get Post Information
app.get('/post/info', (req, res) => {
  // const { id } = req.query
  const id = POST3_ID
  Post.findById(id , (err, post) => {
    if ( err ) return res.status(400).json({ log: err });
    if ( !post ) return res.status(400).json({ log: 'Post is not exists' });
    return res.status(200).json(post);
  })
})

// Purchase
app.post('/purchase', (req, res) => {
  const buyerId = USER2_ID
  const posts = [
    { id: POST1_ID, buyerDonate: true },
    { id: POST2_ID, buyerDonate: false },
  ]
  posts.map((item) => {
    Post.findById(item.id , (err, data) => {
      if ( err ) return res.status(400).json({ log: err });
      if ( !data ) return res.status(400).json({ log: 'Post is not exists' });
      const { sellerId, sellerDonate, price } = data
      // console.log(sellerId, sellerDonate, price)
      if (sellerDonate) {
        // console.log("SELLER")
        User.findOneAndUpdate({ _id: sellerId }, { $inc: { donation: (price*0.1) } }).exec()
      }
      if (item.buyerDonate) {
        // console.log("BUYER")
        User.findOneAndUpdate({ _id: buyerId }, { $inc: { donation: (price*0.1) } }).exec()
      }
      Post.findOneAndUpdate({ _id: item.id }, { buyerDonate: item.buyerDonate, buyerId: buyerId }).exec()
    })
  })
  return res.status(200).send();
})

// Get User Profile
app.get('/user', (req, res) => {
  // const { id } = req.query;
  const id = USER1_ID
  User.findById(id, (err, user) => {
    if ( err ) return res.status(400).json({ log: err });
    const data = {
      id: user._id,
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      displayName: user.displayName,
      donation: user.donation,
    }
    return res.status(200).json(data);
  })
})

// Get User DisplayName
app.get('/user/display', (req, res) => {
  // const { id } = req.query;
  const id = USER1_ID
  User.findById(id, (err, user) => {
    if ( err ) return res.status(400).json({ log: err });
    return res.status(200).json({ displayName: user.displayName });
  })
})


app.post('/update', (req, res) => {
  const id = '60b65206de823e7e95ef7563'
  Post.findByIdAndUpdate(
    { _id: id },
    { buyerId: 'tutor' }
  )
    .then((doc) => {
      console.log(doc)
      return res.status(201).send('success');
    }).catch((err) => {
      console.log(err)
      return res.status(400).send('error');
    });
})

app.post('/delete', (req, res) => {
  const id = '60b65206de823e7e95ef7563'
  Post.findByIdAndDelete(
    { _id: id }
  )
    .then((doc) => {
      console.log(doc)
      return res.status(201).send('success');
    }).catch((err) => {
      console.log(err)
      return res.status(400).send('error');
    });
})
