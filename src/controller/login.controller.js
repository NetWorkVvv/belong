
// 引入第三方库 帮助我们处理token
const jwt = require("jsonwebtoken");
const { PRIVATE_KEY } = require("../app/config")
const service = require("../service/user.service")

class LoginUserController {
  async LoginUser(ctx, next) {
    // console.log(ctx.user) 
    // ctx.user 是login.verify验证成功后保存在ctx中的
    const { id, name } = ctx.user
    const token = jwt.sign({ id, name }, PRIVATE_KEY, {
      expiresIn: 60 * 60 * 24, // one day
      // expiresIn: 10,
      algorithm: "RS256"
    })
    ctx.body = { id, name, token }

  }

  async AuthorUser(ctx, next) {
    ctx.body = "用户登录授权成功"
  }

  async UserShowDetailInfo(ctx, next) {
    const { userId } = ctx.params
    const detailInfoResult = await service.UserShowDetailInfoService(userId)
    ctx.body = detailInfoResult
  }
  async UserShowListInfo(ctx, next) {
    const { size, start } = ctx.query
    const listInfoResult = await service.UserShowListInfoService(size, start)
    ctx.body = listInfoResult
  }
}
module.exports = new LoginUserController();