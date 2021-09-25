const commentService = require("../service/comment.service")

class CommentController {
  async createComment(ctx, next) {
    const { momentId, content } = ctx.request.body
    const { id } = ctx.user
    const result = await commentService.createCommentService(momentId, content, id)
    ctx.body = result
  }
  async replyComment(ctx, next) {
    const { momentId, content } = ctx.request.body
    const { commentId } = ctx.params
    const { id } = ctx.user
    const result = await commentService.replyCommentService(momentId, content, commentId, id)
    ctx.body = result
  }
  async updateComment(ctx, next) {
    const { content } = ctx.request.body
    const { commentId } = ctx.params
    const result = await commentService.updateCommentService(content, commentId)
    ctx.body = result
  }
  async deleteComment(ctx, next) {
    const { commentId } = ctx.params
    const { id } = ctx.user
    const result = await commentService.deleteCommentService(commentId, id)
    ctx.body = result
  }
  async ListComment(ctx, next) {
    const { momentId } = ctx.query
    const result = await commentService.ListCommentService(momentId)
    ctx.body = result
  }
}

module.exports = new CommentController();