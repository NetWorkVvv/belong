
const userService = require("../service/user.service");
const fileService = require("../service/file.service")
const fs = require("fs")

const { AVATAR_PATH } = require("../constants/file.path")
// 用户操作的逻辑
class UserController {
  async create(ctx, next) {
    // 获取用户传递的参数
    const userRegistration = ctx.request.body;
    // SQL
    const userResult = await userService.create(userRegistration);
    // 返回数据
    ctx.body = "用户注册成功";
  }
  async avatarInfo(ctx, next) {
    const { userId } = ctx.params;
    const avatarInfoResult = await fileService.getAvatarInfoService(userId);
    // body 可传JSON/Buffer/Stream/Object...等

    // 设置响应的数据格式  result.mimetype => 数据库保存的文件格式
    ctx.response.set("content-type", avatarInfoResult.mimetype)
    // 把图片展示
    ctx.body = fs.createReadStream(`${AVATAR_PATH}/${avatarInfoResult.filename}`);
  }

  
}

module.exports = new UserController();
// 类函数必须要用new调用
// 相当于 外部导入new UserController() 然后再
// class UserController { async create(ctx, next) {} }