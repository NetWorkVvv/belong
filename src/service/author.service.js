const pool = require("../app/datebase");

// 检查用户的权限
class AuthorService {
  async checkLicense(tableName, tableId, userId) {
    const statement = `SELECT * FROM ${tableName} WHERE id = ? AND user_id = ?;`
    const [result] = await pool.execute(statement, [tableId, userId])
    // 对比
    // console.log(result)
    // 查不到数据故长度 = 0 说明登录的用户 和 发表评论的用户不匹配
    return result.length === 0 ? true : false
  }
}

module.exports = new AuthorService();