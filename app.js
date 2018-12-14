const express = require('express')

const app = express()

// 设置模板引擎
app.set('view engine', 'ejs')

// 设置模板存放路径  如果不设置 默认就在views目录
// app.set('views', './views')

app.get('/', (req, res) => {
  res.render('index', {test: '谢俊进小米'})
})

app.listen(80, () => {
  console.log('http://127.0.0.1');
})