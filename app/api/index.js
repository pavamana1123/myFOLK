const express = require('express')
const app = express()
const port = 3000
const call  = require("./api.js")


var mysql = require('mysql');
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database : 'iskconmy_folk'
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected to db!");
});

app.post('/data', call)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})