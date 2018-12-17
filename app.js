const express = require('express')
const bodyParser = require('body-parser')
const fs = require('fs')
const path = require('path')
const session = require('express-session')

// app.use() : 注册中间件
// app.set() : 设置一些配置的  例如 views 设置模板存放目录  view engine 设置默认的模板引擎
// app.get / post / delete / option / head / put  监听不同请求方式的方法
// app.get('/')  app.post('/')
// res.render() : 渲染, 必须设置好模板引擎后才可以使用
// res.send() : 响应数据(对象数组字符串, 不能是number)  如果传入数组字符串, express内部执行了JSON.stringfy() 将对象序列化为字符串
// res.status() : 改变响应的状态码
// res.redirect() : 重定向

const app = express()

// 例如body-parser  就是在处理请求之前帮我们把 用户提交的表单信息 封装好了
// 中间件的作用就是在处理请求之前  做一些封装操作
// express-session帮我们做的事情就是 通过sessionID取出对应的session
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  // 如果不设置过期时间  默认 关闭浏览器即过期, 无法存储有效的cookie
  cookie: { maxAge: 1000 * 60 * 60 * 24 * 30 }
}))

app.use(bodyParser.urlencoded({ extended: false }))

// 静态资源托管
app.use('/node_modules', express.static('./node_modules'))

// 设置模板引擎
app.set('view engine', 'ejs')

// 设置模板存放路径  如果不设置 默认就在views目录
// app.set('views', './views')

// 注册路由
// const indexRouter = require('./routes/index')
// app.use(indexRouter)

// app.use(require('./routes/index'))
// app.use(require('./routes/user'))

// 使用fs模块读取routes目录下所有的文件名
fs.readdir('./routes', (err, files) => {
  if (err) return console.log(err.message)
  files.forEach(filename => {
    // 相对路径引入
    // console.log('./routes/' + filename)
    // app.use(require('./routes/' + filename))

    // 绝对路径引入
    // let 和 const 都有块级作用域
    const filePath = path.join(__dirname, './routes/' + filename)
    // console.log(filePath)
    app.use(require(filePath))
  })
})

// 循环10次  就有10个单独的作用域  并不会对a重新赋值 每次循环都是一个新的a
// for (let i = 0; i < 10; i++) {
//   const a = 10
// }

app.listen(80, () => {
  console.log('http://127.0.0.1');
})