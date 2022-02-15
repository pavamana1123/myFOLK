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
                this.db.query(`
                    select people.name, people.phone, people.password, roles.roleId, roles.roleName, roles.roleLevel 
                    from people
                    join roles on people.role=roles.roleId
                    where phone="${phone}"`,
                    
                    function (error, result) {
                        if (error) throw error;
                        if(result.length){
                            if(result.length==1){
                                if(result[0].password===password){
                                    res.status(200)
                                    res.send(result[0])
                                }else{
                                    res.status(404)
                                    res.send({"error":"Incorrect password"})
                                }
                            }else{
                                res.status(500)
                                res.send({"error":`Multiple users with same phone ${phone} were found`})
                            }
                        }else{
                            res.status(404);
                            res.send({"error":"User not found"})
                        }
                  });


                case "/people":
                this.db.query('SELECT * from people order by name', function (error, result) {
                    if (error) throw error;
                    res.send(result)
                });

            default:
        }
    }
}



module.exports = API