const adminlogin = document.getElementById("adminlogin");
const adminpanel = document.getElementById("adminpanel");

window.addEventListener("load",(e)=>{
    e.preventDefault()
    if (localStorage.getItem("token") !== null || localStorage.getItem("token") !== undefined) {
        
    
    fetch("https://finombanan.v4y.hu/verifyLogin",{
        method:"POST",
        body:{},
        headers:{
            token:localStorage.getItem("token")
        }
    }).then(res =>{
        return res.json()
    }).then(result=>{
        if (!result.err) {
            localStorage.setItem("token",result.jwt)
            fetch("https://finombanan.v4y.hu/isAdmin",{
                method:"POST",
                body:{},
                headers:{
                    token:result.jwt
                }
            }).then(res =>{
                return res.json()
            }).then(result=>{
                if (!result.err && result.data[0].result === 1) {
                    console.log(result);
                    // localStorage.setItem("token",result)
                    console.log(result);
                    showAdmin()
                }
                console.log(result);
            }).catch(err=>{
                console.log(err);
            })

           
        }
        console.log(result);
    }).catch(err=>{
        console.log(err);
    })
}
else{
    console.log(localStorage.getItem("token"));
}
})

function showAdmin() {
    localStorage.setItem("expireLogin",Date.now()+5 * 60 * 1000);
    adminlogin.classList.toggle("d-none")
    adminpanel.classList.toggle("d-none")

}
document.getElementById("submit").addEventListener("click",(e)=>{
    e.preventDefault();
    const state = {
        
            loginAndEmail:document.getElementById("text").value,
            password:document.getElementById("password").value
        
    }
    console.log(state);
    fetch("https://finombanan.v4y.hu/login",{
        method:"POST",
        body:JSON.stringify(state)
    }).then(res =>{
        return res.json()
    }).then(result=>{
        if (!result.err) {
            localStorage.setItem("token",result.jwt)
            showAdmin()
        }
        console.log(result);
    }).catch(err=>{
        console.log(err);
    })
    
})