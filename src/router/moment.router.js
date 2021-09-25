const Router = require("koa-router");

const MtController = require("../controller/moment.controller")

const { AuthorVerify, LicenseVerify } = require('../middleware/login.verify')
const { LabelExistsVerify } = require("../middleware/label.verify")
const momentRouter = new Router({ prefix: "/moment" })

// 客户端发布动态,把数据发送给服务端,再存储到数据库
momentRouter.post('/', AuthorVerify, MtController.createMoment)
// 查询多个数据 query
momentRouter.get('/lists', MtController.listMoment)
// 根据动态ID获取已发布的动态详情 params
momentRouter.get('/list/:momentId', MtController.detailMoment)
// 修改用户发布的动态 修改的动态的用户 必须等于 动态发布的用户 否则没有权限修改
momentRouter.patch('/update/:momentId', AuthorVerify, LicenseVerify, MtController.updateMoment)
// 删除数据
momentRouter.delete('/delete/:momentId', AuthorVerify, LicenseVerify, MtController.deleteMoment)
// 给动态添加标签
momentRouter.post('/:momentId/labels', AuthorVerify, LicenseVerify, LabelExistsVerify, MtController.addLabels)

// 动态配图
momentRouter.get('/images/:filename',MtController.showMomentImage)
module.exports = momentRouter;