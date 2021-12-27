class API {
    constructor(){
        this.user = auth.user
        this.phone = auth.phone
        this.role = auth.role
    }
    setEndpoint(endpoint){
        this.endpoint = endpoint
        return this
    }
   
    async call(){

        const res = await fetch('/api', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                user: this.user,
                phone: this.phone,
                role: this.role,
            },
            body: JSON.stringify({
                func:this.func,
                params: this.params,
                assessmentId: this.assessmentId,
                body: this.body,
                write: this.write,
            }),
        })
        return res.json().then((res)=>{
            if(res.error){
                throw new Error(res.msg)
            }
            if(!res.data){
                throw new Error(`Unexpected response in data: ${res.data}`)
            }
            return res.data
        })
    }
}


export default API