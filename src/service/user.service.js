// SQL语句的操作
const pool = require("../app/datebase");

class UserService {
  async create(userRegistration) {
    // 将注册的user存储到数据库中
    console.log("注册用户:", userRegistration);
    const { username, password } = userRegistration;
    const userRegistrationSQL = `INSERT INTO users (name,password) VALUE (?,?);`
    // 启动数据库 预处理
    const userReg = await pool.execute(userRegistrationSQL, [username, password])
    return userReg[0];
  }
  async checkUserByName(name) {
    // 匹配数据库查重               
    const checkNameSQL = `SELECT * FROM users WHERE name = ?;`
    const checkName = await pool.execute(checkNameSQL, [name]);
    // console.log("数据库数据:",checkName[0])
    // 二维数组[ [{}] , [{}]...] => [0] => [{}]
    return checkName[0];
  }
  async updateAvatarUrlById(avatarUrl, userId) {
    const updateAvatar = `UPDATE users SET avatar_url = ? WHERE id = ?`
    const [result] = await pool.execute(updateAvatar, [avatarUrl, userId])
    return result
  }
  // 开发时可用来测试
  async UserShowDetailInfoService(userId) {
    const showDetailInfo = `SELECT id,name,createAt,avatar_url FROM users WHERE id = ?;`
    // 二维数组 内部是 数组对象[{}]
    const [result] = await pool.execute(showDetailInfo, [userId])
    return result[0]
  }
  async UserShowListInfoService(size, start) {
    const showListInfo = `SELECT id,name,createAt,avatar_url FROM users LIMIT ? OFFSET ?;`
    // 二维数组 内部是 数组对象[{}]
    const [result] = await pool.execute(showListInfo, [size, start])
    return result
  }
}

module.exports = new UserService();