const pool = require("../app/datebase");

class MomentService {
  // 根据用户插入动态
  async insertMoment(userId, content) {
    const insertContent = `INSERT INTO moment (content,user_id) VALUE (?,?);`
    const result = await pool.execute(insertContent, [content, userId])
    return result;
  }
  // 查询多条数据
  async selectListMoment(offset, size) {
    const selectList = `SELECT
    m.id, m.content, m.createAt, m.updateAt,
      JSON_OBJECT('id', u.id, 'name', u.name) AS user,
        (SELECT COUNT(*) FROM comment AS c WHERE c.moment_id = m.id) AS commentContent,
        (SELECT COUNT(*) FROM moment_label AS ml WHERE ml.moment_id = m.id) AS labelContent,
        (SELECT JSON_ARRAYAGG(CONCAT('http://localhost:7777/moment/images/', file.filename))
        FROM file WHERE m.id = file.moment_id) AS images
    FROM moment AS m 
    LEFT JOIN users AS u ON m.user_id = u.id  
    LIMIT ?, ?;`

    // m.id m.content m.createAt m.update user对象数据 commentContent评论个数 字段数据的展示  
    const [result] = await pool.execute(selectList, [offset, size])
    return result;
  }

  // 查询动态详细
  async selectDetailMoment(selectId) {
    // 根据动态查找用户
    const selectContents = `SELECT
    m.id, m.content, m.createAt, m.updateAt,
      JSON_OBJECT('id', u.id, 'name', u.name, 'avatarUrl', u.avatar_url) AS user,
        IF(COUNT(l.id), JSON_ARRAYAGG(
          JSON_OBJECT('id', l.id, 'name', l.name)), NULL) AS labels,
            (SELECT IF(COUNT(c.id), JSON_ARRAYAGG(
              JSON_OBJECT('id', c.id, 'content', c.content, 'commentId', c.comment_id, 'createTime', c.createAt,
                'user', JSON_OBJECT('id', cu.id, 'name', cu.name, 'avatarUrl', cu.avatar_url))
            ), NULL) FROM comment AS c LEFT JOIN users AS cu ON c.user_id = cu.id WHERE m.id = c.moment_id) AS comments,
              (SELECT JSON_ARRAYAGG(CONCAT('http://localhost:7777/moment/images/', file.filename))
    FROM file WHERE m.id = file.moment_id) AS images
    FROM moment AS m
    LEFT JOIN users AS u ON m.user_id = u.id
    LEFT JOIN moment_label AS ml ON m.id = ml.moment_id
    LEFT JOIN label AS l ON ml.label_id = l.id
    WHERE m.id = ? GROUP BY m.id;`
    // result返回的是二维数组 [result] =>返回的时[{}] => [result][0]
    const [result] = await pool.execute(selectContents, [selectId])
    // console.log(result[0])
    return result[0]
  }

  async updateMoment(updateContent, momentId) {
    const statement = `UPDATE moment SET content = ? WHERE id = ?;`
    const result = await pool.execute(statement, [updateContent, momentId])
    return result
  }

  async deleteMoment(momentId) {
    const statement = `DELETE FROM moment WHERE id = ?;`
    const [result] = await pool.execute(statement, [momentId])
    return result
  }

  // 检查添加的标签是否给动态添加过了
  async hasLabel(momentId, labelId) {
    const statement = `SELECT * FROM moment_label WHERE moment_id = ? AND label_id =?;`
    const [result] = await pool.execute(statement, [momentId, labelId]);
    return result[0] ? true : false;
  }

  // 给动态添加标签
  async addLabel(momentId, labelId) {
    const statement = `INSERT INTO moment_label (moment_id,label_id) VALUES (?,?);`
    const [result] = await pool.execute(statement, [momentId, labelId]);
    return result;
  }
}


module.exports = new MomentService()