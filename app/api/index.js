const express = require('express')
const app = express()
const port = 3000
import call from "./api.js"

app.post('/data', call)

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})