const Router = require("koa-router")

const LlController = require("../controller/label.controller")

const { AuthorVerify } = require("../middleware/login.verify")

const labelRouter = new Router({ prefix: '/label' })

// create label 
labelRouter.post('/', AuthorVerify, LlController.createLabel)
// 标签展示
labelRouter.get('/list',LlController.listLabel)
module.exports = labelRouter;