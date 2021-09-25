const pool = require("../app/datebase")

class CommentService {
  async createCommentService(momentId, content, id) {
    const createComment = `INSERT INTO comment (moment_id, content, user_id) VALUE (?,?,?);`
    const [createResult] = await pool.execute(createComment, [momentId, content, id])
    return createResult
  }

  async replyCommentService(momentId, content, commentId, id) {
    const replyComment = `INSERT INTO comment (moment_id, content, comment_id, user_id) VALUE (?,?,?,?);`
    const [replyResult] = await pool.execute(replyComment, [momentId, content, commentId, id])
    return replyResult
  }

  async updateCommentService(content, commentId) {
    const updateComment = `UPDATE comment SET content = ? WHERE id = ?;`
    const [updateResult] = await pool.execute(updateComment, [content, commentId])
    return updateResult
  }

  // 删除用户发表的评论
  async deleteCommentService(commentId, id) {
    const deleteComment = `DELETE FROM comment WHERE id = ? AND user_id = ?;`
    const [deleteResult] = await pool.execute(deleteComment, [commentId, id])
    console.log(deleteResult)
    return deleteResult
  }

  // 获取动态的评论列表
  async ListCommentService(momentId) {
    const ListComment = `SELECT * FROM comment WHERE moment_id = ?;`
    const [ListResult] = await pool.execute(ListComment, [momentId])
    return ListResult
  }
}

module.exports = new CommentService();