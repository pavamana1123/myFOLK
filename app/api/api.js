class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {

        // console.log(req.body)
        
        var {body} = req

        switch(req.get("endpoint")){
            
            case "test":
                this.db.query('SELECT * from contacts', function (error, result) {
                    if (error) throw error;
                    res.send(result)
                  });
            case "login":
                const {phone, passwordHash} = body
                this.db.query(`SELECT name, phone, password, role from contacts where phone="${phone}"`, function (error, result) {
                    if (error) throw error;
                    if(result.length){
                        if(result.length==1){
                            if(result[0].password===passwordHash){
                                res.status(200)
                                res.send(result[0])
                            }else{
                                res.status(400)
                                res.send({"error":"incorrect password"})
                            }
                        }else{
                            res.status(500)
                            res.send({"error":`multiple users with same phone ${phone} were found`})
                        }
                    }else{
                        res.status(400);
                        res.send({"error":"unauthorised user"})
                    }
                  });
            default:
        }
    }
}



module.exports = API