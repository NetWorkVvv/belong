const fs = require("fs")

const MomentService = require("../service/moment.service")
const FileService = require("../service/file.service")
const { PICTURE_PATH } = require("../constants/file.path")

class MomentController {
  async createMoment(ctx, next) {
    const userId = ctx.user.id
    const createContent = ctx.request.body.content
    // console.log(userId, content) 测试拿到的东西

    // 将数据插入到数据库
    const insertResult = await MomentService.insertMoment(userId, createContent)
    ctx.body = insertResult
  }

  // 获得分页内的数据
  async listMoment(ctx, next) {
    // 获取偏移量offset/size => offset=>第几个开始 size=>长度
    // 解构赋值
    const { offset, size } = ctx.query;
    const result = await MomentService.selectListMoment(offset, size)

    ctx.body = result
  }

  // 获得某条动态的详细信息
  async detailMoment(ctx, next) {
    // 获取momentId =>moment.id
    const selectMoment = ctx.params.momentId
    const selectResult = await MomentService.selectDetailMoment(selectMoment)
    console.log("获取动态详细信息的用户:" + selectResult.user.id)
    ctx.body = selectResult
  }

  async updateMoment(ctx, next) {
    const { momentId } = ctx.params
    const updateContent = ctx.request.body.content
    console.log("moment.updateMoment" + updateContent)
    const updateResult = await MomentService.updateMoment(updateContent, momentId)
    ctx.body = updateResult
  }

  async deleteMoment(ctx, next) {
    const { momentId } = ctx.params
    const deleteResult = await MomentService.deleteMoment(momentId)
    ctx.body = "删除成功"
  }

  // 给动态添加标签
  async addLabels(ctx, next) {
    // label.verify => ctx.labels 
    const { labels } = ctx; // 对象{labelName:...,id:...}
    const { momentId } = ctx.params;
    // console.log(labels)

    for (let label of labels) {
      const isExist = await MomentService.hasLabel(momentId, label.id);
      // 如果isExist存在(true)这就不添加 不存在就添加
      if (!isExist) {
        const result = await MomentService.addLabel(momentId, label.id);
      }
    }
    ctx.body = "动态的标签添加成功";
  }
  async showMomentImage(ctx, next) {
    const { filename } = ctx.params;
    const fileInfo = await FileService.showPictureInfo(filename);

    // 设置响应时的内容格式
    ctx.response.set('content-type', fileInfo.mimetype);
    ctx.body = fs.createReadStream(`${PICTURE_PATH}/${filename}`)
  }
}

module.exports = new MomentController();