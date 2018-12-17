const mysql = require('mysql')

const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'blog',
  // 开启多条语句执行的功能
  multipleStatements: true
})

module.exports = conn