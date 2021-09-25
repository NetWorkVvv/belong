
const Router = require("koa-router")

const feController = require("../controller/file.controller")

const { AuthorVerify } = require("../middleware/login.verify")
const { avatarUpload, pictureUpload } = require("../middleware/upload.di")

const fileRouter = new Router({ prefix: "/upload" })

fileRouter.post('/avatar', AuthorVerify, avatarUpload, feController.uploadAvatar)
fileRouter.post('/picture', AuthorVerify,pictureUpload,feController.uploadPicture)

module.exports = fileRouter; 