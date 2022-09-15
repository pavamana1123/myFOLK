const express = require('express')
const app = express()
app.use(express.json()) 
const port = 3005

const API  = require("./api.js")
var cred = require("./cred.js")

cred.database = 'iskconmy_folk'
cred.connectionLimit = 100
cred.multipleStatements = true

var mysql = require('mysql');
var con = mysql.createPool(cred);

const api = new API(con)
app.post('/data', api.call.bind(api))

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})