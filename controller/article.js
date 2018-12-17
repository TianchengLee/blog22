const moment = require('moment')
const conn = require('../db')

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
  }
}