const express = require('express')
const router = express.Router()
const ctrl = require('../controller/article')

router.get('/article/add', ctrl.getArticleAddHandler)

router.post('/article/add', ctrl.postArticleAddHandler)

router.get('/article/info/:id', ctrl.getArticleInfoHandler)

router.get('/article/edit/:id', ctrl.getArticleEditHandler)

router.post('/article/edit/:id', ctrl.postArticleEditHandler)

module.exports = router