const express = require('express')
const app = express()
app.use(express.json()) 
const port = 3001

const API  = require("./api.js")
var cred = require("./cred.js")
cred.database = 'iskconmy_folk'

var mysql = require('mysql');
var con = mysql.createConnection(cred);

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected to db!");
});

const api = new API(con)

app.post('/data', api.call.bind(api))

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})