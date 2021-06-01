import express from 'express';
import cors from 'cors';

var PORT = process.env.PORT || 3000;
var app = express();
app.use(cors());
app.listen(PORT);

// mongoose connection
const mongoose = require('mongoose');
mongoose.connect(
  // 'mongodb://tutorism:1234@192.168.1.37:27017/data?authSource=admin',
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

const User = mongoose.model('User', userSchema);
const Post = mongoose.model('Post', postSchema);

app.get('/', (req, res) => {
  return res.status(200).send('hello');
});

app.post('/user', (req, res) => {
  const user = {
    firstname: 'Thanawat',
    lastname: 'Benjachatriroj',
    email: 'thanawat.bcr@gmail.com',
    password: '1234',
    displayName: 'Tutorism',
    donation: 3000,
  };
  const tmpUser = new User(user);
  tmpUser.save()
    .then((doc) => {
      console.log(doc)
      return res.status(201).send('success');
    }).catch((err) => {
      console.log(err)
      return res.status(400).send('error');
    });
});

app.post('/post', (req, res) => {
  const id = '60b64baba1ae4c7d7ac81c1a'
  const post = {
    title: 'Jimmy Nudey',
    image: 'url',
    price: 300,
    sellerDonate: false,
    sellerId: id,
  };
  const tmpPost = new Post(post);
  tmpPost.save()
    .then((doc) => {
      console.log(doc)
      return res.status(201).send('success');
    }).catch((err) => {
      console.log(err)
      return res.status(400).send('error');
    });
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
