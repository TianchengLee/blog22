const express = require('express')
const router = express.Router()
const ctrl = require('../controller/user')

router.get('/register', ctrl.getRegisterHandler)

router.post('/register', ctrl.postRegisterHandler)

router.get('/login', ctrl.getLoginHandler)

router.post('/login', ctrl.postLoginHandler)

module.exports = router