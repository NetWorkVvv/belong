const pool = require("../app/datebase");

class FileService {
  // 上传头像
  async uploadAvatarService(filename, mimetype, size, userId) {
    const SQL = `INSERT INTO avatar (filename, mimetype, size, user_id) VALUES (?,?,?,?);`
    try {
      const [result] = await pool.execute(SQL, [filename, mimetype, size, userId]);
      return result;
    } catch (e) {
      const erResult = "上传有误,请重新上传";
      return erResult;
    }
  }
  // 获取图片
  async getAvatarInfoService(userId) {
    const SQL = `SELECT * FROM avatar WHERE user_id = ?;`
    try {
      const [result] = await pool.execute(SQL, [userId]);
      return result[0];
    } catch (e) {
      const erResult = "获取图片信息失败";
      return erResult;
    }
  }
  // 上传配图
  async uploadPictureService(filename, mimetype, size, momentId, id) {
    const SQL = `INSERT INTO file (filename, mimetype, size, moment_id, user_id) VALUES (?,?,?,?,?);`
    const [result] = await pool.execute(SQL, [filename, mimetype, size, momentId, id]);
    return result;
  }

  // 动图展示
  async showPictureInfo(filename) {
    const SQL = `SELECT * FROM file WHERE filename = ?;`
    const [result] = await pool.execute(SQL, [filename])
    return result;
  }
}

module.exports = new FileService();