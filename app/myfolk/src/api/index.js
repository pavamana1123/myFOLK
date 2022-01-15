import auth from "../auth"

class API {
    constructor(){
        this.name = auth.name
        this.phone = auth.phone
        this.role = auth.role
    }
   
    async call(endpoint, body){
        const res = await fetch('/data', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                name: this.name,
                phone: this.phone,
                role: this.role,
                endpoint
            },
            body: JSON.stringify(body||{}),
        })

        return res.json().then((r)=>{
            return {
                status: res.status,
                body: r,
                error: r.error
            }
        })
    }
}


export default API