class API {
    constructor(){
        // this.user = auth.user
        // this.phone = auth.phone
        // this.role = auth.role
    }
   
    call(endpoint, body){
        return fetch('/data', {
            method: 'POST',
            headers: {
                // 'Content-Type': 'application/json',
                // user: this.user,
                // phone: this.phone,
                // role: this.role,
                // endpoint
            },
            body: JSON.stringify(body||{}),
        })
    }
}


export default API