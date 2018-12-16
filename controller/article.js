module.exports = {
  getArticleAddHandler(req, res) {
    res.render('article/add', {
      isLogin: req.session.isLogin,
      userInfo: req.session.userInfo
    })
  }
}