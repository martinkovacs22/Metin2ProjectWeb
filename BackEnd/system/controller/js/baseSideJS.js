

function replaceTextRecursively(element, from, to) {
    // Ellenőrizzük és cseréljük ki a 'from' szót, ha az elem szöveges tartalmú
    if (element.nodeType === Node.TEXT_NODE) {
        from.forEach((fromText, index) => {
            const toText = to[index];
            element.textContent = element.textContent.replace(new RegExp(fromText, 'g'), toText);
        });
    }

    // Bejárjuk az aktuális elem összes gyermekét
    element.childNodes.forEach(child => {
        replaceTextRecursively(child, from, to);
    });

}



        function changeLanguage({from,to,componens}) {
            document.querySelector(`img[dataselect=${from}]`).removeAttribute("datasuorce");
            document.querySelector(`img[dataselect=${to}]`).setAttribute("datasuorce","active");

            localStorage.setItem("language",to);
            const json = {from:from,
                    to:to,
                    componens:componens}
            fetch("https://finombanan.v4y.hu/change",{
                method:"POST",
                body:JSON.stringify(json)
            }).then(res=>{return res.json()})
            .then(result=>{
                replaceTextRecursively(document.body, result.data.from.phpSignup,result.data.to.phpSignup)
            })
            .catch(err=>{
                console.log(err);
            })

        }
        document.addEventListener("DOMContentLoaded",(e)=>{
            const locals = window.localStorage;
            if (locals.getItem("language")) {
                changeLanguage({from:"eng",to:locals.getItem("language"),componens:["phpSignup"]})
            }else{
                locals.setItem("language","eng")
                document.querySelector(`img[dataselect=eng]`).setAttribute("datasuorce","active");
            }

            // Lekérjük az összes img elemet, amelynek name attribútuma 'flag'
            let elements = document.querySelectorAll('img[name=flag]');

            // Végigmegyünk az összes ilyen elemen és hozzáadjuk az eseménykezelőt
            elements.forEach(element => {
                element.addEventListener("click", (e) => {
                    e.preventDefault();
                    if (localStorage.getItem("language") !== null) {
                        changeLanguage({from:localStorage.getItem("language"),to:e.target.getAttribute('dataselect'),componens:["phpSignup"]})
                   
                    }else{
                        localStorage.setItem("language",e.target.getAttribute('dataselect'))
                        changeLanguage({from:"eng",to:e.target.getAttribute('dataselect'),componens:["phpSignup"]})
                   
                    }
                });
            });
            window.addEventListener('load', () => {
            const loader = document.getElementById('loader');
            loader.classList.add("loader-overlay-active")
        });
        })

        const download = document.getElementById("download");
        const submit = document.getElementById("submit");
        const signup = document.getElementById("signup");
        download.addEventListener("click", (e) => {
            e.preventDefault();
            alert("You can not download this PATCHER because, we are developing!")
        })
        function getLanguageFromStrint({stringLanguage}){
            var returnValue = null
            switch (stringLanguage) {
                case "eng":
                        returnValue =  "1"
                    break;
                case "por":
                        returnValue =  "2"
                    break;
                case "spa":
                        returnValue =  "3"
                    break;
                case "fra":
                        returnValue =  "4"
                    break;
                case "ger":
                        returnValue =  "5"
                    break;
                case "rom":
                        returnValue =  "6"
                    break;
                case "pol":
                        returnValue =  "7"
                    break;
                case "ita":
                        returnValue =  "8"
                    break;
                case "cze":
                        returnValue =  "9"
                    break;
                case "hun":
                        returnValue =  "10"
                    break;
                case "tur":
                        returnValue =  "11"
                    break;
            
                default:
                    returnValue = "10"
                    break;
            }

            return returnValue;
            
        }
        submit.addEventListener("click",(e)=>{
            e.preventDefault();
            if (document.getElementById("password").value === document.getElementById("repassword").value ) {
                

            
            const state = {
                login:document.getElementById("username").value,
                password:document.getElementById("password").value,
                real_name:document.getElementById("real_name").value ,
                social_id:document.getElementById("social_id").value,
                email:document.getElementById("email").value,
                phone1:document.getElementById("phone1").value,
                address:document.getElementById("address").value,
                zipcode:document.getElementById("zipcode").value,
                language:getLanguageFromStrint({stringLanguage:localStorage.getItem("language")})
            }
            console.log(state);
            fetch("https://finombanan.v4y.hu/signUp",{
  method: 'POST',
  headers: {
    'Content-Type': 'application/json' // Set content type to JSON
  },
  body: JSON.stringify(state) // Convert JSON data to a string and set it as the request body
})
            .then(res => {
                console.log(res);
                return res.json()})
            .then(result=>{
                if (result.err) {
                    alert(result.data);
                    console.log(result.data);
                }else{
                    alert("Sikeres Regisztrálás");
                    console.log(result.data); 
                }
            })
            .catch(err=>{
                console.log(err);
            })
        }else{
            alert("Password is not matching");
        }
        })