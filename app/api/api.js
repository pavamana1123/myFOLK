class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {

        var {body} = req
        console.log(`api - ${req.get("endpoint")}`)
        
        switch(req.get("endpoint")){

            case "/test":
                this.db.query('SELECT * from contacts', function (error, result) {
                    if (error) throw error;
                    res.send(result)
                  });
                  break

            case "/login":
                var {phone, password} = body
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
                  break

            case "/attendance/people":
                var {date} = body
                var query = `select id from calendar where date="${date}"`

                this.execQuery(query)
                .then((result) => {
                    // no events on given date
                    if(result.length==0) return this.sendError(res, 404, "No events found for the given date")

                    var query = `select participation.name, participation.phone, participation.level, participation.zone,
                    GROUP_CONCAT(participation.eventId) as eventId, GROUP_CONCAT(calendar.parent) as parent from calendar
                    right join (select name, people.phone, level, zone, participation.eventId from people 
                    left join (select * from participation where eventId in (
                        select id from calendar where date="${date}"
                    ) and attendance=true) as participation                        
                    on people.phone=participation.phone order by name) as participation
                    on participation.eventId=calendar.id
                    group by phone order by parent desc, name`

                    return this.execQuery(query)
                })
                .then((result)=>{
                    res.send(result)
                })
                .catch((err)=>{this.sendError(res, 500, err)})

                break

            case "/attendance/mark":
            var {attendance, date, level, phone} = body
            this.db.query(`insert into participation (phone, eventId, attendance) values("${phone}",(
                select id from calendar where date="${date}" and parent="${level}"
            ), ${attendance}) on duplicate key update attendance=${attendance}`, function (error, people) {
                if (error) throw error;
                res.send(people)
            });
            break

            case "/events":
                var {date} = body
                this.db.query(`select * from calendar where date=(SELECT date from calendar where date<="${date}" order by date desc limit 1)`, function (error, events) {
                    if (error) throw error;
                    res.send(events)
                });
                break

            default:
        }
    }


    execQuery(q){
        return new Promise((resolve, reject) => {
            this.db.query(q, (e, result) => {
                if (e) {
                    return reject(e)
                };  
                resolve(result)
            });
        });
    }

    sendError(res, code, msg){
        res.status(code)
        res.send({"error":msg})
    }
}



module.exports = API