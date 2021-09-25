const pool = require("../app/datebase")

class LabelService {
  // 创建标签
  async createLabelService(labelName) {
    const SQL = `INSERT INTO label (name) VALUES (?);`
    try {
      const [createResult] = await pool.execute(SQL, [labelName]);
      if (!Object.keys(createResult).length) throw new Error();
      return createResult;
    } catch (e) {
      const createUnResult = "标签太长或者重复";
      console.log("CREATE_LABEL_SERVICE_IS_ERROR");
      return createUnResult;
    }
  }
  // 检查标签
  async checkLabelService(labelName) {
    const SQL = `SELECT * FROM label WHERE name = ?;`
    try {
      //checkResult => [[{}]] => [checkResult]=> [{}] => [checkResult][0] => {}
      const [checkResult] = await pool.execute(SQL, [labelName])
      return checkResult[0]
    } catch (e) {
      const checkUnResult = "标签查询失败"
      console.log("CHECK_LABEL_SERVICE_IS_ERROR")
      return checkUnResult
    }
  }
  // 展示标签
  async listLabelService(limit, offset) {
    const SQL = `SELECT * FROM label LIMIT ? OFFSET ?;`
    try {
      // const SQL = `SELECT * FROM label LIMIT ?,?(offset,limit);`
      const [listResult] = await pool.execute(SQL, [limit, offset])
      return listResult
    } catch (e) {
      const listUnResult = "标签展示失败"
      console.log("LIST_LABEL_SERVICE_IS_ERROR")
      return listUnResult
    }
  }
}
module.exports = new LabelService();