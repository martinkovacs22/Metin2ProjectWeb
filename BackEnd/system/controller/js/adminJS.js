function sideNavber(params) {
    const nav = document.getElementById("nav");
    const content = document.getElementById("content");
    nav.classList.toggle("col-3");col-3 
    nav.classList.toggle("col-5");
    nav.classList.toggle("col-md-2");
    nav.classList.toggle("col-md-4");
    content.classList.toggle("col-9");
    content.classList.toggle("col-7");
    content.classList.toggle("col-md-10");
    content.classList.toggle("col-md-8");
}
window.addEventListener("DOMContentLoaded",(e)=>{
    const navChildren = Array.from(document.getElementById("nav").children);
    // Vagy használhatod a spread operátort is:
    // const navChildren = [...document.getElementById("nav").children];

    navChildren.forEach((item, index) => {
       if (index % 2==0) {
            item.classList.add("bg-black")
            item.classList.add("text-white")
            
       }
       item.classList.add("text-center")
    });
})
