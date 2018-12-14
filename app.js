const express = require('express')
const bodyParser = require('body-parser')

const app = express()

app.use(bodyParser.urlencoded({ extended: false }))

// 静态资源托管
app.use('/node_modules', express.static('./node_modules'))

// 设置模板引擎
app.set('view engine', 'ejs')

// 设置模板存放路径  如果不设置 默认就在views目录
// app.set('views', './views')

app.get('/', (req, res) => {
  res.render('index', {})
})

app.get('/register', (req, res) => {
  res.render('./user/register', {})
})

app.post('/register', (req, res) => {
  console.log(req.body)
  // res.send('ok')
  // 让浏览器跳到登录页
  // 302重定向
  // res.redirect('/login')
  res.send({ status: 200, msg: 'ok' })
})

app.get('/login', (req, res) => {
  res.render('./user/login', {})
})

app.listen(80, () => {
  console.log('http://127.0.0.1');
})