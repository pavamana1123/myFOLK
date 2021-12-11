class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {
        console.log(this.db)
        switch(req.get("endpoint")){
            case "test":
                this.db.query('SELECT * from contacts', function (error, result, fields) {
                    if (error) throw error;
                    res.send(result)
                  });
            default:
        }
    }
}

module.exports = API