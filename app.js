const express = require('express')
const bodyParser = require('body-parser')


// app.use() : 注册中间件
// app.set() : 设置一些配置的  例如 views 设置模板存放目录  view engine 设置默认的模板引擎
// app.get / post / delete / option / head / put  监听不同请求方式的方法
// app.get('/')  app.post('/')
// res.render() : 渲染, 必须设置好模板引擎后才可以使用
// res.send() : 响应数据(对象数组字符串, 不能是number)  如果传入数组字符串, express内部执行了JSON.stringfy() 将对象序列化为字符串
// res.status() : 改变响应的状态码
// res.redirect() : 重定向

const app = express()

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

app.use(require('./routes/index'))

app.use(require('./routes/user'))

app.listen(80, () => {
  console.log('http://127.0.0.1');
})