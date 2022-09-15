class API {
    constructor(db){
        this.db = db
    }

    call(req, res) {

        var {body} = req
        var self = this
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

            case "/sync":

            var self = this

                var request = require("request");
                var options = { method: 'POST',
                url: 'https://vol.iskconmysore.org/api',
                headers: 
                { 
                    'cache-control': 'no-cache',
                    'content-type': 'application/json' 
                },
                body: { func: 'myfolk' },
                json: true };

                var data = {}

                request(options, function (error, response, body) {
                    if (error) throw new Error(error);
                    if (body.error) throw new Error(body.error);

                    data = body.data

                    if(data===undefined){
                        throw new Error("empty body");
                    }

                    var tables = [
                        "participation",
                        "registrations",
                        "contacts",
                        "calendar",
                        "programs",
                        "preachers"
                    ]
    
                    query = `${tables.map(t=>{
                        return `delete from ${t}`
                    }).join(`;
                    `)};

                    ${tables.reverse().map(t=>{
                        var headers = Object.keys(data[t][0]).sort()
                        return `INSERT INTO ${t} (${headers.join(",")})
                                VALUES
                                    ${data[t].map(r=>{
                                        return `(${headers.map(h=>{
                                            return !!r[h]?(typeof r[h]=="string"?`"${r[h]}"`:r[h]):"NULL"
                                        }).join()})`
                                    }).join(`,
                                    `)}`
                    }).join(`;
                    
                    `)}`

                    self.execQuery(query)
                    .then((result) => {
                        res.send(result)
                    })
                    .catch((err)=>{self.sendError(res, 500, err)})
                });

            break

            case "/contacts":

                var tables = [
                    "contacts",
                    "participation",
                    "calendar"
                ]

                var query = `select * from contacts order by name;
                select * from participation;
                select * from calendar`
                self.execQuery(query)
                .then((result) => {
                    var dat = {}
                    tables.forEach((t,i)=>{
                        dat[t]=result[i]
                    })
                    res.send(dat)
                })
                break    

            case "/attendance/mark":
            var {attendance, eventId, phone} = body
            var query = `insert into participation (phone, eventId, attendance) values("${phone}","${eventId}", ${attendance}) on duplicate key update attendance=${attendance}`

            this.execQuery(query)
            .then((result)=>{
                res.send(result)
            })
            .catch((err)=>{this.sendError(res, 500, err)})
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