const conn = require('../db')

module.exports = {
  // 约定大于配置
  getIndexHandler(req, res) {

    // 每页显示多少条数据
    // MD5
    const pageSize = 5
    // 当前是多少页
    const currentPage = Number(req.query.page) || 1
    console.log(currentPage)

    const sql = `select a.id, a.title, a.ctime, u.nickname
                from articles as a 
                left join users as u 
                on a.author_id = u.id
                order by a.ctime desc
                limit ?, ${pageSize};
                select count(*) as count from articles`
                // (currentPage - 1) * pageSize
                // 0, 3  
                // 3, 3
                // 6, 3
                // ...

    conn.query(sql, (currentPage - 1) * pageSize, (err, result) => {
      if (err) return res.send(err.message)
      // 以前的result 就是现在的result[0]
      // count(*)查询的结果就是现在的 result[1]
      // 所有的数据总条数
      const totalCount = result[1][0].count
      // 算出总页数  向上取整
      const totalPage = Math.ceil(totalCount / pageSize)
      // console.log(result)
      res.render('index', {
        userInfo: req.session.userInfo,
        isLogin: req.session.isLogin,
        articleInfos: result[0],
        totalPage,
        currentPage
      })
    })

  }
}

// Require.js  /  Sea.js
// 高内聚 能在自己内部完成的功能一定不要干扰外部
// 低耦合 尽可能的降低模块之间的耦合度