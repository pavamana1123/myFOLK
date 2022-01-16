import cookie from "../cookie"

const auth = {
    name: cookie.get("name"),
    phone: cookie.get("phone"),
    role: cookie.get("role"),
    redirect: (url)=>{
        const cookiesPresent =  cookie.get("phone") 
        if (url){
            if(cookiesPresent){
                window.open(url,"_self")
            }else{
                return
            }
        }else{
            if(cookiesPresent){
                return
            }else{
                window.open(`/?redirect=${window.location.pathname}`,"_self")
            }
        }
    }
}

export default auth



