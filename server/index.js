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

// API
// TEST
app.get('/', (req, res) => {
  return res.status(200).send('hello');
});

// Login user
app.post('/login', (req, res) => {
  const data = {
    email: 'user@test.me',
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
    email: 'user@test.me',
    password: '1234',
    displayName: 'Tutorism',
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
  const id = '60b7141560f91b8605743b81'
  const data = {
    title: 'Jimmy Nudey',
    image: 'url',
    price: 300,
    sellerDonate: false,
    sellerId: id,
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
      }
    ))
    return res.status(200).json(data);
  })
})

// Get All Post
app.get('/post/user', (req, res) => {
  const { id } = req.query;
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
      }
    ))
    return res.status(200).json(data);
  })
})

// Get Post Information
app.get('/post/info', (req, res) => {
  const { id } = req.query
  Post.findById(id , (err, post) => {
    if ( err ) return res.status(400).json({ log: err });
    if ( !post ) return res.status(400).json({ log: 'Post is not exists' });
    return res.status(200).json(post);
  })
})

// Get Seller DisplayName
app.get('/user/display', (req, res) => {
  const { id } = req.query;
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
