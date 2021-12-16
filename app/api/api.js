class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {
        
        var {body} = req

        switch(req.get("endpoint")){
            
            case "test":
                this.db.query('SELECT * from contacts', function (error, result) {
                    if (error) throw error;
                    res.send(result)
                  });
            case "login":
                const {phone, passwordHash} = body
                this.db.query(`SELECT * from contacts where phone="${phone}" and password="${passwordHash}"`, function (error, result) {
                    if (error) throw error;
                    res.send(result)
                  });
            default:
        }
    }
}

module.exports = API