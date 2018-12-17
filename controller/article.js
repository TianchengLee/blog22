const moment = require('moment')
const conn = require('../db')
const marked = require('marked')

const mditor = require('mditor')
const parser = new mditor.Parser()


module.exports = {
  getArticleAddHandler(req, res) {
    // 未登录用户的拦截操作
    // 每一次请求都是独立的
    if (!req.session.isLogin) return res.redirect('/')

    res.render('article/add', {
      isLogin: req.session.isLogin,
      userInfo: req.session.userInfo
    })
  },
  postArticleAddHandler(req, res) {
    // 没有登录或者身份信息已经失效
    if (!req.session.isLogin) return res.status(401).send({ status: 401, msg: '身份信息已过期!请登陆后重试!' })

    // req.body 是引用数据类型  对象
    // 将req.body的地址值赋值给articleInfo变量
    // req.body和articleInfo同时指向同一个对象
    // 往articleInfo上添加ctime属性等于给req.body上添加ctime属性
    const articleInfo = req.body
    articleInfo.ctime = moment().format('YYYY-MM-DD HH:mm:ss')
    articleInfo.author_id = req.session.userInfo.id
    conn.query('insert into articles set ?', articleInfo, (err, result) => {
      if (err || result.affectedRows != 1) return res.status(500).send({ status: 500, msg: '文章发表失败!请重试!' + err.message })
      // 还需要将刚插入数据库的那条数据ID也一起返回
      res.send({ status: 200, msg: '文章发表成功!', articleId: result.insertId })
    })
  },
  getArticleInfoHandler(req, res) {
    const articleId = parseInt(req.params.id)

    // 根据ID查询数据库 获取文章详情
    conn.query('select * from articles where id = ?', articleId, (err, result) => {
      if (err || result.length !== 1) return res.redirect('/')
      // console.log(err)
      // render和send的是使用时机
      // 当用户使用get请求访问服务器并且需要看到页面时 应该用render渲染
      // 当用户使用ajax请求访问服务器 并且需要获取数据时  应该用send返回数据
      // res.send(result) 
      // result[0].content = marked(result[0].content)
      result[0].content = parser.parse(result[0].content)
      res.render('article/info', {
        isLogin: req.session.isLogin,
        userInfo: req.session.userInfo,
        articleInfo: result[0]
      })
    })
  },
  getArticleEditHandler(req, res) {
    // 如果只做登录校验是不严谨的
    // 应该加上作者的校验
    if (!req.session.isLogin) return res.redirect('/')
    // 文章ID
    const articleId = parseInt(req.params.id)
    // 根据文章ID查询数据库 获取文章详情信息
    conn.query('select * from articles where id = ?', articleId, (err, result) => {
      if (err || result.length !== 1) return res.redirect('/')
      // 权限的控制: 如果当前登录的用户ID和作者ID不匹配 也不能渲染
      if (req.session.userInfo.id != result[0].author_id) return res.redirect('/')
      // 文章详情获取到了
      res.render('article/edit', {
        isLogin: req.session.isLogin,
        userInfo: req.session.userInfo,
        articleInfo: result[0]
      })
    })

  },
  postArticleEditHandler(req, res) {
    // console.log(req.body)
    // console.log(req.params)
    conn.query('update articles set ? where id = ?', [req.body, req.params.id], (err, result) => {
      if (err || result.affectedRows !== 1) return res.status(500).send({status: 500, msg:'文章修改失败,请重试!'})

      res.send({status: 200, msg: '文章修改成功!'})
    })
  }
}