// 数据库的连接操作
const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  port: 3306,
  database: "vgclub",
  user: "root",
  password: "123456"
})
// 测试数据库是否连接成功
pool.getConnection((err, conn) => {
  if (err) {
    console.log("数据库连接失败:", err);
  } else {
    console.log("VGCLUB数据库连接成功~")
  }
})

module.exports = pool.promise();