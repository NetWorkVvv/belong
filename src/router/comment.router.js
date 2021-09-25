
const Router = require("koa-router")

const commentRouter = new Router({ prefix: '/comment' })

const CtController = require("../controller/comment.controller")

const { AuthorVerify, LicenseVerify } = require("../middleware/login.verify")

// 动态的评论
commentRouter.post('/', AuthorVerify, CtController.createComment)
// 动态评论的评论
commentRouter.post('/reply/:commentId', AuthorVerify, CtController.replyComment)
// 修改评论
commentRouter.patch('/update/:commentId', AuthorVerify, LicenseVerify, CtController.updateComment)
// 用户删除自己发布的评论
commentRouter.delete('/delete/:commentId', AuthorVerify, LicenseVerify, CtController.deleteComment)
// 获取评论列表 方法一 另写一个接口
commentRouter.get('/list', CtController.ListComment)

module.exports = commentRouter