const moment = require('moment')
const conn = require('../db')
const bcrypt = require('bcryptjs')


module.exports = {
  getRegisterHandler(req, res) {
    res.render('./user/register', {})
  },
  postRegisterHandler(req, res) {
    // console.log(req.body)
    let userInfo = req.body
    // 1. 表单校验
    if (!userInfo.username || !userInfo.nickname || !userInfo.password) return res.status(400).send({ status: 400, msg: '请输入正确的表单信息!' })

    // 2. 查重  判断用户名是否已经存在  连接数据库查询
    const chachongSql = 'select count(*) as count from users where username = ?'
    conn.query(chachongSql, userInfo.username, (err, result) => {
      if (err) return res.status(500).send({ status: 500, msg: '查重失败!请重试!' })
      // result[0].count // 为0表示没有重复, 可以用
      if (result[0].count !== 0) return res.status(400).send({ status: 400, msg: '用户名重复!请重试!' })

      // 能到此处 说明可以注册
      // 添加ctime字段
      userInfo.ctime = moment().format('YYYY-MM-DD HH:mm:ss')
      
      const salt = bcrypt.genSaltSync(10)
      // 对密码进行加密
      const hash = bcrypt.hashSync(userInfo.password, salt)
      // console.log(hash)
      userInfo.password = hash

      // console.log(userInfo)
      // 执行注册的sql语句  使用MySQL模块 注意insert into xxx set
      const registerSql = 'insert into users set ?'
      conn.query(registerSql, userInfo, (err, result) => {
        if (err) return res.status(500).send({ status: 500, msg: '注册失败!请重试!' })
        // 让浏览器跳到登录页
        // 302重定向
        // res.redirect('/login')
        res.send({ status: 200, msg: '注册成功!' })
      })
    })
  },
  getLoginHandler(req, res) {
    res.render('./user/login', {})
  },
  postLoginHandler(req, res) {
    // console.log(req.body)
    // 1. 直接去数据库执行查询语句  条件 username和password
    const loginSql = 'select * from users where username = ?'
    conn.query(loginSql, req.body.username, (err, result) => {
      // 如果查询出错 或者没有查询到结果 就提示登录失败
      if (err || result.length === 0) return res.status(400).send({ status: 400, msg: '登录失败!请重试!' })
      // 使用bcrypt进行校验
      if (!bcrypt.compareSync(req.body.password, result[0].password)) return res.status(400).send({ status: 400, msg: '登录失败!请重试!' }) 
      // 登录成功
      // 将用户信息存储在session中
      req.session.userInfo = result[0]
      // 记录登录状态
      req.session.isLogin = true
      res.send({ status: 200, msg: '登录成功!' })
    })
  },
  getLogoutHandler(req, res) {
    req.session.destroy((err) => {
      // cannot access session here
      // 在这里不能访问session了  已经销毁完成了
      res.send({status: 200, msg: '退出登录成功!'})
    })
  }
}