const fileService = require("../service/file.service")
const userService = require("../service/user.service")
const { APP_HOST, APP_PORT } = require("../constants/file.path")

class FileController {
  async uploadAvatar(ctx, next) {
    // console.log(ctx.req.file) 
    // single => file
    const { filename, mimetype, size } = ctx.req.file;
    const { id } = ctx.user;

    const result = await fileService.uploadAvatarService(filename, mimetype, size, id);

    // 将图片地址(url)保存到user表中
    const avatarUrl = `${APP_HOST}:${APP_PORT}/users/${id}/avatar`
    await userService.updateAvatarUrlById(avatarUrl, id)

    ctx.body = result;
  }
  async uploadPicture(ctx, next) {
    // 获取图像信息
    // array => files
    const files = ctx.req.files;
    const { id } = ctx.user;
    const { momentId } = ctx.query;

    // 将所有文件信息保存到数据库
    for (let file of files) {
      const { filename, mimetype, size } = file;
      await fileService.uploadPictureService(filename, mimetype, size, momentId, id);
    }
    ctx.body = "动态配图上传成功";
  }
}

module.exports = new FileController();