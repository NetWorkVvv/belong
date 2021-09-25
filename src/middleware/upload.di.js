// const path = require('path')

const Multer = require("koa-multer")
const { AVATAR_PATH, PICTURE_PATH } = require("../constants/file.path")

// const storage = multer.diskStorage({
//   // 目的地
//   destination: (req, file, cb) => {
//     cb(null, "../uploads/avatar")
//   },
//   // 文件名
//   filename: (req, file, cb) => {
//     // 经典用法 时间戳来使文件名不重复 
//     // 通过Node(内置path)来取文件后缀名(path.extname)拼接路径 
//     // multer库中的上传的文件名字
//     cb(null, now.Date() + path.extname(file.originalname))
//   }
// })
// const avatarImageUpload = multer({
//   storage
// })

const avatarImageUpload = Multer({
  dest: AVATAR_PATH
})
const avatarUpload = avatarImageUpload.single("avatar")

const pictureImageUpload = Multer({
  dest: PICTURE_PATH
})
const pictureUpload = pictureImageUpload.array("picture",9)

module.exports = {
  avatarUpload,
  pictureUpload
}