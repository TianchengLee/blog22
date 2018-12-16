const express = require('express')
const router = express.Router()
const ctrl = require('../controller/article')

router.get('/article/add', ctrl.getArticleAddHandler)

module.exports = router