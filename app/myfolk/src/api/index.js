import auth from "../auth"

class API {
    constructor(){
        this.name = auth.name
        this.phone = auth.phone
        this.role = auth.role
    }
   
    call(endpoint, body){
        return fetch('/data', {
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
    }
}


export default API