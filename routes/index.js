const express = require('express')
const router = express.Router()
const ctrl = require('../controller/index')

router.get('/', ctrl.getIndexHandler)

module.exports = router