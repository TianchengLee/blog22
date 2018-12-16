module.exports = {
  getArticleAddHandler(req, res) {
    // 未登录用户的拦截操作
    if (!req.session.isLogin) return res.redirect('/')

    res.render('article/add', {
      isLogin: req.session.isLogin,
      userInfo: req.session.userInfo
    })
  }
}