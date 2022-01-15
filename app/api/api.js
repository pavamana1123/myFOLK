class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {

        // console.log(req.body)
        
        var {body} = req

        switch(req.get("endpoint")){
            
            case "/test":
                this.db.query('SELECT * from contacts', function (error, result) {
                    if (error) throw error;
                    res.send(result)
                  });
            case "/login":
                const {phone, password} = body
                this.db.query(`SELECT name, phone, password, role from contacts where phone="${phone}"`, function (error, result) {
                    if (error) throw error;
                    if(result.length){
                        if(result.length==1){
                            if(result[0].password===password){
                                res.status(200)
                                res.send(result[0])
                            }else{
                                res.status(401)
                                res.send("Incorrect password")
                            }
                        }else{
                            res.status(500)
                            res.send(`Multiple users with same phone ${phone} were found`)
                        }
                    }else{
                        res.status(401);
                        res.send("Unauthorised user")
                    }
                  });
            default:
        }
    }
}



module.exports = API