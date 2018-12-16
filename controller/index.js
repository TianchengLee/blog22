module.exports = {
  // 约定大于配置
  getIndexHandler(req, res) {
    res.render('index', {
      userInfo: req.session.userInfo,
      isLogin: req.session.isLogin
    })
  }
}

// Require.js  /  Sea.js
// 高内聚 能在自己内部完成的功能一定不要干扰外部
// 低耦合 尽可能的降低模块之间的耦合度